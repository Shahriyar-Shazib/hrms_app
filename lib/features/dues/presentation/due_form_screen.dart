import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../l10n/app_localizations.dart';
import '../../collection/application/collection_controller.dart';
import '../application/dues_controller.dart';
import '../data/dues_repository.dart';

const _headKeys = [
  'ELECTRICITY',
  'SERVICE_CHARGE',
  'WASTE_BILL',
  'RENT',
  'CUSTOM',
];

Map<String, String> _headLabels(AppLocalizations loc) => {
      'ELECTRICITY': loc.dueHeadElectricity,
      'SERVICE_CHARGE': loc.billHeadServiceCharge,
      'WASTE_BILL': loc.billHeadWasteBill,
      'RENT': loc.dueHeadRent,
      'CUSTOM': '',
    };

class DueFormScreen extends ConsumerStatefulWidget {
  const DueFormScreen({
    super.key,
    required this.houseId,
    required this.renterId,
  });

  final String houseId;
  final String renterId;

  @override
  ConsumerState<DueFormScreen> createState() => _DueFormScreenState();
}

class _DueFormScreenState extends ConsumerState<DueFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _head = _headKeys.first;
  late final TextEditingController _headLabelCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  final _reasonCtrl = TextEditingController();
  DateTime _dueDate = _today();
  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};
  bool _headLabelDefaultApplied = false;

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_headLabelDefaultApplied) {
      final loc = AppLocalizations.of(context)!;
      _headLabelCtrl.text = _headLabels(loc)[_head] ?? '';
      _headLabelDefaultApplied = true;
    }
  }

  @override
  void dispose() {
    _headLabelCtrl.dispose();
    _amountCtrl.dispose();
    _reasonCtrl.dispose();
    super.dispose();
  }

  void _onHeadChanged(String? v) {
    if (v == null) return;
    final loc = AppLocalizations.of(context)!;
    final defaultLabel = _headLabels(loc)[v] ?? '';
    setState(() {
      final prevDefault = _headLabels(loc)[_head] ?? '';
      _head = v;
      if (_headLabelCtrl.text == prevDefault) {
        _headLabelCtrl.text = defaultLabel;
      }
    });
  }

  Future<void> _pickDate() async {
    final loc = AppLocalizations.of(context)!;
    final today = _today();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(today.year - 1),
      lastDate: today.add(const Duration(days: 365)),
      helpText: loc.dueDateLabel,
    );
    if (picked != null) {
      setState(() {
        _dueDate = picked;
        _fieldErrors.remove('due_date');
      });
    }
  }

  void _clearFieldError(String key) {
    if (_fieldErrors.containsKey(key)) {
      setState(() => _fieldErrors.remove(key));
    }
  }

  Future<void> _submit() async {
    setState(() => _fieldErrors = {});
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(duesRepositoryProvider).addDue(
            widget.houseId,
            widget.renterId,
            head: _head,
            headLabel: _headLabelCtrl.text.trim(),
            amount: _amountCtrl.text.trim(),
            dueDate: _formatDate(_dueDate),
            reason: _reasonCtrl.text.trim(),
          );
      if (!mounted) return;
      ref.invalidate(duesProvider((widget.houseId, widget.renterId)));
      ref.invalidate(previewProvider((widget.houseId, widget.renterId)));
      context.go('/houses/${widget.houseId}/renters/${widget.renterId}/dues');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.dueAdded)));
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
          SnackBar(
              content:
                  Text(AppLocalizations.of(context)!.mustBeOnlineToSave)),
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
    return Scaffold(
      appBar: AppBar(title: Text(loc.addDueAppBarTitle)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<String>(
              initialValue: _head,
              decoration: InputDecoration(labelText: '${loc.billHeadFieldLabel} *'),
              items: _headKeys
                  .map((k) => DropdownMenuItem(
                        value: k,
                        child: Text(_headLabels(loc)[k] ?? k),
                      ))
                  .toList(),
              onChanged: _onHeadChanged,
              validator: (v) => v == null ? loc.pleaseSelectAHead : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _headLabelCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: '${loc.labelFieldLabel} *'),
              validator: (v) {
                if (_fieldErrors.containsKey('head_label')) {
                  return _fieldErrors['head_label'];
                }
                if (v == null || v.trim().isEmpty) return loc.labelRequired;
                return null;
              },
              onChanged: (_) => _clearFieldError('head_label'),
            ),
            const SizedBox(height: 16),
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
                hintText: '500.00',
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
            FormField<DateTime>(
              validator: (_) => _fieldErrors.containsKey('due_date')
                  ? _fieldErrors['due_date']
                  : null,
              builder: (field) => InkWell(
                onTap: _pickDate,
                borderRadius: BorderRadius.circular(4),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: '${loc.dueDateLabel} *',
                    suffixIcon: const Icon(Icons.calendar_today, size: 18),
                    errorText: field.errorText,
                  ),
                  child: Text(_formatDate(_dueDate)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reasonCtrl,
              maxLines: 2,
              decoration: InputDecoration(labelText: '${loc.reasonLabel} *'),
              validator: (v) {
                if (_fieldErrors.containsKey('reason')) {
                  return _fieldErrors['reason'];
                }
                if (v == null || v.trim().isEmpty) {
                  return loc.reasonRequired;
                }
                return null;
              },
              onChanged: (_) => _clearFieldError('reason'),
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
