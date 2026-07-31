import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../features/renters/application/renters_controller.dart';
import '../../houses/application/houses_controller.dart';
import '../../rooms/application/rooms_controller.dart';
import '../../dues/presentation/waive_due_dialog.dart';
import '../application/collection_controller.dart';
import '../data/collection_repository.dart';
import '../data/models/collection.dart';
import '../print/a4_invoice_pdf.dart';
import '../print/build_print_data.dart';
import '../print/print_data.dart';
import '../print/thermal_receipt_pdf.dart';
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

const _paymentMethods = ['CASH', 'BANK', 'MOBILE'];

String _paymentMethodLabel(AppLocalizations loc, String m) => switch (m) {
      'CASH' => loc.paymentMethodCash,
      'BANK' => loc.paymentMethodBank,
      'MOBILE' => loc.paymentMethodMobile,
      _ => m,
    };

/// One room's billable slice of the preview: its open invoice (if any) plus
/// its dues. A renter may hold several rooms at once — billing stays per
/// room, so the screen groups everything by room and lets staff select which
/// room(s) to pay for.
class _RoomGroup {
  const _RoomGroup({
    required this.roomId,
    required this.roomNumber,
    required this.invoice,
    required this.dues,
    required this.outstanding,
  });

  final String roomId;
  final String roomNumber;
  final PreviewInvoice? invoice;
  final List<PreviewDue> dues;
  final String outstanding;
}

class _RoomGroups {
  const _RoomGroups(this.groups, this.unassignedDues);
  final List<_RoomGroup> groups;
  final List<PreviewDue> unassignedDues;
}

_RoomGroups _buildRoomGroups(
  CollectionPreview preview,
  Map<String, String> roomNumberById,
) {
  final byRoom = <String, ({String roomNumber, PreviewInvoice? invoice, List<PreviewDue> dues, Decimal outstanding})>{};
  for (final invoice in preview.invoices) {
    byRoom[invoice.roomId] = (
      roomNumber: roomNumberById[invoice.roomId] ?? invoice.roomId,
      invoice: invoice,
      dues: [],
      outstanding: Decimal.tryParse(invoice.outstanding ?? '0.00') ?? Decimal.zero,
    );
  }
  final unassignedDues = <PreviewDue>[];
  for (final due in preview.openDues) {
    final roomId = due.roomIdAtCreation;
    if (roomId == null) {
      unassignedDues.add(due);
      continue;
    }
    final existing = byRoom[roomId];
    final dueOutstanding = Decimal.tryParse(due.outstanding) ?? Decimal.zero;
    if (existing != null) {
      byRoom[roomId] = (
        roomNumber: existing.roomNumber,
        invoice: existing.invoice,
        dues: [...existing.dues, due],
        outstanding: existing.outstanding + dueOutstanding,
      );
    } else {
      byRoom[roomId] = (
        roomNumber: roomNumberById[roomId] ?? roomId,
        invoice: null,
        dues: [due],
        outstanding: dueOutstanding,
      );
    }
  }
  final groups = byRoom.entries
      .map((e) => _RoomGroup(
            roomId: e.key,
            roomNumber: e.value.roomNumber,
            invoice: e.value.invoice,
            dues: e.value.dues,
            outstanding: e.value.outstanding.toStringAsFixed(2),
          ))
      .toList();
  return _RoomGroups(groups, unassignedDues);
}

class CollectionScreen extends ConsumerStatefulWidget {
  const CollectionScreen({
    super.key,
    required this.houseId,
    required this.renterId,
  });

  final String houseId;
  final String renterId;

  @override
  ConsumerState<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends ConsumerState<CollectionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _referenceController = TextEditingController();
  final _notesController = TextEditingController();

  String _paymentMethod = 'CASH';
  bool _isSubmitting = false;
  String? _collectError;
  CollectResult? _collectResult;

  // Every room selected by default (matches the pre-multi-room behavior of
  // paying everything in one go); null until the room groups are known.
  Set<String>? _selectedRoomIds;

  // Captured right before the collect POST — the ONLY reliable source for
  // printable invoice/line-item/due-label content (see build_print_data.dart
  // for why the collect response's own `invoice` field must not be used).
  CollectionPreview? _previewSnapshot;
  Set<String>? _paidRoomIds;

