import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    onLogout: () => ref.read(authLogoutCallbackProvider)?.call(),
  ));

  return dio;
});

/// Callback provider so auth_interceptor can signal logout without a circular dep.
class _LogoutCallbackNotifier extends Notifier<void Function()?> {
  @override
  void Function()? build() => null;
}

final authLogoutCallbackProvider =
    NotifierProvider<_LogoutCallbackNotifier, void Function()?>(_LogoutCallbackNotifier.new);

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
