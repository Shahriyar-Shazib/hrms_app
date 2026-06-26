// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  fullName: json['full_name'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  status: json['status'] as String,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'full_name': instance.fullName,
  'role': _$UserRoleEnumMap[instance.role]!,
  'status': instance.status,
};

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'SUPER_ADMIN',
  UserRole.houseOwner: 'HOUSE_OWNER',
  UserRole.manager: 'MANAGER',
};
