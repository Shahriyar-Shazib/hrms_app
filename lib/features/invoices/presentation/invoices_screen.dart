import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../collection/application/collection_controller.dart';
import '../../dues/application/dues_controller.dart';
import '../../renters/application/renters_controller.dart';
import '../../rooms/application/rooms_controller.dart';
import '../application/invoices_controller.dart';
import '../data/models/invoice.dart';
import 'generate_invoices_dialog.dart';
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

/// Shared across the list + detail screens so status colors stay consistent.
Color invoiceStatusColor(BuildContext context, String status) {
  switch (status) {
    case 'UNPAID':
      return Colors.orange;
    case 'PARTIAL':
      return Colors.blue;
    case 'PAID':
      return Colors.green;
    case 'CLOSED':
      return Colors.grey;
    default:
      return Theme.of(context).colorScheme.outline;
  }
}

class InvoicesScreen extends ConsumerStatefulWidget {
  const InvoicesScreen({super.key, required this.houseId});

  final String houseId;

  @override
  ConsumerState<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends ConsumerState<InvoicesScreen> {
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

  Future<void> _openGenerateDialog() async {
    final result = await showGenerateInvoicesDialog(
      context,
      houseId: widget.houseId,
      initialYear: _year,
      initialMonth: _month,
    );
    if (result == null) return;

    ref.invalidate(invoicesProvider);
    ref.invalidate(previewProvider);
    ref.invalidate(duesProvider);
    if (!mounted) return;
    await showGenerateResultDialog(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final query = (houseId: widget.houseId, year: _year, month: _month);
    final state = ref.watch(invoicesProvider(query));
    final canGenerate = ref.watch(canProvider('invoice.generate'));

    // Invoices carry only renter_id/room_id — resolve display names from the
    // already-cached renters/rooms lists rather than a separate fetch.
    final renters = ref.watch(rentersControllerProvider(widget.houseId));
    final rooms = ref.watch(roomsControllerProvider(widget.houseId));
    final renterNames = {
      for (final r in renters.asData?.value ?? const [])
        r.id: r.fullName,
    };
    final roomNumbers = {
      for (final r in rooms.asData?.value ?? const [])
        r.id: r.roomNumber,
    };

    return Scaffold(
      appBar: AppBar(title: Text(loc.invoicesTitle)),
      floatingActionButton: canGenerate
          ? FloatingActionButton.extended(
              onPressed: _openGenerateDialog,
              icon: const Icon(Icons.receipt_long),
              label: Text(loc.generateButton),
            )
          : null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => _shiftMonth(-1),
                ),
                SizedBox(
                  width: 160,
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
                  onPressed: () => _shiftMonth(1),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Text(
                    e is ApiException ? e.message : loc.failedToLoadInvoices),
              ),
              data: (invoices) {
                if (invoices.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(loc.noInvoicesThisMonth),
                        if (canGenerate) ...[
                          const SizedBox(height: 8),
                          Text(
                            loc.tapGenerateHint,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline),
                          ),
                        ],
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: invoices.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, i) => _InvoiceTile(
                    invoice: invoices[i],
                    houseId: widget.houseId,
                    renterName: renterNames[invoices[i].renterId],
                    roomNumber: roomNumbers[invoices[i].roomId],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _InvoiceTile extends StatelessWidget {
  const _InvoiceTile({
    required this.invoice,
    required this.houseId,
    required this.renterName,
    required this.roomNumber,
  });

  final Invoice invoice;
  final String houseId;

  /// Resolved from the cached renters/rooms lists — null if not cached yet.
  final String? renterName;
  final String? roomNumber;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final color = invoiceStatusColor(context, invoice.status);
    return ListTile(
      title: Text(renterName ?? invoice.renterId),
      subtitle: Text(
        [
          if (roomNumber != null) loc.roomTileTitle(roomNumber!),
          invoice.dueDate,
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
            '৳${invoice.totalAmount}',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              _invoiceStatusLabel(loc, invoice.status),
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      onTap: () => context.push(
        '/houses/$houseId/invoices/${invoice.id}',
        extra: invoice,
      ),
    );
  }
}
