import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_config.freezed.dart';
part 'bill_config.g.dart';

@freezed
abstract class BillConfig with _$BillConfig {
  const factory BillConfig({
    required String id,
    @JsonKey(name: 'house_id') required String houseId,
    required String head,
    required String label,
    required String amount,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'effective_from') required String effectiveFrom,
    @JsonKey(name: 'effective_to') String? effectiveTo,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _BillConfig;

  factory BillConfig.fromJson(Map<String, dynamic> json) =>
      _$BillConfigFromJson(json);
}
