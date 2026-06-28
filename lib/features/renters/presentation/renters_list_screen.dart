import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/renters_controller.dart';
import '../data/models/renter.dart';

class RentersListScreen extends ConsumerWidget {
  const RentersListScreen({super.key, required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rentersControllerProvider(houseId));
    final canCreate = ref.watch(canProvider('renter.create'));

    return Scaffold(
      appBar: AppBar(title: const Text('Renters')),
      floatingActionButton: canCreate
          ? FloatingActionButton(
              onPressed: () => context.push('/houses/$houseId/renters/new'),
              child: const Icon(Icons.add),
            )
          : null,
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : 'Failed to load renters',
          onRetry: () => ref.invalidate(rentersControllerProvider(houseId)),
        ),
        data: (renters) => _RentersList(houseId: houseId, renters: renters),
      ),
    );
  }
}

class _RentersList extends ConsumerWidget {
  const _RentersList({required this.houseId, required this.renters});

  final String houseId;
  final List<Renter> renters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (renters.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => _refresh(context, ref),
        child: const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(child: Text('No renters yet')),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _refresh(context, ref),
      child: ListView.builder(
        itemCount: renters.length,
        itemBuilder: (context, i) =>
            _RenterTile(houseId: houseId, renter: renters[i]),
      ),
    );
  }

  Future<void> _refresh(BuildContext context, WidgetRef ref) {
    ref.invalidate(rentersControllerProvider(houseId));
    return Future.value();
  }
}

class _RenterTile extends StatelessWidget {
  const _RenterTile({required this.houseId, required this.renter});

  final String houseId;
  final Renter renter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(renter.fullName),
      subtitle: Text(renter.mobile),
      trailing: Chip(
        label: Text(renter.status,
            style: const TextStyle(fontSize: 11)),
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
      ),
      onTap: () => context.push('/houses/$houseId/renters/${renter.id}'),
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
