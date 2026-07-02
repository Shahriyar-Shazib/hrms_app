import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/houses_controller.dart';
import '../data/houses_repository.dart';
import '../data/models/house.dart';

class HouseDetailScreen extends ConsumerStatefulWidget {
  const HouseDetailScreen({super.key, required this.houseId});

  final String houseId;

  @override
  ConsumerState<HouseDetailScreen> createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends ConsumerState<HouseDetailScreen> {
  bool _isDeleting = false;

  Future<void> _confirmDelete(House house) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete this house?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(ctx).colorScheme.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _isDeleting = true);
    try {
      await ref.read(housesRepositoryProvider).deleteHouse(house.id);
      if (!mounted) return;
      context.pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('House deleted')));
    } on ApiException catch (e) {
      if (!mounted) return;
      final msg = e.code == 'NETWORK_ERROR'
          ? 'You must be online to delete.'
          : e.message;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      if (mounted) setState(() => _isDeleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(houseDetailProvider(widget.houseId));
    final house = state.asData?.value;
    final canEdit = ref.watch(canProvider('house.update'));
    final canDelete = ref.watch(canProvider('house.delete'));

    return Scaffold(
      appBar: AppBar(
        title: Text(house?.name ?? 'House'),
        actions: [
          if (house != null && canEdit)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit',
              onPressed: () => context.push(
                '/houses/${house.id}/edit',
                extra: house,
              ),
            ),
          if (house != null && canDelete)
            _isDeleting
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : IconButton(
                    icon: Icon(Icons.delete_outline,
                        color: Theme.of(context).colorScheme.error),
                    tooltip: 'Delete',
                    onPressed: () => _confirmDelete(house),
                  ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(e is ApiException ? e.message : 'Failed to load house'),
        ),
        data: (house) {
          if (house == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cloud_off, size: 48),
                    SizedBox(height: 12),
                    Text('House not found', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text(
                      'Connect to the internet to load this house.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return _HouseDetail(house: house);
        },
      ),
    );
  }
}

class _HouseDetail extends ConsumerWidget {
  const _HouseDetail({required this.house});

  final House house;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canManageBillConfig = ref.watch(canProvider('billConfig.manage'));
    final canManageMeters = ref.watch(canProvider('meterReading.manage'));
    final canManageManagers = ref.watch(canProvider('manager.manage'));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(children: [
          _Field('Name', house.name),
          if (house.address != null) _Field('Address', house.address!),
          if (house.city != null) _Field('City', house.city!),
          if (house.totalFloors != null)
            _Field('Total Floors', '${house.totalFloors}'),
          if (house.notes != null) _Field('Notes', house.notes!),
        ]),
        const SizedBox(height: 12),
        _InfoCard(children: [
          _Field('Created', house.createdAt),
          _Field('Updated', house.updatedAt),
        ]),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.door_front_door),
                label: const Text('Rooms'),
                onPressed: () => context.push('/houses/${house.id}/rooms'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.people),
                label: const Text('Renters'),
                onPressed: () => context.push('/houses/${house.id}/renters'),
              ),
            ),
          ],
        ),
        if (canManageMeters) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.speed),
            label: const Text('Meters'),
            onPressed: () => context.push('/houses/${house.id}/meters'),
          ),
        ],
        if (canManageBillConfig) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.receipt_long),
            label: const Text('Bill Configuration'),
            onPressed: () =>
                context.push('/houses/${house.id}/bill-configs'),
          ),
        ],
        if (canManageManagers) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.badge_outlined),
            label: const Text('Managers'),
            onPressed: () => context.push('/houses/${house.id}/managers'),
          ),
        ],
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: children),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.outline),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
