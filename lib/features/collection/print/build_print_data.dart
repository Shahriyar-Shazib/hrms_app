import 'package:decimal/decimal.dart';
import '../data/models/collection.dart';
import 'invoice_number.dart';
import 'print_data.dart';
import 'resolve_application_lines.dart';

// English constants — the PDF itself is an English-labeled document (see the
// pdf builders); billing-period values stay English too rather than mixing in
// the on-screen localized month name.
const _englishMonths = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

String _billingPeriodLabel(int year, int month) => '${_englishMonths[month - 1]} $year';

/// The invoices + dues actually covered by this payment, resolved from the
/// PRE-collect preview snapshot. `paidRoomIds == null` means every room was
/// selected (the pre-multi-room default) — in that case dues with no
/// resolvable room (room_id_at_creation null) are included too.
({List<({String roomNumber, PreviewInvoice invoice})> rooms, List<PreviewDue> dues}) _resolvePaid(
  CollectionPreview? previewSnapshot,
  Set<String>? paidRoomIds,
  Map<String, String> roomNumberById,
) {
  if (previewSnapshot == null) return (rooms: const [], dues: const []);

  final rooms = previewSnapshot.invoices
      .where((inv) => paidRoomIds == null || paidRoomIds.contains(inv.roomId))
      .map((inv) => (roomNumber: roomNumberById[inv.roomId] ?? inv.roomId, invoice: inv))
      .toList();

  final dues = previewSnapshot.openDues.where((due) {
    final roomId = due.roomIdAtCreation;
    return roomId != null ? (paidRoomIds == null || paidRoomIds.contains(roomId)) : paidRoomIds == null;
  }).toList();

  return (rooms: rooms, dues: dues);
}

/// Grand total owed BEFORE this payment: every paid room's invoice
/// outstanding plus every included due's outstanding, summed — mirrors how
/// the server computes grand_total_outstanding, just on the retained
/// PRE-collect snapshot instead of a fresh query. Exact decimal string math
/// (package:decimal) — never doubles.
String _computeDueBeforePayment(
  List<({String roomNumber, PreviewInvoice invoice})> paidRooms,
  List<PreviewDue> dues,
) {
  var total = Decimal.zero;
  for (final room in paidRooms) {
    final outstanding = room.invoice.outstanding;
    if (outstanding != null) total += Decimal.parse(outstanding);
  }
  for (final due in dues) {
    total += Decimal.parse(due.outstanding);
  }
  return total.toStringAsFixed(2);
}

/// Null when absent or <= 0 (rooms without a meter have no electricity) —
/// callers skip the Electricity row entirely rather than showing ৳0.00.
String? _computeElectricityAmount(List<({String roomNumber, PreviewInvoice invoice})> paidRooms) {
  var total = Decimal.zero;
  for (final room in paidRooms) {
    final raw = room.invoice.electricityAmount;
    if (raw == null) continue;
    try {
      final parsed = Decimal.parse(raw);
      if (parsed > Decimal.zero) total += parsed;
    } catch (_) {
      // ignore unparsable value
    }
  }
  return total > Decimal.zero ? total.toStringAsFixed(2) : null;
}

/// Assembles [PrintData] from the collect RESPONSE (payment + balance) and
/// the PRE-collect preview SNAPSHOT (invoices + line items + open dues) —
/// deliberately NEVER from the collect response's own `invoices` field,
/// which is unreliable for printing: a room drops out once its invoice
/// becomes fully PAID (even though the payment applied to it), and entries
/// never carry line_items even when present (not eager-loaded on that path).
///
/// A4 invoice printing needs exactly one invoice number — only available
/// when the payment covered a single room's invoice (invoiceNumber is null
/// otherwise, matching the existing "no invoice" dues-only behavior).
PrintData buildPrintData({
  required CollectResult result,
  required CollectionPreview? previewSnapshot,
  required String houseName,
  required String renterName,
  required Set<String>? paidRoomIds,
  required Map<String, String> roomNumberById,
}) {
  final resolved = _resolvePaid(previewSnapshot, paidRoomIds, roomNumberById);
  final paidRooms = resolved.rooms;
  final dues = resolved.dues;
  final singleRoom = paidRooms.length == 1 ? paidRooms.single : null;

  final billingPeriodLabel = singleRoom != null
      ? _billingPeriodLabel(singleRoom.invoice.billingPeriodYear, singleRoom.invoice.billingPeriodMonth)
      : null;
  final invoiceNumber = singleRoom != null
      ? formatInvoiceNumber(
          singleRoom.roomNumber, singleRoom.invoice.billingPeriodYear, singleRoom.invoice.billingPeriodMonth)
      : null;

  final lineItems = paidRooms.expand((room) {
    // Electricity is rendered separately below (electricityAmount) — filter
    // it out of lineItems here so it's never shown twice.
    final items = room.invoice.lineItems.where((item) => item.head != 'ELECTRICITY');
    return items.map((item) => PrintLineItem(
          label: paidRooms.length > 1 ? 'Room ${room.roomNumber} — ${item.label}' : item.label,
          amount: item.amount,
        ));
  }).toList();

  String? totalAmount;
  if (paidRooms.isNotEmpty) {
    var total = Decimal.zero;
    for (final room in paidRooms) {
      total += Decimal.parse(room.invoice.totalAmount);
    }
    totalAmount = total.toStringAsFixed(2);
  }

  return PrintData(
    houseName: houseName,
    renterName: renterName,
    roomNumber: paidRooms.isNotEmpty ? paidRooms.map((r) => r.roomNumber).join(', ') : '—',
    invoiceNumber: invoiceNumber,
    billingPeriodLabel: billingPeriodLabel,
    issuedAt: singleRoom?.invoice.issuedAt,
    dueDate: singleRoom?.invoice.dueDate,
    lineItems: lineItems,
    electricityAmount: _computeElectricityAmount(paidRooms),
    totalAmount: totalAmount,
    payment: PrintPaymentInfo(
      id: result.payment.id,
      amount: result.payment.amount,
      method: result.payment.paymentMethod,
      paidAt: result.payment.paidAt,
      reference: result.payment.reference,
    ),
    applications: resolveApplicationLines(
      result.payment.applications,
      invoices: paidRooms.map((r) => r.invoice).toList(),
      dues: dues,
    ),
    dueBeforePayment: _computeDueBeforePayment(paidRooms, dues),
    balanceRemaining: result.grandTotalOutstanding,
  );
}
