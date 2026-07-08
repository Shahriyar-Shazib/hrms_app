import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../application/expenses_controller.dart';
import '../data/expenses_repository.dart';
import '../data/models/expense.dart';

Map<String, String> categoryLabels(AppLocalizations loc) => {
      'REPAIR': loc.categoryRepair,
      'MAINTENANCE': loc.categoryMaintenance,
      'STAFF_SALARY': loc.categoryStaffSalary,
      'UTILITY_BILL': loc.categoryUtilityBill,
      'CUSTOM': loc.categoryCustom,
    };

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

class ExpensesScreen extends ConsumerStatefulWidget {
  const ExpensesScreen({super.key, required this.houseId});

  final String houseId;

  @override
  ConsumerState<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends ConsumerState<ExpensesScreen> {
  late int _year;
  late int _month;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _year = now.year;
    _month = now.month;
  }

  void _shiftMonth(int delta) {
    setState(() {
      final total = _year * 12 + (_month - 1) + delta;
      _year = total ~/ 12;
      _month = (total % 12) + 1;
    });
  }

  Future<void> _confirmDelete(Expense expense) async {
    final loc = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.deleteExpenseDialogTitle),
        content: Text(loc.deleteExpenseDialogBody(expense.label, expense.amount)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(ctx).colorScheme.error),
            child: Text(loc.delete),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    try {
      await ref
          .read(expensesRepositoryProvider)
          .deleteExpense(widget.houseId, expense.id);
      ref.invalidate(expensesProvider(
        (houseId: widget.houseId, year: _year, month: _month),
      ));
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(loc.expenseDeleted)));
    } on ApiException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final query =
        (houseId: widget.houseId, year: _year, month: _month);
    final state = ref.watch(expensesProvider(query));
    final canLog = ref.watch(canProvider('expense.log'));
    final canManage = ref.watch(canProvider('expense.manage'));

    return Scaffold(
      appBar: AppBar(title: Text(loc.expensesTitle)),
      floatingActionButton: canLog
          ? FloatingActionButton.extended(
              onPressed: () =>
                  context.push('/houses/${widget.houseId}/expenses/new'),
              icon: const Icon(Icons.add),
              label: Text(loc.addExpenseTooltip),
            )
          : null,
      body: Column(
        children: [
          _MonthSelector(
            year: _year,
            month: _month,
            onPrevious: () => _shiftMonth(-1),
            onNext: () => _shiftMonth(1),
          ),
          const Divider(height: 1),
          Expanded(
            child: state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Text(
                    e is ApiException ? e.message : loc.failedToLoadExpenses),
              ),
              data: (expenses) {
                if (expenses.isEmpty) {
                  return Center(
                      child: Text(loc.noExpensesThisMonth));
                }
                final total = expenses
                    .fold<Decimal>(
                      Decimal.zero,
                      (sum, e) => sum + Decimal.parse(e.amount),
                    )
                    .toStringAsFixed(2);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(loc.monthTotalLabel,
                              style: const TextStyle(fontWeight: FontWeight.w600)),
                          Text(
                            '৳$total',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.separated(
                        itemCount: expenses.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (context, i) => _ExpenseTile(
                          expense: expenses[i],
                          houseId: widget.houseId,
                          canManage: canManage,
                          onDelete: () => _confirmDelete(expenses[i]),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MonthSelector extends StatelessWidget {
  const _MonthSelector({
    required this.year,
    required this.month,
    required this.onPrevious,
    required this.onNext,
  });

  final int year;
  final int month;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: onPrevious,
          ),
          SizedBox(
            width: 160,
            child: Text(
              '${_monthName(loc, month)} $year',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}

class _ExpenseTile extends StatelessWidget {
  const _ExpenseTile({
    required this.expense,
    required this.houseId,
    required this.canManage,
    required this.onDelete,
  });

  final Expense expense;
  final String houseId;
  final bool canManage;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return ListTile(
      title: Text(expense.label),
      subtitle: Text(
        [
          categoryLabels(loc)[expense.category] ?? expense.category,
          expense.expenseDate,
          if (expense.paidTo != null && expense.paidTo!.isNotEmpty)
            loc.paidToLine(expense.paidTo!),
        ].join(' · '),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Theme.of(context).colorScheme.outline),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '৳${expense.amount}',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          if (canManage) ...[
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(Icons.delete_outline,
                  color: Theme.of(context).colorScheme.error),
              tooltip: loc.deleteExpenseTooltip,
              onPressed: onDelete,
            ),
          ],
        ],
      ),
      onTap: canManage
          ? () => context.push(
                '/houses/$houseId/expenses/${expense.id}/edit',
                extra: expense,
              )
          : null,
    );
  }
}
