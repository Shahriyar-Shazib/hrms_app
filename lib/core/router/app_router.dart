import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/home_screen.dart';
import '../../features/houses/presentation/houses_list_screen.dart';
import '../../features/houses/presentation/house_detail_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authNotifier = ValueNotifier<AuthState?>(null);

  ref.listen<AsyncValue<AuthState>>(authControllerProvider, (_, next) {
    authNotifier.value = next.asData?.value;
  });

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = authNotifier.value;
      final isLoginRoute = state.matchedLocation == '/login';

      if (authState == null || authState.status == AuthStatus.unknown) {
        return null; // Wait for auth to resolve.
      }

      if (authState.status == AuthStatus.loggedOut) {
        return isLoginRoute ? null : '/login';
      }

      // Logged in.
      return isLoginRoute ? '/home' : null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, _) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, _) => const HomeScreen(),
      ),
      GoRoute(
        path: '/houses',
        builder: (context, _) => const HousesListScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) => HouseDetailScreen(
              houseId: state.pathParameters['id']!,
            ),
          ),
        ],
      ),
    ],
  );
});
