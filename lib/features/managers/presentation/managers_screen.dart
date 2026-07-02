import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../application/managers_controller.dart';
import '../data/models/manager.dart';

class ManagersScreen extends ConsumerWidget {
  const ManagersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(managersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Managers')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New Manager',
        onPressed: () => context.push('/managers/new'),
        child: const Icon(Icons.add),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : 'Failed to load managers',
          onRetry: () => ref.invalidate(managersProvider),
        ),
        data: (managers) => managers.isEmpty
            ? const Center(child: Text('No managers yet.'))
            : RefreshIndicator(
                onRefresh: () async => ref.invalidate(managersProvider),
                child: ListView.separated(
                  itemCount: managers.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, i) => _ManagerTile(managers[i]),
                ),
              ),
      ),
    );
  }
}

class _ManagerTile extends StatelessWidget {
  const _ManagerTile(this.manager);

  final Manager manager;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.badge_outlined)),
      title: Text(manager.fullName),
      subtitle: Text('${manager.email}  ·  ${manager.status}'),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
