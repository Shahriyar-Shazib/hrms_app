import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole {
  @JsonValue('SUPER_ADMIN')
  superAdmin,
  @JsonValue('HOUSE_OWNER')
  houseOwner,
  @JsonValue('MANAGER')
  manager,
}

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    required UserRole role,
    required String status,
    // Not present on the (minimal) login response's `user` object — only
    // populated once GET/PATCH /auth/me has been called.
    String? mobile,
    @JsonKey(name: 'parent_owner_id') String? parentOwnerId,
    @JsonKey(name: 'last_login_at') String? lastLoginAt,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
