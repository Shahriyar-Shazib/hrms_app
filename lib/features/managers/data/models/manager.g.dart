// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Manager _$ManagerFromJson(Map<String, dynamic> json) => _Manager(
  id: json['id'] as String,
  email: json['email'] as String,
  fullName: json['full_name'] as String,
  role: json['role'] as String,
  status: json['status'] as String,
  mustResetPassword: json['must_reset_password'] as bool,
  parentOwnerId: json['parent_owner_id'] as String?,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$ManagerToJson(_Manager instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'full_name': instance.fullName,
  'role': instance.role,
  'status': instance.status,
  'must_reset_password': instance.mustResetPassword,
  'parent_owner_id': instance.parentOwnerId,
  'created_at': instance.createdAt,
};

_ManagerSummary _$ManagerSummaryFromJson(Map<String, dynamic> json) =>
    _ManagerSummary(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ManagerSummaryToJson(_ManagerSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
    };

_HouseManagerAssignment _$HouseManagerAssignmentFromJson(
  Map<String, dynamic> json,
) => _HouseManagerAssignment(
  id: json['id'] as String,
  houseId: json['house_id'] as String,
  managerUserId: json['manager_user_id'] as String,
  canLogExpenses: json['can_log_expenses'] as bool,
  assignedBy: json['assigned_by'] as String?,
  assignedAt: json['assigned_at'] as String?,
  revokedAt: json['revoked_at'] as String?,
  manager: json['manager'] == null
      ? null
      : ManagerSummary.fromJson(json['manager'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HouseManagerAssignmentToJson(
  _HouseManagerAssignment instance,
) => <String, dynamic>{
  'id': instance.id,
  'house_id': instance.houseId,
  'manager_user_id': instance.managerUserId,
  'can_log_expenses': instance.canLogExpenses,
  'assigned_by': instance.assignedBy,
  'assigned_at': instance.assignedAt,
  'revoked_at': instance.revokedAt,
  'manager': instance.manager,
};
