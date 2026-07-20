// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Owner _$OwnerFromJson(Map<String, dynamic> json) => _Owner(
  id: json['id'] as String,
  email: json['email'] as String,
  fullName: json['full_name'] as String,
  mobile: json['mobile'] as String?,
  role: json['role'] as String,
  status: $enumDecode(_$OwnerStatusEnumMap, json['status']),
  mustResetPassword: json['must_reset_password'] as bool? ?? false,
  housesCount: (json['houses_count'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$OwnerToJson(_Owner instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'full_name': instance.fullName,
  'mobile': instance.mobile,
  'role': instance.role,
  'status': _$OwnerStatusEnumMap[instance.status]!,
  'must_reset_password': instance.mustResetPassword,
  'houses_count': instance.housesCount,
  'created_at': instance.createdAt,
};

const _$OwnerStatusEnumMap = {
  OwnerStatus.active: 'ACTIVE',
  OwnerStatus.suspended: 'SUSPENDED',
  OwnerStatus.passwordResetRequired: 'PASSWORD_RESET_REQUIRED',
};
