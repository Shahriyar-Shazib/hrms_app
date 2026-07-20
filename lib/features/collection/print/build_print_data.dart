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
    lineItems: invoice?.lineItems
            .map((item) => PrintLineItem(label: item.label, amount: item.amount))
            .toList() ??
        const [],
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
    balanceRemaining: result.grandTotalOutstanding,
  );
}
