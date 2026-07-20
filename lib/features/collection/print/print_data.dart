/// Plain Dart (no freezed/JSON codegen needed — this is assembled
/// client-side from already-parsed models, never deserialized itself).
/// Pre-resolves everything to display strings: no UUIDs, no client-side
/// money math. Shared by both the A4 invoice and thermal receipt PDFs.
class PrintLineItem {
  const PrintLineItem({required this.label, required this.amount});
  final String label;
  final String amount;
}

class PrintApplicationLine {
  const PrintApplicationLine({required this.label, required this.amount});
  final String label;
  final String amount;
}

class PrintPaymentInfo {
  const PrintPaymentInfo({
    required this.id,
    required this.amount,
    required this.method,
    required this.paidAt,
    this.reference,
  });

  final String id;
  final String amount;
  final String method;
  final String paidAt;
  final String? reference;
}

class PrintData {
  const PrintData({
    required this.houseName,
    required this.renterName,
    required this.roomNumber,
    required this.invoiceNumber,
    required this.billingPeriodLabel,
    required this.issuedAt,
    required this.dueDate,
    required this.lineItems,
    required this.totalAmount,
    required this.payment,
    required this.applications,
    required this.balanceRemaining,
  });

  final String houseName;
  final String renterName;
  final String roomNumber;

  /// Null when there was no current invoice for this payment (a dues-only
  /// collection) — the A4 invoice button is disabled in that case.
  final String? invoiceNumber;
  final String? billingPeriodLabel;
  final String? issuedAt;
  final String? dueDate;
  final List<PrintLineItem> lineItems;
  final String? totalAmount;

  final PrintPaymentInfo payment;
  final List<PrintApplicationLine> applications;
  final String balanceRemaining;
}
