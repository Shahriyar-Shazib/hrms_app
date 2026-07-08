// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLog _$AuditLogFromJson(Map<String, dynamic> json) => _AuditLog(
  id: json['id'] as String,
  entityType: json['entity_type'] as String,
  entityId: json['entity_id'] as String,
  action: json['action'] as String,
  before: json['before'] as Map<String, dynamic>?,
  after: json['after'] as Map<String, dynamic>?,
  actorUserId: json['actor_user_id'] as String?,
  actorRole: json['actor_role'] as String?,
  houseId: json['house_id'] as String?,
  ip: json['ip'] as String?,
  occurredAt: json['occurred_at'] as String,
);

Map<String, dynamic> _$AuditLogToJson(_AuditLog instance) => <String, dynamic>{
  'id': instance.id,
  'entity_type': instance.entityType,
  'entity_id': instance.entityId,
  'action': instance.action,
  'before': instance.before,
  'after': instance.after,
  'actor_user_id': instance.actorUserId,
  'actor_role': instance.actorRole,
  'house_id': instance.houseId,
  'ip': instance.ip,
  'occurred_at': instance.occurredAt,
};
