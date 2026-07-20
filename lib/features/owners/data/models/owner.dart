import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner.freezed.dart';
part 'owner.g.dart';

enum OwnerStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('SUSPENDED')
  suspended,
  @JsonValue('PASSWORD_RESET_REQUIRED')
  passwordResetRequired,
}

/// SA-managed HOUSE_OWNER account (SPEC §6). Online-only — no drift cache.
@freezed
abstract class Owner with _$Owner {
  const factory Owner({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    String? mobile,
    required String role,
    required OwnerStatus status,
    @JsonKey(name: 'must_reset_password') @Default(false) bool mustResetPassword,
    @JsonKey(name: 'houses_count') int? housesCount,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
