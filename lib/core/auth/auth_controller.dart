import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/api_exception.dart';
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
    ref.read(authLogoutCallbackProvider.notifier).state = _handleLogout; // ignore: invalid_use_of_protected_member

    final token = await ref.read(tokenStorageProvider).readAccessToken();
    if (token == null) {
      return const AuthState(status: AuthStatus.loggedOut);
    }
    try {
      final user = await ref.read(authRepositoryProvider).me();
      return AuthState(status: AuthStatus.loggedIn, user: user);
    } on ApiException {
      return const AuthState(status: AuthStatus.loggedOut);
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final response = await ref.read(authRepositoryProvider).login(
            email: email,
            password: password,
          );
      return AuthState(status: AuthStatus.loggedIn, user: response.user);
    });
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
