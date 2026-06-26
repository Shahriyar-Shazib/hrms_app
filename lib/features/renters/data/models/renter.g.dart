// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentAssignment _$CurrentAssignmentFromJson(Map<String, dynamic> json) =>
    _CurrentAssignment(
      roomId: json['room_id'] as String,
      roomNumber: json['room_number'] as String,
      moveInDate: json['move_in_date'] as String,
    );

Map<String, dynamic> _$CurrentAssignmentToJson(_CurrentAssignment instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'room_number': instance.roomNumber,
      'move_in_date': instance.moveInDate,
    };

_Renter _$RenterFromJson(Map<String, dynamic> json) => _Renter(
  id: json['id'] as String,
  houseId: json['house_id'] as String,
  fullName: json['full_name'] as String,
  mobile: json['mobile'] as String,
  nidNumber: json['nid_number'] as String?,
  photoUrl: json['photo_url'] as String?,
  nidPhotoUrl: json['nid_photo_url'] as String?,
  presentAddress: json['present_address'] as String?,
  permanentAddress: json['permanent_address'] as String?,
  occupation: json['occupation'] as String?,
  organization: json['organization'] as String?,
  emergencyContactName: json['emergency_contact_name'] as String?,
  emergencyContactMobile: json['emergency_contact_mobile'] as String?,
  advanceAmount: json['advance_amount'] as String,
  status: json['status'] as String,
  createdBy: json['created_by'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  currentAssignment: json['current_assignment'] == null
      ? null
      : CurrentAssignment.fromJson(
          json['current_assignment'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$RenterToJson(_Renter instance) => <String, dynamic>{
  'id': instance.id,
  'house_id': instance.houseId,
  'full_name': instance.fullName,
  'mobile': instance.mobile,
  'nid_number': instance.nidNumber,
  'photo_url': instance.photoUrl,
  'nid_photo_url': instance.nidPhotoUrl,
  'present_address': instance.presentAddress,
  'permanent_address': instance.permanentAddress,
  'occupation': instance.occupation,
  'organization': instance.organization,
  'emergency_contact_name': instance.emergencyContactName,
  'emergency_contact_mobile': instance.emergencyContactMobile,
  'advance_amount': instance.advanceAmount,
  'status': instance.status,
  'created_by': instance.createdBy,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'current_assignment': instance.currentAssignment,
};
