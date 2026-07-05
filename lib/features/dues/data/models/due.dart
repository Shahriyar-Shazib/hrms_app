import 'package:freezed_annotation/freezed_annotation.dart';

part 'due.freezed.dart';
part 'due.g.dart';

@freezed
abstract class Due with _$Due {
  const factory Due({
    required String id,
    @JsonKey(name: 'renter_id') required String renterId,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'room_id_at_creation') String? roomIdAtCreation,
    required String head,
    @JsonKey(name: 'head_label') required String headLabel,
    required String amount,
    @JsonKey(name: 'paid_amount') required String paidAmount,
    required String outstanding,
    @JsonKey(name: 'due_date') required String dueDate,
    required String source,
    String? reason,
    required String status,
    @JsonKey(name: 'linked_invoice_id') String? linkedInvoiceId,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'paid_at') String? paidAt,
    @JsonKey(name: 'waived_by') String? waivedBy,
    @JsonKey(name: 'waive_reason') String? waiveReason,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Due;

  factory Due.fromJson(Map<String, dynamic> json) => _$DueFromJson(json);
}
