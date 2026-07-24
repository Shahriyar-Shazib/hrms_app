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

/// Grand total owed BEFORE this payment: the pre-collect invoice's
/// outstanding (if any) plus every open due's outstanding, summed — mirrors
/// how the server computes grand_total_outstanding, just on the retained
/// PRE-collect snapshot instead of a fresh query. Exact decimal string math
/// (package:decimal, same util the expenses feature already uses for
/// summing money strings) — never doubles.
String _computeDueBeforePayment(CollectionPreview? previewSnapshot, CollectResult result) {
  if (previewSnapshot == null) {
    // Shouldn't happen on this path (the snapshot is captured in _submit
    // before the collect POST) — but if it's somehow missing, the safe
    // non-crashing fallback is this payment's amount plus what's left owed
    // after it, which together equal what was owed before it.
    try {
      return (Decimal.parse(result.payment.amount) + Decimal.parse(result.grandTotalOutstanding))
          .toStringAsFixed(2);
    } catch (_) {
      return '0.00';
    }
  }

  var total = Decimal.zero;
  final outstanding = previewSnapshot.currentInvoice?.outstanding;
  if (outstanding != null) {
    total += Decimal.parse(outstanding);
  }
  for (final due in previewSnapshot.openDues) {
    total += Decimal.parse(due.outstanding);
  }
  return total.toStringAsFixed(2);
}

/// Null when absent or <= 0 (rooms without a meter have no electricity) —
/// callers skip the Electricity row entirely rather than showing ৳0.00.
String? _computeElectricityAmount(PreviewInvoice? invoice) {
  final raw = invoice?.electricityAmount;
  if (raw == null) return null;
  try {
    return Decimal.parse(raw) > Decimal.zero ? raw : null;
  } catch (_) {
    return null;
  }
}

/// Assembles [PrintData] from the collect RESPONSE (payment + balance) and
/// the PRE-collect preview SNAPSHOT (invoice + line items + open dues) —
/// deliberately NEVER from the collect response's own `invoice` field, which
/// is unreliable for printing: null once the paid invoice becomes fully PAID
/// (even though the payment applied to it), and never carries line_items even
/// when non-null (not eager-loaded on that server path).
PrintData buildPrintData({
  required CollectResult result,
  required CollectionPreview? previewSnapshot,
  required String houseName,
  required String renterName,
  required String roomNumber,
}) {
  final invoice = previewSnapshot?.currentInvoice;
  final billingPeriodLabel = invoice != null
      ? _billingPeriodLabel(invoice.billingPeriodYear, invoice.billingPeriodMonth)
      : null;
  final invoiceNumber = invoice != null
      ? formatInvoiceNumber(roomNumber, invoice.billingPeriodYear, invoice.billingPeriodMonth)
      : null;

  return PrintData(
    houseName: houseName,
    renterName: renterName,
    roomNumber: roomNumber,
    invoiceNumber: invoiceNumber,
    billingPeriodLabel: billingPeriodLabel,
    issuedAt: invoice?.issuedAt,
    dueDate: invoice?.dueDate,
    // Electricity is rendered separately below (electricityAmount) — filter
    // it out of lineItems here so it's never shown twice. The invoice's own
    // line_items DOES include an "Electricity" row when a meter reading
    // existed at generation time (InvoiceService::computeInvoiceLines), in
    // addition to the dedicated electricity_amount column.
    lineItems: invoice?.lineItems
            .where((item) => item.head != 'ELECTRICITY')
            .map((item) => PrintLineItem(label: item.label, amount: item.amount))
            .toList() ??
        const [],
    electricityAmount: _computeElectricityAmount(invoice),
    totalAmount: invoice?.totalAmount,
    payment: PrintPaymentInfo(
      id: result.payment.id,
      amount: result.payment.amount,
      method: result.payment.paymentMethod,
      paidAt: result.payment.paidAt,
      reference: result.payment.reference,
    ),
    applications: resolveApplicationLines(
      result.payment.applications,
      billingPeriodLabel: billingPeriodLabel,
      dues: previewSnapshot?.openDues ?? const [],
    ),
    dueBeforePayment: _computeDueBeforePayment(previewSnapshot, result),
    balanceRemaining: result.grandTotalOutstanding,
  );
}
