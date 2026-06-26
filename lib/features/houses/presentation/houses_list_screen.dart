import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/houses_controller.dart';
import '../data/models/house.dart';

class HousesListScreen extends ConsumerWidget {
  const HousesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(housesControllerProvider);
    final canCreate = ref.watch(canProvider('house.create'));

    return Scaffold(
      appBar: AppBar(title: const Text('Houses')),
      floatingActionButton: canCreate
          ? FloatingActionButton(
              tooltip: 'New House',
              onPressed: () => context.push('/houses/new'),
              child: const Icon(Icons.add),
            )
          : null,
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : 'Failed to load houses',
          onRetry: () => ref.invalidate(housesControllerProvider),
        ),
        data: (houses) => _HousesList(houses: houses),
      ),
    );
  }
}

// ─── List body ───────────────────────────────────────────────────────────────

class _HousesList extends ConsumerWidget {
  const _HousesList({required this.houses});

  final List<House> houses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (houses.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => _refresh(context, ref),
        child: const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(child: Text('No houses yet')),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _refresh(context, ref),
      child: ListView.builder(
        itemCount: houses.length,
        itemBuilder: (context, i) => _HouseTile(house: houses[i]),
      ),
    );
  }

  Future<void> _refresh(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(housesControllerProvider.notifier).refresh();
    } catch (e) {
      if (!context.mounted) return;
      final msg = e is ApiException ? e.message : 'Refresh failed';
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(msg)));
    }
  }
}

// ─── Tile ─────────────────────────────────────────────────────────────────────

class _HouseTile extends StatelessWidget {
  const _HouseTile({required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    final subtitle = [house.city, house.address]
        .whereType<String>()
        .join(', ');

    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.home)),
      title: Text(house.name),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push('/houses/${house.id}'),
    );
  }
}

// ─── Error view ───────────────────────────────────────────────────────────────

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
