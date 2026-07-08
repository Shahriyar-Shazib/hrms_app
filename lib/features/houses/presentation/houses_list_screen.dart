import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../core/auth/user_model.dart';
import '../application/houses_controller.dart';
import '../data/models/house.dart';
import '../../../l10n/app_localizations.dart';

class HousesListScreen extends ConsumerWidget {
  const HousesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(housesControllerProvider);
    final canCreate = ref.watch(canProvider('house.create'));
    final isSuperAdmin = ref.watch(currentRoleProvider) == UserRole.superAdmin;

    return Scaffold(
      appBar: AppBar(title: Text(loc.housesTitle)),
      floatingActionButton: canCreate
          ? FloatingActionButton(
              tooltip: loc.newHouseTooltip,
              onPressed: () => context.push('/houses/new'),
              child: const Icon(Icons.add),
            )
          : null,
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : loc.failedToLoadHouses,
          onRetry: () => ref.invalidate(housesControllerProvider),
        ),
        data: (houses) =>
            _HousesList(houses: houses, showOwner: isSuperAdmin),
      ),
    );
  }
}

// ─── List body ───────────────────────────────────────────────────────────────

class _HousesList extends ConsumerWidget {
  const _HousesList({required this.houses, required this.showOwner});

  final List<House> houses;
  final bool showOwner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (houses.isEmpty) {
      final loc = AppLocalizations.of(context)!;
      return RefreshIndicator(
        onRefresh: () => _refresh(context, ref),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(child: Text(loc.noHousesYet)),
            ),
          ],
        ),
      );
    }

    // SA sees a cross-owner list — cluster same-owner houses together for
    // readability (real owner names arrive in Phase 2).
    final ordered = showOwner
        ? (List<House>.from(houses)
          ..sort((a, b) => a.ownerId.compareTo(b.ownerId)))
        : houses;

    return RefreshIndicator(
      onRefresh: () => _refresh(context, ref),
      child: ListView.builder(
        itemCount: ordered.length,
        itemBuilder: (context, i) =>
            _HouseTile(house: ordered[i], showOwner: showOwner),
      ),
    );
  }

  Future<void> _refresh(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(housesControllerProvider.notifier).refresh();
    } catch (e) {
      if (!context.mounted) return;
      final msg = e is ApiException
          ? e.message
          : AppLocalizations.of(context)!.refreshFailed;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(msg)));
    }
  }
}

// ─── Tile ─────────────────────────────────────────────────────────────────────

class _HouseTile extends StatelessWidget {
  const _HouseTile({required this.house, required this.showOwner});

  final House house;
  final bool showOwner;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final subtitle = [house.city, house.address]
        .whereType<String>()
        .join(', ');
    final shortOwnerId = house.ownerId.length > 8
        ? house.ownerId.substring(0, 8)
        : house.ownerId;

    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.home)),
      title: Text(house.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subtitle.isNotEmpty) Text(subtitle),
          if (showOwner)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Chip(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(
                  loc.ownerChipLabel(shortOwnerId),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
        ],
      ),
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
            FilledButton(
              onPressed: onRetry,
              child: Text(AppLocalizations.of(context)!.retry),
            ),
          ],
        ),
      ),
    );
  }
}