  @override
  void dispose() {
    _amountController.dispose();
    _referenceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSubmitting = true;
      _collectError = null;
    });

    // Captured before the await (release-mode "ref after unmount" gotcha —
    // same pattern as login/change-password): the preview snapshot BEFORE
    // this payment is applied, since post-collect a paid-off due/invoice can
    // no longer be resolved from the (now stale) provider state either.
    final previewSnapshot =
        ref.read(previewProvider((widget.houseId, widget.renterId))).asData?.value;
    final rooms = ref.read(roomsControllerProvider(widget.houseId)).asData?.value ?? const [];
    final roomNumberById = {for (final r in rooms) r.id: r.roomNumber};
    final roomGroups = previewSnapshot != null
        ? _buildRoomGroups(previewSnapshot, roomNumberById).groups
        : const <_RoomGroup>[];
    final allRoomIds = roomGroups.map((g) => g.roomId).toSet();
    final selectedRoomIds = _selectedRoomIds ?? allRoomIds;
    // Only send room_ids when it's a genuine subset — sending every known
    // room is equivalent to no filter and also picks up any unassigned dues.
    final roomIdsParam =
        selectedRoomIds.length == allRoomIds.length ? null : selectedRoomIds.toList();
    final repo = ref.read(collectionRepositoryProvider);

    try {
      final result = await repo.collect(
            widget.houseId,
            widget.renterId,
            amount: _amountController.text.trim(),
            paymentMethod: _paymentMethod,
            reference: _referenceController.text.trim().isEmpty
                ? null
                : _referenceController.text.trim(),
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
            roomIds: roomIdsParam,
          );
      if (!mounted) return;
      setState(() {
        _isSubmitting = false;
        _collectResult = result;
        _previewSnapshot = previewSnapshot;
        _paidRoomIds = selectedRoomIds;
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      final loc = AppLocalizations.of(context)!;
      setState(() {
        _isSubmitting = false;
        _collectError = e.code == 'NETWORK_ERROR'
            ? loc.mustBeOnlineToCollect
            : e.message;
      });
    } catch (_) {
      if (!mounted) return;
      final loc = AppLocalizations.of(context)!;
      setState(() {
        _isSubmitting = false;
        _collectError = loc.unexpectedErrorRetry;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final renterAsync =
        ref.watch(renterDetailProvider((widget.houseId, widget.renterId)));
    final renterName =
        renterAsync.asData?.value?.fullName ?? loc.collectPaymentButton;

    final houseName =
        ref.watch(houseDetailProvider(widget.houseId)).asData?.value?.name ??
            '—';
    final rooms = ref.watch(roomsControllerProvider(widget.houseId)).asData?.value ?? const [];
    final roomNumberById = {for (final r in rooms) r.id: r.roomNumber};

    return Scaffold(
      appBar: AppBar(title: Text(renterName)),
      body: _collectResult != null
          ? _SuccessSection(
              result: _collectResult!,
              previewSnapshot: _previewSnapshot,
              paidRoomIds: _paidRoomIds,
              roomNumberById: roomNumberById,
              houseName: houseName,
              renterName: renterName,
              onDone: () {
                ref.invalidate(
                    previewProvider((widget.houseId, widget.renterId)));
                context.pop();
              },
            )
          : _buildFormBody(context, roomNumberById),
    );
  }

  Widget _buildFormBody(BuildContext context, Map<String, String> roomNumberById) {
    final previewAsync =
        ref.watch(previewProvider((widget.houseId, widget.renterId)));
    final preview = previewAsync.asData?.value;
    final roomGroups =
        preview != null ? _buildRoomGroups(preview, roomNumberById) : const _RoomGroups([], []);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PreviewCard(
            previewAsync: previewAsync,
            groups: roomGroups.groups,
            unassignedDues: roomGroups.unassignedDues,
            houseId: widget.houseId,
            renterId: widget.renterId,
          ),
          const SizedBox(height: 20),
          _buildForm(context, preview, roomGroups.groups),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context, CollectionPreview? preview, List<_RoomGroup> groups) {
    final loc = AppLocalizations.of(context)!;

    if (groups.isNotEmpty) {
      _selectedRoomIds ??= groups.map((g) => g.roomId).toSet();
      _selectedRoomIds!.removeWhere((id) => !groups.any((g) => g.roomId == id));
      if (_selectedRoomIds!.isEmpty) {
        _selectedRoomIds = groups.map((g) => g.roomId).toSet();
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (groups.length > 1) ...[
            Text(loc.roomsToPayForSectionTitle,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ...groups.map((g) => CheckboxListTile(
                  value: _selectedRoomIds?.contains(g.roomId) ?? true,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  title: Text(loc.roomTileTitle(g.roomNumber)),
                  secondary: Text('৳${g.outstanding}'),
                  onChanged: (checked) => setState(() {
                    _selectedRoomIds ??= groups.map((e) => e.roomId).toSet();
                    if (checked ?? false) {
                      _selectedRoomIds!.add(g.roomId);
                    } else {
                      _selectedRoomIds!.remove(g.roomId);
                    }
                  }),
                )),
            const SizedBox(height: 12),
          ],
          Text(loc.paymentDetailsSectionTitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          TextFormField(
            controller: _amountController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: loc.amountLabel,
              prefixText: '৳ ',
              hintText: '0.00',
              border: const OutlineInputBorder(),
              helperText: preview != null
                  ? loc.outstandingHelper(preview.grandTotalOutstanding)
                  : null,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return loc.enterAnAmount;
              }
              try {
                final d = Decimal.parse(value.trim());
                if (d <= Decimal.zero) return loc.amountMustBeGreaterThanZero;
              } catch (_) {
                return loc.enterValidAmount;
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _paymentMethod,
            decoration: InputDecoration(
              labelText: loc.paymentMethodLabel,
              border: const OutlineInputBorder(),
            ),
            items: _paymentMethods
                .map((m) => DropdownMenuItem(
                    value: m, child: Text(_paymentMethodLabel(loc, m))))
                .toList(),
            onChanged: (v) {
              if (v != null) _paymentMethod = v;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _referenceController,
            decoration: InputDecoration(
              labelText: loc.referenceLabel,
              hintText: loc.referenceHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _notesController,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: loc.notesOptionalLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          if (_collectError != null) ...[
            const SizedBox(height: 12),
            _ErrorBanner(message: _collectError!),
          ],
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _isSubmitting ? null : _submit,
            child: _isSubmitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(loc.collectButton),
          ),
        ],
      ),
    );
  }
}

// ─── Preview card ─────────────────────────────────────────────────────────────

class _PreviewCard extends ConsumerWidget {
  const _PreviewCard({
    required this.previewAsync,
    required this.groups,
    required this.unassignedDues,
    required this.houseId,
    required this.renterId,
  });

  final AsyncValue<CollectionPreview> previewAsync;
  final List<_RoomGroup> groups;
  final List<PreviewDue> unassignedDues;
  final String houseId;
  final String renterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return previewAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) {
        final loc = AppLocalizations.of(context)!;
        final msg = e is ApiException
            ? (e.code == 'NETWORK_ERROR'
                ? loc.mustBeOnlineToCollect
                : e.message)
            : 'ERR: ${e.runtimeType} - $e';
        return _ErrorBanner(message: msg);
      },
      data: (preview) => _PreviewContent(
        preview: preview,
        groups: groups,
        unassignedDues: unassignedDues,
        houseId: houseId,
        renterId: renterId,
      ),
    );
  }
}

class _PreviewContent extends ConsumerWidget {
  const _PreviewContent({
    required this.preview,
    required this.groups,
    required this.unassignedDues,
    required this.houseId,
    required this.renterId,
  });

  final CollectionPreview preview;
  final List<_RoomGroup> groups;
  final List<PreviewDue> unassignedDues;
  final String houseId;
  final String renterId;

  Future<void> _confirmWaive(
    BuildContext context,
    WidgetRef ref,
    PreviewDue due,
  ) async {
    final waived = await showWaiveDueDialog(
      context,
      houseId: houseId,
      dueId: due.id,
      headLabel: due.headLabel,
      outstanding: due.outstanding,
    );
    if (!waived) return;

    ref.invalidate(previewProvider((houseId, renterId)));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.dueWaived)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final canWaive = ref.watch(canProvider('due.waive'));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Grand total outstanding — prominent
        Card(
          color: colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(loc.totalOutstandingLabel,
                    style: Theme.of(context).textTheme.titleMedium),
                Text(
                  '৳${preview.grandTotalOutstanding}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
        // Electricity warnings — one per occupied metered room missing a
        // reading this month (a renter may hold several rooms).
        for (final warning in preview.electricityWarnings) ...[
          const SizedBox(height: 8),
          Card(
            color: colorScheme.tertiaryContainer,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.bolt,
                      color: colorScheme.onTertiaryContainer, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      warning.message,
                      style: TextStyle(
                          color: colorScheme.onTertiaryContainer,
                          fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        // Billing stays per room — one section per room the renter holds.
        for (final group in groups) ...[
          const SizedBox(height: 12),
          Text(
            loc.roomTileTitle(group.roomNumber),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: colorScheme.outline),
          ),
          if (group.invoice != null) ...[
            const SizedBox(height: 4),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          loc.invoiceTitleLine(
                            _monthName(loc, group.invoice!.billingPeriodMonth),
                            group.invoice!.billingPeriodYear,
                          ),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          _invoiceStatusLabel(loc, group.invoice!.status),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: colorScheme.outline),
                        ),
                      ],
                    ),
                    if (group.invoice!.lineItems.isNotEmpty) ...[
                      const Divider(height: 16),
                      ...group.invoice!.lineItems.map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item.label,
                                  style:
                                      Theme.of(context).textTheme.bodySmall),
                              Text('৳${item.amount}',
                                  style:
                                      Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 16),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(loc.invoiceFieldTotal,
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text('৳${group.invoice!.totalAmount}',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(loc.outstandingLabel,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600)),
                        Text(
                          '৳${group.invoice!.outstanding}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.error,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (group.dues.isNotEmpty) ...[
            const SizedBox(height: 4),
            _DuesCard(dues: group.dues, canWaive: canWaive, onWaive: (d) => _confirmWaive(context, ref, d)),
          ],
        ],
        // Dues without a resolvable room (legacy rows predating the room
        // requirement on manual dues).
        if (unassignedDues.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            loc.outstandingDuesSectionTitle,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: colorScheme.outline),
          ),
          const SizedBox(height: 4),
          _DuesCard(dues: unassignedDues, canWaive: canWaive, onWaive: (d) => _confirmWaive(context, ref, d)),
        ],
      ],
    );
  }
}

