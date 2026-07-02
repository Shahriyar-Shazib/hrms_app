import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager.freezed.dart';
part 'manager.g.dart';

@freezed
abstract class Manager with _$Manager {
  const factory Manager({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    required String role,
    required String status,
    @JsonKey(name: 'must_reset_password') required bool mustResetPassword,
    @JsonKey(name: 'parent_owner_id') String? parentOwnerId,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Manager;

  factory Manager.fromJson(Map<String, dynamic> json) =>
      _$ManagerFromJson(json);
}

@freezed
abstract class ManagerSummary with _$ManagerSummary {
  const factory ManagerSummary({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    required String email,
  }) = _ManagerSummary;

  factory ManagerSummary.fromJson(Map<String, dynamic> json) =>
      _$ManagerSummaryFromJson(json);
}

@freezed
abstract class HouseManagerAssignment with _$HouseManagerAssignment {
  const factory HouseManagerAssignment({
    required String id,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'manager_user_id') required String managerUserId,
    @JsonKey(name: 'can_log_expenses') required bool canLogExpenses,
    @JsonKey(name: 'assigned_by') String? assignedBy,
    @JsonKey(name: 'assigned_at') String? assignedAt,
    @JsonKey(name: 'revoked_at') String? revokedAt,
    ManagerSummary? manager,
  }) = _HouseManagerAssignment;

  factory HouseManagerAssignment.fromJson(Map<String, dynamic> json) =>
      _$HouseManagerAssignmentFromJson(json);
}
