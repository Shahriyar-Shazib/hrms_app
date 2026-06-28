// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillConfig _$BillConfigFromJson(Map<String, dynamic> json) => _BillConfig(
  id: json['id'] as String,
  houseId: json['house_id'] as String,
  head: json['head'] as String,
  label: json['label'] as String,
  amount: json['amount'] as String,
  isActive: json['is_active'] as bool,
  effectiveFrom: json['effective_from'] as String,
  effectiveTo: json['effective_to'] as String?,
  createdBy: json['created_by'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$BillConfigToJson(_BillConfig instance) =>
    <String, dynamic>{
      'id': instance.id,
      'house_id': instance.houseId,
      'head': instance.head,
      'label': instance.label,
      'amount': instance.amount,
      'is_active': instance.isActive,
      'effective_from': instance.effectiveFrom,
      'effective_to': instance.effectiveTo,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
    };
