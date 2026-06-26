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

  Future<User> me() async {
    try {
      final res = await _dio.get('/auth/me');
      final data = unwrapData(res.data as Map<String, dynamic>);
      return User.fromJson(data as Map<String, dynamic>);
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
