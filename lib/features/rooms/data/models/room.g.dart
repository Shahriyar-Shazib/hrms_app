// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentRenter _$CurrentRenterFromJson(Map<String, dynamic> json) =>
    _CurrentRenter(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      mobile: json['mobile'] as String,
      moveInDate: json['move_in_date'] as String,
    );

Map<String, dynamic> _$CurrentRenterToJson(_CurrentRenter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'mobile': instance.mobile,
      'move_in_date': instance.moveInDate,
    };

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
  currentRenter: json['current_renter'] == null
      ? null
      : CurrentRenter.fromJson(json['current_renter'] as Map<String, dynamic>),
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
  'current_renter': instance.currentRenter,
};
