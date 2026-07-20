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
  mobile: json['mobile'] as String?,
  parentOwnerId: json['parent_owner_id'] as String?,
  lastLoginAt: json['last_login_at'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'full_name': instance.fullName,
  'role': _$UserRoleEnumMap[instance.role]!,
  'status': instance.status,
  'mobile': instance.mobile,
  'parent_owner_id': instance.parentOwnerId,
  'last_login_at': instance.lastLoginAt,
  'created_at': instance.createdAt,
};

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'SUPER_ADMIN',
  UserRole.houseOwner: 'HOUSE_OWNER',
  UserRole.manager: 'MANAGER',
};
