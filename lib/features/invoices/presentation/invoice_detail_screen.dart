import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../renters/application/renters_controller.dart';
import '../../rooms/application/rooms_controller.dart';
import '../application/invoices_controller.dart';
import '../data/models/invoice.dart';
import 'invoices_screen.dart' show invoiceStatusColor;
import '../../../l10n/app_localizations.dart';

String _monthName(AppLocalizations loc, int month) => [
      loc.monthName1, loc.monthName2, loc.monthName3, loc.monthName4,
      loc.monthName5, loc.monthName6, loc.monthName7, loc.monthName8,
      loc.monthName9, loc.monthName10, loc.monthName11, loc.monthName12,
    ][month - 1];

String _invoiceStatusLabel(AppLocalizations loc, String status) =>
    switch (status) {
      'UNPAID' => loc.invoiceStatusUnpaid,
      'PARTIAL' => loc.invoiceStatusPartial,
      'PAID' => loc.invoiceStatusPaid,
      'CLOSED' => loc.invoiceStatusClosed,
      _ => status,
    };

class InvoiceDetailScreen extends ConsumerWidget {
  const InvoiceDetailScreen({
    super.key,
    required this.houseId,
    required this.invoiceId,
    this.existing,
  });

  final String houseId;
  final String invoiceId;

  /// Passed via `extra` from the list so the detail can render instantly;
  /// the provider still fetches fresh data underneath.
  final Invoice? existing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(invoiceDetailProvider((houseId, invoiceId)));
    final invoice = state.asData?.value ?? existing;

    // Invoices carry only renter_id/room_id — resolve display names from the
    // already-cached renters/rooms lists rather than a separate fetch.
    final renters = ref.watch(rentersControllerProvider(houseId));
    final rooms = ref.watch(roomsControllerProvider(houseId));
    final renterName = invoice == null
        ? null
        : renters.asData?.value
            .where((r) => r.id == invoice.renterId)
            .firstOrNull
            ?.fullName;
    final roomNumber = invoice == null
        ? null
        : rooms.asData?.value
            .where((r) => r.id == invoice.roomId)
            .firstOrNull
            ?.roomNumber;

    return Scaffold(
      appBar: AppBar(title: Text(loc.invoiceAppBarTitle)),
      body: invoice == null
          ? state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Text(
                    e is ApiException ? e.message : loc.failedToLoadInvoice),
              ),
              data: (_) => const SizedBox.shrink(),
            )
          : _InvoiceDetail(
              invoice: invoice,
              renterName: renterName,
              roomNumber: roomNumber,
            ),
    );
  }
}

class _InvoiceDetail extends StatelessWidget {
  const _InvoiceDetail({
    required this.invoice,
    required this.renterName,
    required this.roomNumber,
  });

  final Invoice invoice;
  final String? renterName;
  final String? roomNumber;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final color = invoiceStatusColor(context, invoice.status);
    final lineItems = invoice.lineItems ?? const [];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_monthName(loc, invoice.billingPeriodMonth)} ${invoice.billingPeriodYear}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _invoiceStatusLabel(loc, invoice.status),
                    style: TextStyle(color: color, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                _Field(loc.invoiceFieldRenter, renterName ?? invoice.renterId),
                if (roomNumber != null) _Field(loc.invoiceFieldRoom, roomNumber!),
                _Field(loc.invoiceFieldDueDate, invoice.dueDate),
                _Field(loc.invoiceFieldIssued, invoice.issuedAt),
              ],
            ),
          ),
        ),
        if (lineItems.isNotEmpty) ...[
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(loc.lineItemsSectionTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  for (final item in lineItems)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.label),
                          Text('৳${item.amount}'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AmountRow(loc.invoiceFieldTotal, invoice.totalAmount, emphasize: true),
                _AmountRow(loc.invoiceFieldPaid, invoice.paidAmount),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow(this.label, this.value, {this.emphasize = false});

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final style = emphasize
        ? Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w700)
        : Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text('৳$value', style: style),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.outline),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
