import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/dio_client.dart';
import '../db/database.dart';
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

  /// Rethrows on failure so LoginScreen._submit can show the specific message.
  ///
  /// Deliberately does NOT flip [state] to loading/error during the attempt:
  /// the router redirect reads `asData?.value`, so ANY non-data state (loading
  /// OR error) makes it treat the session as "still resolving" and bounce to
  /// /splash — unmounting the login form mid-request, so the error lands on a
  /// dead widget and a fresh (blank) form replaces it. Staying in
  /// AsyncData(loggedOut) keeps the form mounted; the LoginScreen owns its own
  /// submitting spinner. On success we go straight to AsyncData(loggedIn).
  Future<void> login({required String email, required String password}) async {
    try {
      final response = await ref.read(authRepositoryProvider).login(
            email: email,
            password: password,
          );

      // Account-switch guard (security): if the previously-cached user differs
      // from the one just logged in, wipe the drift cache BEFORE their state
      // goes live, so an earlier session's data (e.g. an SA's cross-owner
      // houses) cannot bleed into this user. First login on a device
      // (lastUserId == null) has nothing to bleed, so no wipe needed.
      final tokenStorage = ref.read(tokenStorageProvider);
      final lastUserId = await tokenStorage.readLastUserId();
      if (lastUserId != null && lastUserId != response.user.id) {
        await ref.read(appDatabaseProvider).wipeAllData();
      }
      await tokenStorage.saveLastUserId(response.user.id);

      state = AsyncValue.data(
        AuthState(status: AuthStatus.loggedIn, user: response.user),
      );
    } catch (e) {
      // Ensure the provider is AsyncData(loggedOut) — the form stays mounted
      // (router shows /login), and rethrow lets LoginScreen render the message.
      state = const AsyncValue.data(AuthState(status: AuthStatus.loggedOut));
      rethrow;
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    // Wipe cached data on logout so the next user starts clean (drift is
    // on-disk and would otherwise survive). Remember-Me creds live in secure
    // storage and are untouched.
    await ref.read(appDatabaseProvider).wipeAllData();
    state = const AsyncValue.data(AuthState(status: AuthStatus.loggedOut));
  }

  /// Swaps in a freshly-saved User (from PATCH /auth/me) without touching
  /// tokens or re-fetching the session — the profile screen calls this so
  /// currentUserProvider (and anything watching it, e.g. the home header)
  /// reflects the new name/mobile immediately.
  void updateCurrentUser(User user) {
    final current = state.asData?.value;
    if (current == null) return;
    state = AsyncValue.data(AuthState(status: current.status, user: user));
  }

  /// Tear down the local session WITHOUT calling POST /auth/logout — used
  /// after a password change, where the server has already revoked every
  /// token (so a logout call would 401). Clears tokens, wipes the cache, and
  /// drops to loggedOut (router then redirects to /login).
  Future<void> clearSessionLocally() async {
    await ref.read(tokenStorageProvider).clearTokens();
    await ref.read(appDatabaseProvider).wipeAllData();
    state = const AsyncValue.data(AuthState(status: AuthStatus.loggedOut));
  }

  void _handleLogout() {
    // Forced logout (e.g. refresh failed in the interceptor). Fire-and-forget
    // the cache wipe — the redirect to /login unmounts screens and disposes
    // autoDispose providers; the DB wipe clears the persistent layer.
    ref.read(appDatabaseProvider).wipeAllData();
    state = const AsyncValue.data(AuthState(status: AuthStatus.loggedOut));
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(AuthController.new);
