import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../application/meter_readings_controller.dart';
import '../data/meter_readings_repository.dart';

const _monthNames = [
  '',
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

class MeterReadingFormScreen extends ConsumerStatefulWidget {
  const MeterReadingFormScreen({
    super.key,
    required this.houseId,
    required this.roomId,
    required this.isFirstReading,
  });

  final String houseId;
  final String roomId;

  /// True when the room has no readings yet — server requires previous_reading.
  final bool isFirstReading;

  @override
  ConsumerState<MeterReadingFormScreen> createState() =>
      _MeterReadingFormScreenState();
}

class _MeterReadingFormScreenState
    extends ConsumerState<MeterReadingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentReadingCtrl = TextEditingController();
  final _previousReadingCtrl = TextEditingController();

  late DateTime _readingDate;
  late int _billingMonth;
  late int _billingYear;

  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};

  /// last day of next month — the API's hard ceiling for reading_date.
  DateTime get _lastAllowedDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 2, 0);
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _readingDate = now;
    _billingMonth = now.month;
    _billingYear = now.year;
  }

  @override
  void dispose() {
    _currentReadingCtrl.dispose();
    _previousReadingCtrl.dispose();
    super.dispose();
  }

  String _fmt(DateTime dt) => dt.toIso8601String().substring(0, 10);

  void _clearFieldError(String key) {
    if (_fieldErrors.containsKey(key)) {
      setState(() => _fieldErrors.remove(key));
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _readingDate,
      firstDate: DateTime(now.year - 2),
      lastDate: _lastAllowedDate,
    );
    if (picked != null) {
      setState(() => _readingDate = picked);
      _clearFieldError('reading_date');
    }
  }

  Future<void> _submit() async {
    setState(() => _fieldErrors = {});
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isSubmitting = true);
    try {
      await ref
          .read(meterReadingsRepositoryProvider)
          .addReading(
            widget.houseId,
            widget.roomId,
            currentReading: _currentReadingCtrl.text.trim(),
            readingDate: _fmt(_readingDate),
            billingPeriodYear: _billingYear,
            billingPeriodMonth: _billingMonth,
            previousReading: widget.isFirstReading
                ? _previousReadingCtrl.text.trim()
                : null,
          );
      if (!mounted) return;
      ref.invalidate(meterReadingsProvider((widget.houseId, widget.roomId)));
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Reading saved')));
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.code == 'VALIDATION_FAILED' && e.details is Map) {
        final raw = e.details as Map<String, dynamic>;
        final errors = <String, String>{};
        for (final entry in raw.entries) {
          final msgs = entry.value;
          if (msgs is List && msgs.isNotEmpty) {
            errors[entry.key] = msgs.first.toString();
          }
        }
        setState(() => _fieldErrors = errors);
        _formKey.currentState!.validate();
      } else if (e.code == 'NETWORK_ERROR') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You must be online to save.')),
        );
      } else {
        // READING_ALREADY_EXISTS, ROOM_HAS_NO_METER,
        // FIRST_READING_NEEDS_PREVIOUS, and any other server errors.
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Meter Reading')),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              // ── Current reading ────────────────────────────────────────────
              TextFormField(
                controller: _currentReadingCtrl,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: const InputDecoration(
                  labelText: 'Current Reading (kWh) *',
                  hintText: 'e.g. 1640',
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('current_reading')) {
                    return _fieldErrors['current_reading'];
                  }
                  if (v == null || v.trim().isEmpty) {
                    return 'Current reading is required';
                  }
                  final n = double.tryParse(v.trim());
                  if (n == null || n < 0) return 'Must be a non-negative number';
                  return null;
                },
                onChanged: (_) => _clearFieldError('current_reading'),
              ),

              // ── Previous reading (first reading only) ──────────────────────
              if (widget.isFirstReading) ...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: _previousReadingCtrl,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Previous Reading (kWh) *',
                    hintText: 'Starting meter reading (required for first entry)',
                  ),
                  validator: (v) {
                    if (_fieldErrors.containsKey('previous_reading')) {
                      return _fieldErrors['previous_reading'];
                    }
                    if (widget.isFirstReading &&
                        (v == null || v.trim().isEmpty)) {
                      return 'Required for the first reading';
                    }
                    if (v != null && v.trim().isNotEmpty) {
                      final n = double.tryParse(v.trim());
                      if (n == null || n < 0) {
                        return 'Must be a non-negative number';
                      }
                    }
                    return null;
                  },
                  onChanged: (_) => _clearFieldError('previous_reading'),
                ),
              ],

              // ── Reading date ───────────────────────────────────────────────
              const SizedBox(height: 16),
              InkWell(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Reading Date *',
                    suffixIcon:
                        const Icon(Icons.calendar_today, size: 18),
                    errorText: _fieldErrors['reading_date'],
                  ),
                  child: Text(_fmt(_readingDate)),
                ),
              ),

              // ── Billing period ─────────────────────────────────────────────
              const SizedBox(height: 20),
              Text(
                'Billing Period',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Month dropdown
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField<int>(
                      key: ValueKey(_billingMonth),
                      initialValue: _billingMonth,
                      decoration: const InputDecoration(labelText: 'Month *'),
                      items: List.generate(
                        12,
                        (i) => DropdownMenuItem(
                          value: i + 1,
                          child: Text(_monthNames[i + 1]),
                        ),
                      ),
                      onChanged: (v) {
                        if (v != null) setState(() => _billingMonth = v);
                        _clearFieldError('billing_period_month');
                      },
                      validator: (v) => _fieldErrors
                              .containsKey('billing_period_month')
                          ? _fieldErrors['billing_period_month']
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Year stepper
                  Expanded(
                    flex: 2,
                    child: _YearStepper(
                      year: _billingYear,
                      onChanged: (y) {
                        setState(() => _billingYear = y);
                        _clearFieldError('billing_period_year');
                      },
                      errorText: _fieldErrors['billing_period_year'],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),
              FilledButton(
                onPressed: _isSubmitting ? null : _submit,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save Reading'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A compact +/- stepper for the billing year.
class _YearStepper extends StatelessWidget {
  const _YearStepper({
    required this.year,
    required this.onChanged,
    this.errorText,
  });

  final int year;
  final ValueChanged<int> onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDecorator(
          decoration: InputDecoration(
            labelText: 'Year *',
            errorText: errorText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: year > 2000 ? () => onChanged(year - 1) : null,
                child: const Icon(Icons.remove, size: 18),
              ),
              Text('$year',
                  style: Theme.of(context).textTheme.bodyMedium),
              InkWell(
                onTap: year < 2100 ? () => onChanged(year + 1) : null,
                child: const Icon(Icons.add, size: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
