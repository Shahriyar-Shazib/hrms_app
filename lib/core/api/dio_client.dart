import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../auth/token_storage.dart';
import 'api_config.dart';
import 'api_exception.dart';
import 'auth_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  dio.interceptors.add(AuthInterceptor(
    dio: dio,
    tokenStorage: ref.read(tokenStorageProvider),
    onLogout: () => ref.read(authLogoutCallbackProvider).callback?.call(),
  ));

  if (kDebugMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
  }

  return dio;
});

/// Mutable holder so auth_interceptor can signal logout without a circular
/// dep. A plain field (not a Notifier's state) so AuthController can wire it
/// up during its own build() without tripping Riverpod's "providers can't
/// modify other providers while building" assertion.
class LogoutCallbackHolder {
  void Function()? callback;
}

final authLogoutCallbackProvider =
    Provider<LogoutCallbackHolder>((ref) => LogoutCallbackHolder());

/// Converts a Dio error into an [ApiException].
ApiException dioErrorToApiException(DioException e) {
  final data = e.response?.data;
  if (data is Map<String, dynamic> && data.containsKey('error')) {
    final err = data['error'] as Map<String, dynamic>;
    return ApiException(
      code: err['code'] as String? ?? 'UNKNOWN',
      message: err['message'] as String? ?? 'Unknown error',
      details: err['details'],
      httpStatus: e.response?.statusCode,
    );
  }
  return ApiException(
    code: 'NETWORK_ERROR',
    message: e.message ?? 'Network error',
    httpStatus: e.response?.statusCode,
  );
}