class _DuesCard extends StatelessWidget {
  const _DuesCard({required this.dues, required this.canWaive, required this.onWaive});

  final List<PreviewDue> dues;
  final bool canWaive;
  final void Function(PreviewDue due) onWaive;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Column(
        children: dues
            .map(
              (d) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d.headLabel, style: Theme.of(context).textTheme.bodyMedium),
                          Text(
                            d.dueDate,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: colorScheme.outline),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '৳${d.outstanding}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    if (canWaive) ...[
                      const SizedBox(width: 4),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline, size: 20, color: colorScheme.error),
                        tooltip: loc.waiveTooltip,
                        onPressed: () => onWaive(d),
                      ),
                    ],
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// ─── Success section ──────────────────────────────────────────────────────────

class _SuccessSection extends StatelessWidget {
  const _SuccessSection({
    required this.result,
    required this.previewSnapshot,
    required this.paidRoomIds,
    required this.roomNumberById,
    required this.houseName,
    required this.renterName,
    required this.onDone,
  });

  final CollectResult result;
  final CollectionPreview? previewSnapshot;
  final Set<String>? paidRoomIds;
  final Map<String, String> roomNumberById;
  final String houseName;
  final String renterName;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    // Built ONCE and shared by the on-screen "Applied to" list AND the print
    // buttons below, so both are guaranteed to read identically — resolved
    // from the pre-collect preview snapshot, never from result.invoice (which
    // goes null once the paid invoice becomes fully PAID, even though the
    // payment DID apply to it).
    final printData = buildPrintData(
      result: result,
      previewSnapshot: previewSnapshot,
      houseName: houseName,
      renterName: renterName,
      paidRoomIds: paidRoomIds,
      roomNumberById: roomNumberById,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.check_circle_outline,
              size: 72, color: colorScheme.primary),
          const SizedBox(height: 16),
          Text(
            loc.paymentReceivedTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            loc.paymentViaLine(result.payment.amount,
                _paymentMethodLabel(loc, result.payment.paymentMethod)),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: colorScheme.outline),
          ),
          const SizedBox(height: 24),
          // Bill breakdown (line items + Electricity) — the SAME itemization
          // both PDFs print. Distinct from "Applied to" below: this describes
          // what makes up the BILL, not what the PAYMENT was allocated to.
          if (printData.lineItems.isNotEmpty || printData.electricityAmount != null) ...[
            Text(loc.lineItemsSectionTitle,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ...printData.lineItems.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.label,
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text('৳${item.amount}',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  ),
                  if (printData.electricityAmount != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(loc.electricityLabel,
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text('৳${printData.electricityAmount}',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          // Applications — same resolved lines the PDF prints (see printData
          // above), so this list and the paper never disagree.
          if (printData.applications.isNotEmpty) ...[
            Text(loc.appliedToSectionTitle,
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: printData.applications
                    .map(
                      (app) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_forward, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                loc.appliedAmountToDue(app.amount, app.label),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],
          // Due amount before this payment — same printData the PDFs use.
          Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(loc.dueAmountLabel,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    '৳${printData.dueBeforePayment}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // New outstanding
          Card(
            color: colorScheme.surfaceContainerHighest,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(loc.newOutstandingLabel,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    '৳${result.grandTotalOutstanding}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _PrintButtonsRow(data: printData),
          const SizedBox(height: 20),
          FilledButton(onPressed: onDone, child: Text(loc.done)),
        ],
      ),
    );
  }
}

// ─── Print buttons ────────────────────────────────────────────────────────────

class _PrintButtonsRow extends StatefulWidget {
  const _PrintButtonsRow({required this.data});

  final PrintData data;

  @override
  State<_PrintButtonsRow> createState() => _PrintButtonsRowState();
}

class _PrintButtonsRowState extends State<_PrintButtonsRow> {
  bool _generatingA4 = false;
  bool _generatingThermal = false;

  Future<void> _printA4() async {
    setState(() => _generatingA4 = true);

    // Captured before the await (release-mode "ref after unmount" gotcha).
    final loc = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final data = widget.data;

    try {
      await Printing.layoutPdf(
        onLayout: (_) => buildA4InvoicePdf(data),
        name: '${data.invoiceNumber ?? 'invoice'}.pdf',
        format: PdfPageFormat.a4,
      );
    } catch (_) {
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(loc.pdfGenerationFailed)));
    } finally {
      if (mounted) setState(() => _generatingA4 = false);
    }
  }

  Future<void> _printThermal() async {
    setState(() => _generatingThermal = true);

    final loc = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final data = widget.data;
    final paymentId = data.payment.id;
    final shortId =
        paymentId.length >= 6 ? paymentId.substring(paymentId.length - 6) : paymentId;

    try {
      await Printing.layoutPdf(
        onLayout: (_) => buildThermalReceiptPdf(data),
        name: 'receipt-$shortId.pdf',
        format: PdfPageFormat.roll80,
      );
    } catch (_) {
      if (!mounted) return;
      messenger.showSnackBar(SnackBar(content: Text(loc.pdfGenerationFailed)));
    } finally {
      if (mounted) setState(() => _generatingThermal = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final a4Enabled = widget.data.invoiceNumber != null;

    final a4Button = OutlinedButton.icon(
      onPressed: (!a4Enabled || _generatingA4) ? null : _printA4,
      icon: _generatingA4
          ? const SizedBox(
              height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
          : const Icon(Icons.picture_as_pdf_outlined),
      label: Text(loc.invoicePdfButton),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        a4Enabled ? a4Button : Tooltip(message: loc.noInvoiceForPaymentHint, child: a4Button),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: _generatingThermal ? null : _printThermal,
          icon: _generatingThermal
              ? const SizedBox(
                  height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.receipt_long_outlined),
          label: Text(loc.receiptPdfButton),
        ),
      ],
    );
  }
}

// ─── Shared small widgets ─────────────────────────────────────────────────────

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: colorScheme.onErrorContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: colorScheme.onErrorContainer),
            ),
          ),
        ],
      ),
    );
  }
}
