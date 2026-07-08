import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../data/invoices_repository.dart';
import '../data/models/invoice.dart';
import '../../../l10n/app_localizations.dart';

String _monthName(AppLocalizations loc, int month) => [
      loc.monthName1, loc.monthName2, loc.monthName3, loc.monthName4,
      loc.monthName5, loc.monthName6, loc.monthName7, loc.monthName8,
      loc.monthName9, loc.monthName10, loc.monthName11, loc.monthName12,
    ][month - 1];

const _billHeadKeys = ['SERVICE_CHARGE', 'WASTE_BILL', 'CUSTOM'];

String _billHeadLabel(AppLocalizations loc, String key) => switch (key) {
      'SERVICE_CHARGE' => loc.billHeadServiceCharge,
      'WASTE_BILL' => loc.billHeadWasteBill,
      'CUSTOM' => loc.billHeadCustom,
      _ => key,
    };

Map<String, String> _warningTypeLabels(AppLocalizations loc) => {
      'electricity_missing': loc.warningElectricityMissing,
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
    for (final h in _billHeadKeys) h,
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
      final allSelected = _selectedHeads.length == _billHeadKeys.length;
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
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Text(loc.generateInvoicesDialogTitle),
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
                    '${_monthName(loc, _month)} $_year',
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
            Text(loc.billHeadsSectionTitle, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              children: _billHeadKeys.map((key) {
                final selected = _selectedHeads.contains(key);
                return FilterChip(
                  label: Text(_billHeadLabel(loc, key)),
                  selected: selected,
                  onSelected: _isSubmitting
                      ? null
                      : (v) => setState(() {
                            if (v) {
                              _selectedHeads.add(key);
                            } else {
                              _selectedHeads.remove(key);
                            }
                          }),
                );
              }).toList(),
            ),
            if (_selectedHeads.isEmpty) ...[
              const SizedBox(height: 4),
              Text(
                loc.selectAtLeastOneBillHead,
                style: TextStyle(color: colorScheme.error, fontSize: 12),
              ),
            ],
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(loc.includeElectricityLabel),
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
                      loc.generateWarningBody,
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
          child: Text(loc.cancel),
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
              : Text(loc.generateButton),
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
    final loc = AppLocalizations.of(context)!;
    final warningTypeLabels = _warningTypeLabels(loc);
    return AlertDialog(
      title: Text(
          result.alreadyGenerated ? loc.alreadyGeneratedTitle : loc.invoicesGeneratedTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (result.alreadyGenerated)
              Text(loc.alreadyGeneratedBody)
            else ...[
              Text(loc.invoicesCreatedCount(result.invoices.length)),
              if (result.closedInvoices.isNotEmpty)
                Text(loc.invoicesClosedLine(
                    result.closedInvoices.length, result.duesCreated.length)),
            ],
            if (result.skipped.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(loc.skippedRoomsTitle,
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 4),
              ...result.skipped.map((s) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                        '• ${s['room_number'] ?? s['room_id'] ?? loc.skippedRoomFallback}: '
                        '${s['reason'] ?? loc.skippedReasonFallback}'),
                  )),
            ],
            if (result.warnings.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(loc.warningsTitle, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 4),
              ...result.warnings.map((w) {
                final warningLabel = warningTypeLabels[w.type] ?? w.type;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                      '• ${loc.warningRoomLine(w.roomNumber, warningLabel)}'),
                );
              }),
            ],
          ],
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: Text(loc.done),
        ),
      ],
    );
  }
}
