import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_envelope.dart';
import '../api/dio_client.dart';
import 'auth_response.dart';
import 'token_storage.dart';
import 'user_model.dart';

class AuthRepository {
  const AuthRepository(this._dio, this._tokenStorage);

  final Dio _dio;
  final TokenStorage _tokenStorage;

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
      final data = unwrapData(res.data as Map<String, dynamic>);
      final authResponse = AuthResponse.fromJson(data as Map<String, dynamic>);
      await _tokenStorage.saveTokens(
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      );
      return authResponse;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout');
    } finally {
      await _tokenStorage.clearTokens();
    }
  }

  /// POST /auth/password — all THREE fields are required (the API enforces a
  /// `confirmed` rule on new_password, so new_password_confirmation must be
  /// present). On success the server flips status to ACTIVE and revokes all
  /// tokens; the caller must wipe the session and re-login.
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) async {
    try {
      await _dio.post('/auth/password', data: {
        'current_password': currentPassword,
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirmation,
      });
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// GET /auth/me returns `{user: {...}, permissions: [...]}` — NESTED, not
  /// the User fields directly. Only the User is consumed today (by
  /// AuthController.build() on cold start), so permissions are read here but
  /// not yet threaded anywhere; wiring them into canProvider is a separate,
  /// deliberately deferred refactor.
  Future<User> me() async {
    try {
      final res = await _dio.get('/auth/me');
      final data =
          unwrapData(res.data as Map<String, dynamic>) as Map<String, dynamic>;
      return User.fromJson(data['user'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// PATCH /auth/me — self-service; only full_name/mobile are editable
  /// server-side (email/role/status/password/parent_owner_id sent here would
  /// be silently ignored, so only send what actually changed). Response is
  /// the same nested {user, permissions} shape as GET /auth/me.
  Future<User> updateProfile({String? fullName, String? mobile}) async {
    try {
      final body = <String, dynamic>{
        'full_name': ?fullName,
        'mobile': ?mobile,
      };
      final res = await _dio.patch('/auth/me', data: body);
      final data =
          unwrapData(res.data as Map<String, dynamic>) as Map<String, dynamic>;
      return User.fromJson(data['user'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.read(dioProvider),
    ref.read(tokenStorageProvider),
  );
});
