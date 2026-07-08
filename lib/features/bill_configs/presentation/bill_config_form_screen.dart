import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../data/bill_configs_repository.dart';
import '../data/models/bill_config.dart';
import '../../../l10n/app_localizations.dart';

List<(String, String)> _heads(AppLocalizations loc) => [
      ('SERVICE_CHARGE', loc.billHeadServiceCharge),
      ('WASTE_BILL', loc.billHeadWasteBill),
      ('ELECTRICITY_RATE_PER_UNIT', loc.billHeadElectricityRate),
      ('CUSTOM', loc.billHeadCustom),
    ];

Map<String, String> _headDefaults(AppLocalizations loc) => {
      'SERVICE_CHARGE': loc.billHeadServiceCharge,
      'WASTE_BILL': loc.billHeadWasteBill,
      'ELECTRICITY_RATE_PER_UNIT': loc.billHeadElectricityRateShort,
      'CUSTOM': '',
    };

class BillConfigFormScreen extends ConsumerStatefulWidget {
  const BillConfigFormScreen({
    super.key,
    required this.houseId,
    this.existing,
  });

  final String houseId;

  /// Non-null → update mode: head is locked, form pre-fills from this config.
  final BillConfig? existing;

  @override
  ConsumerState<BillConfigFormScreen> createState() =>
      _BillConfigFormScreenState();
}

class _BillConfigFormScreenState
    extends ConsumerState<BillConfigFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _head;
  late final TextEditingController _labelCtrl;
  late final TextEditingController _amountCtrl;
  DateTime _effectiveFrom = _today();
  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};

  bool get _isUpdateMode => widget.existing != null;

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  void initState() {
    super.initState();
    final loc = AppLocalizations.of(context)!;
    final ex = widget.existing;
    if (ex != null) {
      _head = ex.head;
      _labelCtrl = TextEditingController(text: ex.label);
      _amountCtrl = TextEditingController(text: ex.amount);
    } else {
      _head = _heads(loc).first.$1;
      _labelCtrl =
          TextEditingController(text: _headDefaults(loc)[_head] ?? '');
      _amountCtrl = TextEditingController();
    }
  }

  @override
  void dispose() {
    _labelCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  void _onHeadChanged(String? v) {
    if (v == null) return;
    final loc = AppLocalizations.of(context)!;
    final defaultLabel = _headDefaults(loc)[v] ?? '';
    setState(() {
      final prevDefault = _headDefaults(loc)[_head] ?? '';
      _head = v;
      if (_labelCtrl.text == prevDefault) {
        _labelCtrl.text = defaultLabel;
      }
    });
  }

  Future<void> _pickDate() async {
    final loc = AppLocalizations.of(context)!;
    final today = _today();
    final picked = await showDatePicker(
      context: context,
      initialDate: _effectiveFrom.isBefore(today) ? today : _effectiveFrom,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365 * 5)),
      helpText: loc.effectiveFromFieldLabel,
    );
    if (picked != null) {
      setState(() {
        _effectiveFrom = picked;
        _fieldErrors.remove('effective_from');
      });
    }
  }

  void _clearFieldError(String key) {
    if (_fieldErrors.containsKey(key)) {
      setState(() => _fieldErrors.remove(key));
    }
  }

  Future<void> _submit() async {
    final loc = AppLocalizations.of(context)!;
    setState(() => _fieldErrors = {});
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(billConfigsRepositoryProvider).addConfig(
            widget.houseId,
            head: _head,
            label: _labelCtrl.text.trim(),
            amount: _amountCtrl.text.trim(),
            effectiveFrom: _formatDate(_effectiveFrom),
          );
      if (!mounted) return;
      if (_isUpdateMode) {
        context.pop();
      } else {
        context.go('/houses/${widget.houseId}/bill-configs');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(_isUpdateMode ? loc.billHeadUpdated : loc.billHeadAdded),
        ),
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
    final isElec = _head == 'ELECTRICITY_RATE_PER_UNIT';
    final headLabel = _heads(loc)
        .firstWhere((h) => h.$1 == _head, orElse: () => (_head, _head))
        .$2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            _isUpdateMode ? loc.updateBillHeadAppBarTitle : loc.addBillHeadAppBarTitle),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── Head (locked in update mode) ─────────────────────────────────
            if (_isUpdateMode)
              InputDecorator(
                decoration: InputDecoration(labelText: loc.billHeadFieldLabel),
                child: Text(headLabel),
              )
            else
              DropdownButtonFormField<String>(
                initialValue: _head,
                decoration:
                    InputDecoration(labelText: '${loc.billHeadFieldLabel} *'),
                items: _heads(loc)
                    .map((h) => DropdownMenuItem(
                          value: h.$1,
                          child: Text(h.$2),
                        ))
                    .toList(),
                onChanged: _onHeadChanged,
                validator: (v) => v == null ? loc.pleaseSelectAHead : null,
              ),
            const SizedBox(height: 16),

            // ── Label ────────────────────────────────────────────────────
            TextFormField(
              controller: _labelCtrl,
              textCapitalization: TextCapitalization.words,
              decoration:
                  InputDecoration(labelText: '${loc.labelFieldLabel} *'),
              validator: (v) {
                if (_fieldErrors.containsKey('label')) {
                  return _fieldErrors['label'];
                }
                if (v == null || v.trim().isEmpty) return loc.labelRequired;
                return null;
              },
              onChanged: (_) => _clearFieldError('label'),
            ),
            const SizedBox(height: 16),

            // ── Amount ───────────────────────────────────────────────────
            TextFormField(
              controller: _amountCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              ],
              decoration: InputDecoration(
                labelText: '${loc.amountFieldLabel} *',
                prefixText: '৳',
                suffixText: isElec ? loc.perUnitSuffix : null,
                hintText: isElec ? '10.00' : '500.00',
              ),
              validator: (v) {
                if (_fieldErrors.containsKey('amount')) {
                  return _fieldErrors['amount'];
                }
                if (v == null || v.trim().isEmpty) return loc.amountRequired;
                try {
                  final d = Decimal.parse(v.trim());
                  if (d <= Decimal.zero) return loc.amountMustBePositive;
                } catch (_) {
                  return loc.enterValidNumber;
                }
                return null;
              },
              onChanged: (_) => _clearFieldError('amount'),
            ),
            const SizedBox(height: 16),

            // ── Effective from date picker ────────────────────────────────
            FormField<DateTime>(
              validator: (_) => _fieldErrors.containsKey('effective_from')
                  ? _fieldErrors['effective_from']
                  : null,
              builder: (field) => InkWell(
                onTap: _pickDate,
                borderRadius: BorderRadius.circular(4),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: '${loc.effectiveFromFieldLabel} *',
                    suffixIcon: const Icon(Icons.calendar_today, size: 18),
                    errorText: field.errorText,
                  ),
                  child: Text(_formatDate(_effectiveFrom)),
                ),
              ),
            ),
            const SizedBox(height: 24),

            FilledButton(
              onPressed: _isSubmitting ? null : _submit,
              child: _isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(loc.save),
            ),
          ],
        ),
      ),
    );
  }
}
