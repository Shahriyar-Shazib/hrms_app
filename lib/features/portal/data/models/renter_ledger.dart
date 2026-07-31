import 'package:freezed_annotation/freezed_annotation.dart';

part 'renter_ledger.freezed.dart';
part 'renter_ledger.g.dart';

@freezed
abstract class LedgerPeriod with _$LedgerPeriod {
  const factory LedgerPeriod({
    required int year,
    required int month,
  }) = _LedgerPeriod;

  factory LedgerPeriod.fromJson(Map<String, dynamic> json) =>
      _$LedgerPeriodFromJson(json);
}

@freezed
abstract class LedgerInvoice with _$LedgerInvoice {
  const factory LedgerInvoice({
    required String id,
    required LedgerPeriod period,
    @JsonKey(name: 'total_amount') required String totalAmount,
    @JsonKey(name: 'paid_amount') required String paidAmount,
    required String status,
    @JsonKey(name: 'issued_at') required String issuedAt,
  }) = _LedgerInvoice;

  factory LedgerInvoice.fromJson(Map<String, dynamic> json) =>
      _$LedgerInvoiceFromJson(json);
}

@freezed
abstract class LedgerDue with _$LedgerDue {
  const factory LedgerDue({
    required String id,
    required String head,
    @JsonKey(name: 'head_label') required String headLabel,
    required String amount,
    @JsonKey(name: 'paid_amount') required String paidAmount,
    required String status,
    required String source,
    @JsonKey(name: 'due_date') required String dueDate,
    @JsonKey(name: 'waived_by') String? waivedBy,
    @JsonKey(name: 'waive_reason') String? waiveReason,
  }) = _LedgerDue;

  factory LedgerDue.fromJson(Map<String, dynamic> json) =>
      _$LedgerDueFromJson(json);
}

@freezed
abstract class LedgerPaymentApplication with _$LedgerPaymentApplication {
  const factory LedgerPaymentApplication({
    @JsonKey(name: 'target_type') required String targetType,
    @JsonKey(name: 'target_id') required String targetId,
    @JsonKey(name: 'applied_amount') required String appliedAmount,
  }) = _LedgerPaymentApplication;

  factory LedgerPaymentApplication.fromJson(Map<String, dynamic> json) =>
      _$LedgerPaymentApplicationFromJson(json);
}

@freezed
abstract class LedgerPayment with _$LedgerPayment {
  const factory LedgerPayment({
    required String id,
    required String amount,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'paid_at') required String paidAt,
    @Default(<LedgerPaymentApplication>[])
    List<LedgerPaymentApplication> applications,
  }) = _LedgerPayment;

  factory LedgerPayment.fromJson(Map<String, dynamic> json) =>
      _$LedgerPaymentFromJson(json);
}

@freezed
abstract class LedgerSummary with _$LedgerSummary {
  const factory LedgerSummary({
    @JsonKey(name: 'total_billed') required String totalBilled,
    @JsonKey(name: 'total_paid') required String totalPaid,
    @JsonKey(name: 'total_outstanding') required String totalOutstanding,
    @JsonKey(name: 'total_waived') required String totalWaived,
  }) = _LedgerSummary;

  factory LedgerSummary.fromJson(Map<String, dynamic> json) =>
      _$LedgerSummaryFromJson(json);
}

/// GET /me/renter-profiles/{renterId}/ledger — a renter's own read-only view
/// of their invoices/dues/payments across their whole tenancy at that house.
@freezed
abstract class RenterLedger with _$RenterLedger {
  const factory RenterLedger({
    @Default(<LedgerInvoice>[]) List<LedgerInvoice> invoices,
    @Default(<LedgerDue>[]) List<LedgerDue> dues,
    @Default(<LedgerPayment>[]) List<LedgerPayment> payments,
    required LedgerSummary summary,
  }) = _RenterLedger;

  factory RenterLedger.fromJson(Map<String, dynamic> json) =>
      _$RenterLedgerFromJson(json);
}
