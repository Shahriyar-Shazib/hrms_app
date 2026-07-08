import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log.freezed.dart';
part 'audit_log.g.dart';

@freezed
abstract class AuditLog with _$AuditLog {
  const factory AuditLog({
    required String id,
    @JsonKey(name: 'entity_type') required String entityType,
    @JsonKey(name: 'entity_id') required String entityId,
    required String action,
    Map<String, dynamic>? before,
    Map<String, dynamic>? after,
    @JsonKey(name: 'actor_user_id') String? actorUserId,
    @JsonKey(name: 'actor_role') String? actorRole,
    @JsonKey(name: 'house_id') String? houseId,
    String? ip,
    @JsonKey(name: 'occurred_at') required String occurredAt,
  }) = _AuditLog;

  factory AuditLog.fromJson(Map<String, dynamic> json) =>
      _$AuditLogFromJson(json);
}
