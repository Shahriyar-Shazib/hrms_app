import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../collection/application/collection_controller.dart';
import '../application/dues_controller.dart';
import '../data/dues_repository.dart';

const _heads = [
  ('ELECTRICITY', 'Electricity'),
  ('SERVICE_CHARGE', 'Service Charge'),
  ('WASTE_BILL', 'Waste Bill'),
  ('RENT', 'Rent'),
  ('CUSTOM', 'Custom'),
];

const _headDefaults = {
  'ELECTRICITY': 'Electricity',
  'SERVICE_CHARGE': 'Service Charge',
  'WASTE_BILL': 'Waste Bill',
  'RENT': 'Rent',
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
  String _head = _heads.first.$1;
  late final TextEditingController _headLabelCtrl =
      TextEditingController(text: _headDefaults[_head] ?? '');
  final _amountCtrl = TextEditingController();
  final _reasonCtrl = TextEditingController();
  DateTime _dueDate = _today();
  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  @override
  void dispose() {
    _headLabelCtrl.dispose();
    _amountCtrl.dispose();
    _reasonCtrl.dispose();
    super.dispose();
  }

  void _onHeadChanged(String? v) {
    if (v == null) return;
    final defaultLabel = _headDefaults[v] ?? '';
    setState(() {
      final prevDefault = _headDefaults[_head] ?? '';
      _head = v;
      if (_headLabelCtrl.text == prevDefault) {
        _headLabelCtrl.text = defaultLabel;
      }
    });
  }

  Future<void> _pickDate() async {
    final today = _today();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(today.year - 1),
      lastDate: today.add(const Duration(days: 365)),
      helpText: 'Due date',
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
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Due added')));
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
      appBar: AppBar(title: const Text('Add Due')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<String>(
              initialValue: _head,
              decoration: const InputDecoration(labelText: 'Head *'),
              items: _heads
                  .map((h) => DropdownMenuItem(
                        value: h.$1,
                        child: Text(h.$2),
                      ))
                  .toList(),
              onChanged: _onHeadChanged,
              validator: (v) => v == null ? 'Please select a head' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _headLabelCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Label *'),
              validator: (v) {
                if (_fieldErrors.containsKey('head_label')) {
                  return _fieldErrors['head_label'];
                }
                if (v == null || v.trim().isEmpty) return 'Label is required';
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
              decoration: const InputDecoration(
                labelText: 'Amount *',
                prefixText: '৳',
                hintText: '500.00',
              ),
              validator: (v) {
                if (_fieldErrors.containsKey('amount')) {
                  return _fieldErrors['amount'];
                }
                if (v == null || v.trim().isEmpty) return 'Amount is required';
                try {
                  final d = Decimal.parse(v.trim());
                  if (d <= Decimal.zero) return 'Amount must be positive';
                } catch (_) {
                  return 'Enter a valid number';
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
                    labelText: 'Due Date *',
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
              decoration: const InputDecoration(labelText: 'Reason *'),
              validator: (v) {
                if (_fieldErrors.containsKey('reason')) {
                  return _fieldErrors['reason'];
                }
                if (v == null || v.trim().isEmpty) {
                  return 'Reason is required';
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
                  : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
