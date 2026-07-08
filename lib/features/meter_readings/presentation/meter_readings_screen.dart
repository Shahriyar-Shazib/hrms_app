import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/meter_readings_controller.dart';
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

class MeterReadingsScreen extends ConsumerWidget {
  const MeterReadingsScreen({
    super.key,
    required this.houseId,
    required this.roomId,
  });

  final String houseId;
  final String roomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(meterReadingsProvider((houseId, roomId)));
    final canManage = ref.watch(canProvider('meterReading.manage'));

    return Scaffold(
      appBar: AppBar(title: Text(loc.meterReadingsTitle)),
      floatingActionButton: canManage
          ? FloatingActionButton(
              onPressed: () {
                final isFirst =
                    state.asData?.value.isEmpty ?? true;
                context.push(
                  '/houses/$houseId/rooms/$roomId/meter-readings/new',
                  extra: isFirst,
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : loc.failedToLoadReadings,
          onRetry: () => ref.invalidate(meterReadingsProvider((houseId, roomId))),
        ),
        data: (readings) => readings.isEmpty
            ? Center(child: Text(loc.noReadingsYet))
            : RefreshIndicator(
                onRefresh: () async =>
                    ref.invalidate(meterReadingsProvider((houseId, roomId))),
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: readings.length,
                  separatorBuilder: (_, i) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _ReadingCard(
                    reading: readings[i],
                    houseId: houseId,
                    roomId: roomId,
                    canManage: canManage,
                  ),
                ),
              ),
      ),
    );
  }
}

class _ReadingCard extends StatelessWidget {
  const _ReadingCard({
    required this.reading,
    required this.houseId,
    required this.roomId,
    required this.canManage,
  });

  final MeterReading reading;
  final String houseId;
  final String roomId;
  final bool canManage;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final month = _monthName(loc, reading.billingPeriodMonth);
    final isAdj = reading.readingType == 'ADJUSTMENT';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$month ${reading.billingPeriodYear}',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 8),
                if (isAdj)
                  Chip(
                    label: Text(loc.adjustmentChipLabel,
                        style: const TextStyle(fontSize: 10)),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    backgroundColor:
                        theme.colorScheme.tertiaryContainer,
                    labelStyle: TextStyle(
                        color: theme.colorScheme.onTertiaryContainer),
                  ),
                const Spacer(),
                if (canManage && !isAdj)
                  IconButton(
                    icon: const Icon(Icons.tune, size: 18),
                    tooltip: loc.adjustTooltip,
                    visualDensity: VisualDensity.compact,
                    onPressed: () => context.push(
                      '/houses/$houseId/rooms/$roomId/meter-readings/adjust',
                      extra: reading,
                    ),
                  ),
                Text(
                  '৳${reading.computedAmount}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              loc.unitsConsumedLine(reading.unitsConsumed,
                  reading.currentReading, reading.previousReading),
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 2),
            Text(
              loc.rateLine(reading.rateSnapshot, reading.readingDate),
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.outline),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: Text(loc.retry)),
          ],
        ),
      ),
    );
  }
}
