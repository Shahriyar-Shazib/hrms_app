import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../l10n/app_localizations.dart';
import '../application/expenses_controller.dart';
import '../data/expenses_repository.dart';
import '../data/models/expense.dart';
import 'expenses_screen.dart' show categoryLabels;

const _categoryKeys = [
  'REPAIR',
  'MAINTENANCE',
  'STAFF_SALARY',
  'UTILITY_BILL',
  'CUSTOM',
];

class ExpenseFormScreen extends ConsumerStatefulWidget {
  const ExpenseFormScreen({
    super.key,
    required this.houseId,
    this.existing,
  });

  final String houseId;

  /// Non-null → edit mode.
  final Expense? existing;

  @override
  ConsumerState<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends ConsumerState<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _category;
  late final TextEditingController _labelCtrl;
  late final TextEditingController _amountCtrl;
  late final TextEditingController _paidToCtrl;
  late final TextEditingController _notesCtrl;
  late DateTime _expenseDate;
  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};
  bool _labelDefaultApplied = false;

  bool get _isEditMode => widget.existing != null;

  static DateTime _today() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  static DateTime _parseDate(String s) {
    final parts = s.split('-').map(int.parse).toList();
    return DateTime(parts[0], parts[1], parts[2]);
  }

  @override
  void initState() {
    super.initState();
    final ex = widget.existing;
    if (ex != null) {
      _category = ex.category;
      _labelCtrl = TextEditingController(text: ex.label);
      _amountCtrl = TextEditingController(text: ex.amount);
      _paidToCtrl = TextEditingController(text: ex.paidTo ?? '');
      _notesCtrl = TextEditingController(text: ex.notes ?? '');
      _expenseDate = _parseDate(ex.expenseDate);
    } else {
      _category = _categoryKeys.first;
      _labelCtrl = TextEditingController();
      _amountCtrl = TextEditingController();
      _paidToCtrl = TextEditingController();
      _notesCtrl = TextEditingController();
      _expenseDate = _today();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_labelDefaultApplied && !_isEditMode) {
      final loc = AppLocalizations.of(context)!;
      _labelCtrl.text = categoryLabels(loc)[_category] ?? '';
      _labelDefaultApplied = true;
    }
  }

  @override
  void dispose() {
    _labelCtrl.dispose();
    _amountCtrl.dispose();
    _paidToCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  void _onCategoryChanged(String? v) {
    if (v == null) return;
    final loc = AppLocalizations.of(context)!;
    final defaultLabel = categoryLabels(loc)[v] ?? '';
    setState(() {
      final prevDefault = categoryLabels(loc)[_category] ?? '';
      _category = v;
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
      initialDate: _expenseDate.isAfter(today) ? today : _expenseDate,
      firstDate: DateTime(today.year - 5),
      lastDate: today,
      helpText: loc.expenseDateLabel,
    );
    if (picked != null) {
      setState(() {
        _expenseDate = picked;
        _fieldErrors.remove('expense_date');
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
      final repo = ref.read(expensesRepositoryProvider);
      if (_isEditMode) {
        await repo.updateExpense(
          widget.houseId,
          widget.existing!.id,
          category: _category,
          label: _labelCtrl.text.trim(),
          amount: _amountCtrl.text.trim(),
          expenseDate: _formatDate(_expenseDate),
          paidTo: _paidToCtrl.text.trim(),
          notes: _notesCtrl.text.trim(),
        );
      } else {
        await repo.createExpense(
          widget.houseId,
          category: _category,
          label: _labelCtrl.text.trim(),
          amount: _amountCtrl.text.trim(),
          expenseDate: _formatDate(_expenseDate),
          paidTo: _paidToCtrl.text.trim(),
          notes: _notesCtrl.text.trim(),
        );
      }
      if (!mounted) return;
      final loc = AppLocalizations.of(context)!;
      ref.invalidate(expensesProvider);
      if (_isEditMode) {
        context.pop();
      } else {
        context.go('/houses/${widget.houseId}/expenses');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                _isEditMode ? loc.expenseUpdated : loc.expenseAdded)),
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
      appBar: AppBar(
        title: Text(_isEditMode ? loc.editExpenseAppBarTitle : loc.addExpenseAppBarTitle),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── Category ────────────────────────────────────────────────
            DropdownButtonFormField<String>(
              initialValue: _category,
              decoration: InputDecoration(labelText: '${loc.categoryFieldLabel} *'),
              items: _categoryKeys
                  .map((k) => DropdownMenuItem(
                        value: k,
                        child: Text(categoryLabels(loc)[k] ?? k),
                      ))
                  .toList(),
              onChanged: _onCategoryChanged,
              validator: (v) => v == null ? loc.categoryRequired : null,
            ),
            const SizedBox(height: 16),

            // ── Label ────────────────────────────────────────────────────
            TextFormField(
              controller: _labelCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: '${loc.labelFieldLabel} *'),
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

            // ── Expense date ─────────────────────────────────────────────
            FormField<DateTime>(
              validator: (_) => _fieldErrors.containsKey('expense_date')
                  ? _fieldErrors['expense_date']
                  : null,
              builder: (field) => InkWell(
                onTap: _pickDate,
                borderRadius: BorderRadius.circular(4),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: '${loc.expenseDateLabel} *',
                    suffixIcon: const Icon(Icons.calendar_today, size: 18),
                    errorText: field.errorText,
                  ),
                  child: Text(_formatDate(_expenseDate)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ── Paid to ──────────────────────────────────────────────────
            TextFormField(
              controller: _paidToCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: loc.paidToLabel),
              validator: (v) => _fieldErrors['paid_to'],
              onChanged: (_) => _clearFieldError('paid_to'),
            ),
            const SizedBox(height: 16),

            // ── Notes ────────────────────────────────────────────────────
            TextFormField(
              controller: _notesCtrl,
              maxLines: 3,
              decoration: InputDecoration(labelText: loc.notesLabel),
              validator: (v) => _fieldErrors['notes'],
              onChanged: (_) => _clearFieldError('notes'),
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
