import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../collection/data/models/collection.dart' show LineItem;

part 'invoice.freezed.dart';
part 'invoice.g.dart';

/// Confirmed against a live probe of GET /houses/{h}/invoices. No
/// `renter_name`/`room_number`/`outstanding` fields exist — the UI resolves
/// display names from the cached renters/rooms lists instead, and shows
/// Total + Paid rather than a computed Outstanding.
@freezed
abstract class Invoice with _$Invoice {
  const factory Invoice({
    required String id,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'renter_id') required String renterId,
    @JsonKey(name: 'billing_period_year') required int billingPeriodYear,
    @JsonKey(name: 'billing_period_month') required int billingPeriodMonth,
    @JsonKey(name: 'base_rent') required String baseRent,
    @JsonKey(name: 'electricity_amount') required String electricityAmount,
    @JsonKey(name: 'total_amount') required String totalAmount,
    @JsonKey(name: 'paid_amount') required String paidAmount,
    required String status,
    @JsonKey(name: 'issued_at') required String issuedAt,
    @JsonKey(name: 'due_date') required String dueDate,
    @JsonKey(name: 'created_at') required String createdAt,
    // Only present on the detail/generate responses, absent in the list.
    @JsonKey(name: 'line_items') List<LineItem>? lineItems,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}

/// A room skipped during generation because electricity usage couldn't be
/// billed (e.g. no meter reading logged for the period yet).
@freezed
abstract class GenerateWarning with _$GenerateWarning {
  const factory GenerateWarning({
    required String type,
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'room_number') required String roomNumber,
  }) = _GenerateWarning;

  factory GenerateWarning.fromJson(Map<String, dynamic> json) =>
      _$GenerateWarningFromJson(json);
}

/// Response of POST /houses/{houseId}/invoices/generate. `skipped` and
/// `dues_created` entries have an unconfirmed shape, so they're kept as raw
/// Map — displayed via key lookups rather than parsed into strict submodels.
@freezed
abstract class GenerateResult with _$GenerateResult {
  const factory GenerateResult({
    @JsonKey(name: 'already_generated') required bool alreadyGenerated,
    @Default(<Invoice>[]) List<Invoice> invoices,
    @Default(<GenerateWarning>[]) List<GenerateWarning> warnings,
    @Default(<Map<String, dynamic>>[]) List<Map<String, dynamic>> skipped,
    @JsonKey(name: 'closed_invoices')
    @Default(<Invoice>[])
    List<Invoice> closedInvoices,
    @JsonKey(name: 'dues_created')
    @Default(<Map<String, dynamic>>[])
    List<Map<String, dynamic>> duesCreated,
  }) = _GenerateResult;

  factory GenerateResult.fromJson(Map<String, dynamic> json) =>
      _$GenerateResultFromJson(json);
}
