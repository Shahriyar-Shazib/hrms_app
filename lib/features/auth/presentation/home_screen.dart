import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../core/auth/user_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String _roleLabel(UserRole? role) => switch (role) {
        UserRole.superAdmin => 'Super Admin',
        UserRole.houseOwner => 'House Owner',
        UserRole.manager => 'Manager',
        null => 'Unknown',
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final role = ref.watch(currentRoleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HRMS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () =>
                ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 64),
            const SizedBox(height: 16),
            Text(
              'Welcome, ${user?.fullName ?? '...'}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Chip(label: Text(_roleLabel(role))),
            const SizedBox(height: 4),
            Text(user?.email ?? '',
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.push('/houses'),
              icon: const Icon(Icons.home_work),
              label: const Text('Houses'),
            ),
          ],
        ),
      ),
    );
  }
}
