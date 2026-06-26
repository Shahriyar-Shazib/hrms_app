// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['id'] as String,
  houseId: json['house_id'] as String,
  roomNumber: json['room_number'] as String,
  floor: (json['floor'] as num?)?.toInt(),
  baseRent: json['base_rent'] as String,
  meterAttached: json['meter_attached'] as bool,
  meterNumber: json['meter_number'] as String?,
  status: json['status'] as String,
  notes: json['notes'] as String?,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'house_id': instance.houseId,
  'room_number': instance.roomNumber,
  'floor': instance.floor,
  'base_rent': instance.baseRent,
  'meter_attached': instance.meterAttached,
  'meter_number': instance.meterNumber,
  'status': instance.status,
  'notes': instance.notes,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
