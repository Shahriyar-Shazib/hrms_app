// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeterReading _$MeterReadingFromJson(Map<String, dynamic> json) =>
    _MeterReading(
      id: json['id'] as String,
      roomId: json['room_id'] as String,
      houseId: json['house_id'] as String,
      previousReading: json['previous_reading'] as String,
      currentReading: json['current_reading'] as String,
      unitsConsumed: json['units_consumed'] as String,
      readingDate: json['reading_date'] as String,
      billingPeriodYear: (json['billing_period_year'] as num).toInt(),
      billingPeriodMonth: (json['billing_period_month'] as num).toInt(),
      rateSnapshot: json['rate_snapshot'] as String,
      computedAmount: json['computed_amount'] as String,
      readingType: json['reading_type'] as String,
      adjustsReadingId: json['adjusts_reading_id'] as String?,
      recordedBy: json['recorded_by'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$MeterReadingToJson(_MeterReading instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room_id': instance.roomId,
      'house_id': instance.houseId,
      'previous_reading': instance.previousReading,
      'current_reading': instance.currentReading,
      'units_consumed': instance.unitsConsumed,
      'reading_date': instance.readingDate,
      'billing_period_year': instance.billingPeriodYear,
      'billing_period_month': instance.billingPeriodMonth,
      'rate_snapshot': instance.rateSnapshot,
      'computed_amount': instance.computedAmount,
      'reading_type': instance.readingType,
      'adjusts_reading_id': instance.adjustsReadingId,
      'recorded_by': instance.recordedBy,
      'created_at': instance.createdAt,
    };
