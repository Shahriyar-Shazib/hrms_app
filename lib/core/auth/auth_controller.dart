import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/dio_client.dart';
import 'auth_repository.dart';
import 'token_storage.dart';
import 'user_model.dart';

enum AuthStatus { unknown, loggedOut, loggedIn }

class AuthState {
  const AuthState({required this.status, this.user});
  final AuthStatus status;
  final User? user;
}

class AuthController extends AsyncNotifier<AuthState> {
  @override
  Future<AuthState> build() async {
    // Wire the logout callback into the dio interceptor.
    ref.read(authLogoutCallbackProvider).callback = _handleLogout;

    final token = await ref.read(tokenStorageProvider).readAccessToken();
    if (token == null) {
      return const AuthState(status: AuthStatus.loggedOut);
    }
    try {
      final user = await ref.read(authRepositoryProvider).me();
      return AuthState(status: AuthStatus.loggedIn, user: user);
    } catch (_) {
      // Any failure resolving the session (network error, malformed
      // response, etc.) must resolve to loggedOut — never leave this as an
      // uncaught AsyncError, or the router's redirect (which only reacts to
      // AsyncData) has nothing to react to and gets stuck on /splash forever.
      return const AuthState(status: AuthStatus.loggedOut);
    }
  }

  /// Rethrows on failure (after recording the error in [state]) so callers
  /// can react to the specific exception without reading `state` back after
  /// an await — by the time a successful login resolves here, the router's
  /// redirect may already have unmounted the caller.
  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    try {
      final response = await ref.read(authRepositoryProvider).login(
            email: email,
            password: password,
          );
      state = AsyncValue.data(
        AuthState(status: AuthStatus.loggedIn, user: response.user),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncValue.data(AuthState(status: AuthStatus.loggedOut));
  }

  void _handleLogout() {
    state = const AsyncValue.data(AuthState(status: AuthStatus.loggedOut));
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(AuthController.new);
