import '../data/models/collection.dart';
import 'print_data.dart';

// English constants — the PDF itself is an English-labeled document, so
// billing-period values stay English too rather than mixing in the
// on-screen localized month name.
const _englishMonths = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
];

String _billingPeriodLabel(int year, int month) => '${_englishMonths[month - 1]} $year';

/// payment.applications only carries targetType/targetId/appliedAmount —
/// resolve human labels from the PRE-collect preview snapshot (invoices +
/// open dues). Post-collect, a fully-paid due drops out of "open" entirely
/// and a fully-paid invoice stops being "current", so both would be
/// unresolvable if looked up AFTER the collect call instead of before it.
///
/// [invoices] is a list (a renter may hold several rooms) — each
/// INVOICE-type application is matched back to its own invoice by id so a
/// multi-room payment's receipt attributes each line to the right period.
List<PrintApplicationLine> resolveApplicationLines(
  List<PaymentApplication> applications, {
  required List<PreviewInvoice> invoices,
  required List<PreviewDue> dues,
}) {
  final invoiceById = {for (final invoice in invoices) invoice.id: invoice};
  final dueLabelById = {for (final due in dues) due.id: due.headLabel};
  return applications.map((app) {
    if (app.targetType == 'INVOICE') {
      final invoice = invoiceById[app.targetId];
      final label = invoice != null
          ? '${_billingPeriodLabel(invoice.billingPeriodYear, invoice.billingPeriodMonth)} invoice'
          : 'Invoice';
      return PrintApplicationLine(label: label, amount: app.appliedAmount);
    }
    return PrintApplicationLine(
      label: dueLabelById[app.targetId] ?? 'Due',
      amount: app.appliedAmount,
    );
  }).toList();
}
