import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../application/meter_readings_controller.dart';
import '../data/meter_readings_repository.dart';
import '../data/models/meter_reading.dart';
import '../../../l10n/app_localizations.dart';

String _monthName(AppLocalizations loc, int month) => [
      loc.monthName1,
      loc.monthName2,
      loc.monthName3,
      loc.monthName4,
      loc.monthName5,
      loc.monthName6,
      loc.monthName7,
      loc.monthName8,
      loc.monthName9,
      loc.monthName10,
      loc.monthName11,
      loc.monthName12,
    ][month - 1];

class MeterReadingAdjustScreen extends ConsumerStatefulWidget {
  const MeterReadingAdjustScreen({
    super.key,
    required this.houseId,
    required this.roomId,
    required this.original,
  });

  final String houseId;
  final String roomId;

  /// The NORMAL reading being corrected.
  final MeterReading original;

  @override
  ConsumerState<MeterReadingAdjustScreen> createState() =>
      _MeterReadingAdjustScreenState();
}

class _MeterReadingAdjustScreenState
    extends ConsumerState<MeterReadingAdjustScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentReadingCtrl = TextEditingController();
  final _rateOverrideCtrl = TextEditingController();

  late DateTime _readingDate;
  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};

  /// last day of next month — same ceiling as normal readings.
  DateTime get _lastAllowedDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month + 2, 0);
  }

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _readingDate = DateTime(now.year, now.month, now.day);
  }

  @override
  void dispose() {
    _currentReadingCtrl.dispose();
    _rateOverrideCtrl.dispose();
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
    final loc = AppLocalizations.of(context)!;
    setState(() => _fieldErrors = {});
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(meterReadingsRepositoryProvider).adjustReading(
            widget.houseId,
            widget.roomId,
            adjustsReadingId: widget.original.id,
            currentReading: _currentReadingCtrl.text.trim(),
            readingDate: _fmt(_readingDate),
            rateOverride: _rateOverrideCtrl.text.trim().isEmpty
                ? null
                : _rateOverrideCtrl.text.trim(),
          );
      if (!mounted) return;
      ref.invalidate(
          meterReadingsProvider((widget.houseId, widget.roomId)));
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.adjustmentSaved)),
      );
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
          SnackBar(content: Text(loc.mustBeOnlineToSave)),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final orig = widget.original;
    final month = _monthName(loc, orig.billingPeriodMonth);

    return Scaffold(
      appBar: AppBar(title: Text(loc.adjustReadingAppBarTitle)),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              // ── Original reading context (read-only) ──────────────────────
              Card(
                color: theme.colorScheme.surfaceContainerHighest,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.correctingReadingFor,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$month ${orig.billingPeriodYear}',
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        loc.currentReadingLine(
                            orig.currentReading, orig.rateSnapshot),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ── Corrected current reading ──────────────────────────────────
              TextFormField(
                controller: _currentReadingCtrl,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: InputDecoration(
                  labelText: '${loc.correctedReadingLabel} *',
                  hintText: loc.correctedReadingHint,
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('current_reading')) {
                    return _fieldErrors['current_reading'];
                  }
                  if (v == null || v.trim().isEmpty) {
                    return loc.correctedReadingRequired;
                  }
                  final n = double.tryParse(v.trim());
                  if (n == null || n < 0) return loc.nonNegativeNumberRequired;
                  return null;
                },
                onChanged: (_) => _clearFieldError('current_reading'),
              ),
              const SizedBox(height: 16),

              // ── Reading date ───────────────────────────────────────────────
              InkWell(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: '${loc.readingDateLabel} *',
                    suffixIcon: const Icon(Icons.calendar_today, size: 18),
                    errorText: _fieldErrors['reading_date'],
                  ),
                  child: Text(_fmt(_readingDate)),
                ),
              ),
              const SizedBox(height: 16),

              // ── Rate override (optional) ───────────────────────────────────
              TextFormField(
                controller: _rateOverrideCtrl,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                decoration: InputDecoration(
                  labelText: loc.rateOverrideLabel,
                  prefixText: '৳',
                  hintText: loc.rateOverrideHint,
                  helperText: loc.rateOverrideHelper,
                  errorText: _fieldErrors['rate_override'],
                ),
                validator: (v) {
                  if (_fieldErrors.containsKey('rate_override')) {
                    return _fieldErrors['rate_override'];
                  }
                  if (v != null && v.trim().isNotEmpty) {
                    final n = double.tryParse(v.trim());
                    if (n == null || n < 0) return loc.nonNegativeNumberRequired;
                  }
                  return null;
                },
                onChanged: (_) => _clearFieldError('rate_override'),
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
                    : Text(loc.saveAdjustmentButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
