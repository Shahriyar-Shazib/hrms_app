import 'package:freezed_annotation/freezed_annotation.dart';

part 'meter_reading.freezed.dart';
part 'meter_reading.g.dart';

@freezed
abstract class MeterReading with _$MeterReading {
  const factory MeterReading({
    required String id,
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'previous_reading') required String previousReading,
    @JsonKey(name: 'current_reading') required String currentReading,
    @JsonKey(name: 'units_consumed') required String unitsConsumed,
    @JsonKey(name: 'reading_date') required String readingDate,
    @JsonKey(name: 'billing_period_year') required int billingPeriodYear,
    @JsonKey(name: 'billing_period_month') required int billingPeriodMonth,
    @JsonKey(name: 'rate_snapshot') required String rateSnapshot,
    @JsonKey(name: 'computed_amount') required String computedAmount,
    @JsonKey(name: 'reading_type') required String readingType,
    @JsonKey(name: 'adjusts_reading_id') String? adjustsReadingId,
    @JsonKey(name: 'recorded_by') required String recordedBy,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _MeterReading;

  factory MeterReading.fromJson(Map<String, dynamic> json) =>
      _$MeterReadingFromJson(json);
}
