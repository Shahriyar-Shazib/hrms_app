import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../expenses/presentation/expenses_screen.dart' show categoryLabels;
import '../application/reports_controller.dart';
import '../data/models/reports.dart';

const _monthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

class ReportsScreen extends ConsumerStatefulWidget {
  const ReportsScreen({super.key, required this.houseId});

  final String houseId;

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionHeader('Occupancy'),
          const SizedBox(height: 8),
          _OccupancySection(houseId: widget.houseId),
          const SizedBox(height: 24),
          _SectionHeader('P&L'),
          const SizedBox(height: 8),
          _MonthSelector(
            year: _year,
            month: _month,
            onPrevious: () => _shiftMonth(-1),
            onNext: () => _shiftMonth(1),
          ),
          const SizedBox(height: 8),
          _PnlSection(houseId: widget.houseId, year: _year, month: _month),
          const SizedBox(height: 24),
          _SectionHeader('Dues Aging'),
          const SizedBox(height: 8),
          _DuesAgingSection(houseId: widget.houseId),
        ],
      ),
    );
  }
}

// ─── Shared bits ─────────────────────────────────────────────────────────

Color _amountColor(String value) =>
    value.trim().startsWith('-') ? Colors.red : Colors.green;

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _ErrorRetry extends StatelessWidget {
  const _ErrorRetry({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            const SizedBox(height: 8),
            OutlinedButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row(this.label, this.value, {this.valueColor, this.emphasize = false});

  final String label;
  final String value;
  final Color? valueColor;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final labelStyle = emphasize
        ? Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w700)
        : Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.outline);
    final valueStyle = emphasize
        ? Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w700, color: valueColor)
        : Theme.of(context).textTheme.bodyMedium?.copyWith(color: valueColor);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: labelStyle),
          Text(value, style: valueStyle),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: const Icon(Icons.chevron_left), onPressed: onPrevious),
        SizedBox(
          width: 160,
          child: Text(
            '${_monthNames[month - 1]} $year',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(icon: const Icon(Icons.chevron_right), onPressed: onNext),
      ],
    );
  }
}

// ─── Occupancy ───────────────────────────────────────────────────────────

class _OccupancySection extends ConsumerWidget {
  const _OccupancySection({required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(occupancyProvider(houseId));
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _ErrorRetry(
        message: e is ApiException ? e.message : 'Failed to load occupancy',
        onRetry: () => ref.invalidate(occupancyProvider(houseId)),
      ),
      data: (occ) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                '${occ.occupancyRate}% occupied',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _StatChip(label: 'Total', value: '${occ.totalRooms}'),
                  _StatChip(label: 'Occupied', value: '${occ.occupied}'),
                  _StatChip(label: 'Vacant', value: '${occ.vacant}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.outline),
        ),
      ],
    );
  }
}

// ─── P&L ─────────────────────────────────────────────────────────────────

class _PnlSection extends ConsumerWidget {
  const _PnlSection({
    required this.houseId,
    required this.year,
    required this.month,
  });

  final String houseId;
  final int year;
  final int month;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = (houseId: houseId, year: year, month: month);
    final state = ref.watch(pnlProvider(query));
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _ErrorRetry(
        message: e is ApiException ? e.message : 'Failed to load P&L',
        onRetry: () => ref.invalidate(pnlProvider(query)),
      ),
      data: (pnl) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Billed',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
              _Row('Total', '৳${pnl.billed.total}', emphasize: true),
              _Row('Rent', '৳${pnl.billed.rent}'),
              _Row('Electricity', '৳${pnl.billed.electricity}'),
              _Row('Bills', '৳${pnl.billed.bills}'),
              _Row('Manual Dues', '৳${pnl.billed.manualDues}'),
              const Divider(height: 24),
              Text('Collected',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
              _Row('Total', '৳${pnl.collected.total}', emphasize: true),
              const Divider(height: 24),
              Text('Expenses',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
              _Row('Total', '৳${pnl.expenses.total}', emphasize: true),
              for (final entry in pnl.expenses.byCategory.entries)
                _Row(
                  categoryLabels[entry.key] ?? entry.key,
                  '৳${entry.value}',
                ),
              const Divider(height: 24),
              _Row(
                'Net (billed)',
                '৳${pnl.netBilled}',
                valueColor: _amountColor(pnl.netBilled),
                emphasize: true,
              ),
              _Row(
                'Net (collected)',
                '৳${pnl.netCollected}',
                valueColor: _amountColor(pnl.netCollected),
                emphasize: true,
              ),
              _Row(
                'Collection Gap',
                '৳${pnl.collectionGap}',
                valueColor: _amountColor(pnl.collectionGap),
                emphasize: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Dues Aging ──────────────────────────────────────────────────────────

class _DuesAgingSection extends ConsumerWidget {
  const _DuesAgingSection({required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(duesAgingProvider(houseId));
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _ErrorRetry(
        message: e is ApiException ? e.message : 'Failed to load dues aging',
        onRetry: () => ref.invalidate(duesAgingProvider(houseId)),
      ),
      data: (aging) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BucketRow('0–30 days', aging.buckets.bucket0_30),
              _BucketRow('31–60 days', aging.buckets.bucket31_60),
              _BucketRow('61–90 days', aging.buckets.bucket61_90),
              _BucketRow('90+ days', aging.buckets.bucket90Plus),
              const Divider(height: 24),
              _Row(
                'Total Outstanding',
                '৳${aging.totalOutstanding}',
                emphasize: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BucketRow extends StatelessWidget {
  const _BucketRow(this.label, this.bucket);

  final String label;
  final AgingBucket bucket;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.outline)),
          Text('${bucket.count} · ৳${bucket.total}'),
        ],
      ),
    );
  }
}
