// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      accessExpiresAt: json['access_expires_at'] as String,
      refreshExpiresAt: json['refresh_expires_at'] as String,
      mustResetPassword: json['must_reset_password'] as bool? ?? false,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'access_expires_at': instance.accessExpiresAt,
      'refresh_expires_at': instance.refreshExpiresAt,
      'must_reset_password': instance.mustResetPassword,
      'user': instance.user,
    };
