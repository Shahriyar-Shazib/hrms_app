import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

// ─── Preview models ───────────────────────────────────────────────────────────

@freezed
abstract class LineItem with _$LineItem {
  const factory LineItem({
    required String id,
    required String head,
    required String label,
    required String amount,
    Map<String, dynamic>? metadata,
  }) = _LineItem;

  factory LineItem.fromJson(Map<String, dynamic> json) =>
      _$LineItemFromJson(json);
}

@freezed
abstract class ElectricityWarning with _$ElectricityWarning {
  const factory ElectricityWarning({
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'room_number') required String roomNumber,
    required String message,
  }) = _ElectricityWarning;

  factory ElectricityWarning.fromJson(Map<String, dynamic> json) =>
      _$ElectricityWarningFromJson(json);
}

@freezed
abstract class PreviewInvoice with _$PreviewInvoice {
  const factory PreviewInvoice({
    required String id,
    @JsonKey(name: 'billing_period_year') required int billingPeriodYear,
    @JsonKey(name: 'billing_period_month') required int billingPeriodMonth,
    @JsonKey(name: 'total_amount') required String totalAmount,
    @JsonKey(name: 'paid_amount') required String paidAmount,
    required String status,
    @JsonKey(name: 'issued_at') required String issuedAt,
    @JsonKey(name: 'due_date') required String dueDate,
    // Nullable: InvoiceResource (used by POST /collect) never emits this key
    // at all — `outstanding` is only computed and merged in by
    // CollectionController::preview(). Always present on the preview path.
    String? outstanding,
    @JsonKey(name: 'line_items') @Default(<LineItem>[]) List<LineItem> lineItems,
  }) = _PreviewInvoice;

  factory PreviewInvoice.fromJson(Map<String, dynamic> json) =>
      _$PreviewInvoiceFromJson(json);
}

@freezed
abstract class PreviewDue with _$PreviewDue {
  const factory PreviewDue({
    required String id,
    required String head,
    @JsonKey(name: 'head_label') required String headLabel,
    required String amount,
    @JsonKey(name: 'paid_amount') required String paidAmount,
    required String outstanding,
    @JsonKey(name: 'due_date') required String dueDate,
    required String status,
  }) = _PreviewDue;

  factory PreviewDue.fromJson(Map<String, dynamic> json) =>
      _$PreviewDueFromJson(json);
}

@freezed
abstract class CollectionPreview with _$CollectionPreview {
  const factory CollectionPreview({
    @JsonKey(name: 'current_invoice') PreviewInvoice? currentInvoice,
    @JsonKey(name: 'open_dues') required List<PreviewDue> openDues,
    @JsonKey(name: 'grand_total_outstanding')
    required String grandTotalOutstanding,
    @JsonKey(name: 'electricity_warning') ElectricityWarning? electricityWarning,
  }) = _CollectionPreview;

  factory CollectionPreview.fromJson(Map<String, dynamic> json) =>
      _$CollectionPreviewFromJson(json);
}

// ─── Collect result models ────────────────────────────────────────────────────

@freezed
abstract class PaymentApplication with _$PaymentApplication {
  const factory PaymentApplication({
    @JsonKey(name: 'target_type') required String targetType,
    @JsonKey(name: 'target_id') required String targetId,
    @JsonKey(name: 'applied_amount') required String appliedAmount,
  }) = _PaymentApplication;

  factory PaymentApplication.fromJson(Map<String, dynamic> json) =>
      _$PaymentApplicationFromJson(json);
}

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    required String id,
    required String amount,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    String? reference,
    @JsonKey(name: 'paid_at') required String paidAt,
    required List<PaymentApplication> applications,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}

@freezed
abstract class CollectResult with _$CollectResult {
  const factory CollectResult({
    required Payment payment,
    PreviewInvoice? invoice,
    @JsonKey(name: 'open_dues') required List<PreviewDue> openDues,
    @JsonKey(name: 'grand_total_outstanding')
    required String grandTotalOutstanding,
  }) = _CollectResult;

  factory CollectResult.fromJson(Map<String, dynamic> json) =>
      _$CollectResultFromJson(json);
}
