// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_House _$HouseFromJson(Map<String, dynamic> json) => _House(
  id: json['id'] as String,
  ownerId: json['owner_id'] as String,
  name: json['name'] as String,
  address: json['address'] as String?,
  city: json['city'] as String?,
  totalFloors: (json['total_floors'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$HouseToJson(_House instance) => <String, dynamic>{
  'id': instance.id,
  'owner_id': instance.ownerId,
  'name': instance.name,
  'address': instance.address,
  'city': instance.city,
  'total_floors': instance.totalFloors,
  'notes': instance.notes,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
