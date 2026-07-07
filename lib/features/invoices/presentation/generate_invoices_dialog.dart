import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../data/invoices_repository.dart';
import '../data/models/invoice.dart';

const _monthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

const _billHeadOptions = [
  ('SERVICE_CHARGE', 'Service Charge'),
  ('WASTE_BILL', 'Waste Bill'),
  ('CUSTOM', 'Custom'),
];

const _warningTypeLabels = {
  'electricity_missing': 'electricity reading missing',
};

/// Shows the generate-invoices confirmation flow. Returns the
/// [GenerateResult] on success, or null if cancelled / left after a failure
/// (errors are shown inline in the dialog itself, caller doesn't need to).
Future<GenerateResult?> showGenerateInvoicesDialog(
  BuildContext context, {
  required String houseId,
  required int initialYear,
  required int initialMonth,
}) {
  return showDialog<GenerateResult>(
    context: context,
    builder: (_) => _GenerateInvoicesDialog(
      houseId: houseId,
      initialYear: initialYear,
      initialMonth: initialMonth,
    ),
  );
}

/// Shows the post-generation result summary.
Future<void> showGenerateResultDialog(
  BuildContext context,
  GenerateResult result,
) {
  return showDialog<void>(
    context: context,
    builder: (_) => _GenerateResultDialog(result: result),
  );
}

class _GenerateInvoicesDialog extends ConsumerStatefulWidget {
  const _GenerateInvoicesDialog({
    required this.houseId,
    required this.initialYear,
    required this.initialMonth,
  });

  final String houseId;
  final int initialYear;
  final int initialMonth;

  @override
  ConsumerState<_GenerateInvoicesDialog> createState() =>
      _GenerateInvoicesDialogState();
}

class _GenerateInvoicesDialogState
    extends ConsumerState<_GenerateInvoicesDialog> {
  late int _year;
  late int _month;
  final Set<String> _selectedHeads = {
    for (final h in _billHeadOptions) h.$1,
  };
  bool _includeElectricity = true;
  bool _isSubmitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _year = widget.initialYear;
    _month = widget.initialMonth;
  }

  void _shiftMonth(int delta) {
    setState(() {
      final total = _year * 12 + (_month - 1) + delta;
      _year = total ~/ 12;
      _month = (total % 12) + 1;
    });
  }

  Future<void> _submit() async {
    setState(() {
      _isSubmitting = true;
      _error = null;
    });
    try {
      final allSelected = _selectedHeads.length == _billHeadOptions.length;
      final result = await ref.read(invoicesRepositoryProvider).generate(
            widget.houseId,
            year: _year,
            month: _month,
            billHeads: allSelected ? null : _selectedHeads.toList(),
            includeElectricity: _includeElectricity,
          );
      if (!mounted) return;
      Navigator.pop(context, result);
    } on ApiException catch (e) {
      setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AlertDialog(
      title: const Text('Generate Invoices'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _isSubmitting ? null : () => _shiftMonth(-1),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    '${_monthNames[_month - 1]} $_year',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _isSubmitting ? null : () => _shiftMonth(1),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('Bill Heads', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              children: _billHeadOptions.map((h) {
                final selected = _selectedHeads.contains(h.$1);
                return FilterChip(
                  label: Text(h.$2),
                  selected: selected,
                  onSelected: _isSubmitting
                      ? null
                      : (v) => setState(() {
                            if (v) {
                              _selectedHeads.add(h.$1);
                            } else {
                              _selectedHeads.remove(h.$1);
                            }
                          }),
                );
              }).toList(),
            ),
            if (_selectedHeads.isEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'Select at least one bill head (or all for everything)',
                style: TextStyle(color: colorScheme.error, fontSize: 12),
              ),
            ],
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Include Electricity'),
              value: _includeElectricity,
              onChanged: _isSubmitting
                  ? null
                  : (v) => setState(() => _includeElectricity = v),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: colorScheme.onErrorContainer),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This will create invoices for all occupied rooms and '
                      'close prior unpaid invoices into dues. This cannot be '
                      'undone.',
                      style: TextStyle(
                          color: colorScheme.onErrorContainer, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!, style: TextStyle(color: colorScheme.error)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: (_isSubmitting || _selectedHeads.isEmpty)
              ? null
              : _submit,
          style: FilledButton.styleFrom(backgroundColor: colorScheme.error),
          child: _isSubmitting
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Generate'),
        ),
      ],
    );
  }
}

class _GenerateResultDialog extends StatelessWidget {
  const _GenerateResultDialog({required this.result});

  final GenerateResult result;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          result.alreadyGenerated ? 'Already Generated' : 'Invoices Generated'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (result.alreadyGenerated)
              const Text(
                  'Invoices for this month already exist. Nothing new was created.')
            else ...[
              Text('${result.invoices.length} invoice(s) created.'),
              if (result.closedInvoices.isNotEmpty)
                Text(
                    '${result.closedInvoices.length} prior invoice(s) closed → '
                    '${result.duesCreated.length} due(s) created.'),
            ],
            if (result.skipped.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text('Skipped Rooms',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 4),
              ...result.skipped.map((s) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                        '• ${s['room_number'] ?? s['room_id'] ?? 'Room'}: '
                        '${s['reason'] ?? 'unknown reason'}'),
                  )),
            ],
            if (result.warnings.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text('Warnings', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 4),
              ...result.warnings.map((w) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                        '• Room ${w.roomNumber}: ${_warningTypeLabels[w.type] ?? w.type}'),
                  )),
            ],
          ],
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Done'),
        ),
      ],
    );
  }
}
