import 'dart:async';
import 'package:dio/dio.dart';
import '../auth/token_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.dio,
    required this.tokenStorage,
    this.onLogout,
  });

  final Dio dio;
  final TokenStorage tokenStorage;
  final void Function()? onLogout;

  // Non-null while a token refresh is in flight. Concurrent 401s await this
  // future so they all get the new token the moment complete() fires — no list
  // to flush, no timing window where a late arrival goes unresolved.
  Completer<String>? _refreshCompleter;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // _retry() already stamps Authorization; don't overwrite it on the replay.
    if (!options.headers.containsKey('Authorization')) {
      final token = await tokenStorage.readAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }

    // Wrong-password 401 — surface as a clean error, don't attempt refresh.
    if (err.requestOptions.path.contains('/auth/login')) {
      handler.next(err);
      return;
    }

    // Refresh endpoint itself failed — the token is dead; force logout.
    if (err.requestOptions.path.contains('/auth/refresh')) {
      await tokenStorage.clearTokens();
      onLogout?.call();
      handler.next(err);
      return;
    }

    if (_refreshCompleter != null) {
      // A refresh is already in flight. Await it — when complete() fires every
      // waiter unblocks simultaneously, so no handler can be left unresolved.
      try {
        final token = await _refreshCompleter!.future;
        handler.resolve(await _retry(err.requestOptions, token));
      } catch (_) {
        handler.next(err);
      }
      return;
    }

    _refreshCompleter = Completer<String>();

    try {
      final refreshToken = await tokenStorage.readRefreshToken();
      if (refreshToken == null) throw Exception('No refresh token');

      // Bare Dio — no interceptors — to avoid re-entering this interceptor.
      final refreshDio = Dio(BaseOptions(
        baseUrl: dio.options.baseUrl,
        headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
      ));

      final response = await refreshDio.post('/auth/refresh', data: {
        'refresh_token': refreshToken,
      });

      final data = response.data['data'] as Map<String, dynamic>;
      final newAccess = data['access_token'] as String;
      final newRefresh = data['refresh_token'] as String;

      await tokenStorage.saveTokens(
        accessToken: newAccess,
        refreshToken: newRefresh,
      );

      // Unblock all concurrent waiters with the new token.
      _refreshCompleter!.complete(newAccess);
      handler.resolve(await _retry(err.requestOptions, newAccess));
    } catch (e) {
      _refreshCompleter!.completeError(e);
      await tokenStorage.clearTokens();
      onLogout?.call();
      handler.next(err);
    } finally {
      _refreshCompleter = null;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions options, String token) {
    return dio.request<dynamic>(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        // Authorization is set here so onRequest sees it and skips storage read.
        headers: {...options.headers, 'Authorization': 'Bearer $token'},
      ),
    );
  }
}
