// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenterProfile _$RenterProfileFromJson(Map<String, dynamic> json) =>
    _RenterProfile(
      id: json['id'] as String,
      houseId: json['house_id'] as String,
      houseName: json['house_name'] as String,
      fullName: json['full_name'] as String,
      mobile: json['mobile'] as String,
      status: json['status'] as String,
      currentRoomNumbers:
          (json['current_room_numbers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$RenterProfileToJson(_RenterProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'house_id': instance.houseId,
      'house_name': instance.houseName,
      'full_name': instance.fullName,
      'mobile': instance.mobile,
      'status': instance.status,
      'current_room_numbers': instance.currentRoomNumbers,
    };
