import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/rooms_controller.dart';
import '../data/models/room.dart';
class RoomDetailScreen extends ConsumerWidget {
  const RoomDetailScreen({
    super.key,
    required this.houseId,
    required this.roomId,
  });

  final String houseId;
  final String roomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(roomDetailProvider((houseId, roomId)));
    final canEdit = ref.watch(canProvider('room.update'));
    final room = state.asData?.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(room != null ? 'Room ${room.roomNumber}' : 'Room'),
        actions: [
          if (canEdit && room != null)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit room',
              onPressed: () => context.push(
                '/houses/$houseId/rooms/$roomId/edit',
                extra: room,
              ),
            ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
              e is ApiException ? e.message : 'Failed to load room'),
        ),
        data: (room) {
          if (room == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cloud_off, size: 48),
                    SizedBox(height: 12),
                    Text('Room not found', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text(
                      'Connect to the internet to load this room.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return _RoomDetail(room: room);
        },
      ),
    );
  }
}

class _RoomDetail extends ConsumerWidget {
  const _RoomDetail({required this.room});

  final Room room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCollect = ref.watch(canProvider('payment.collect'));
    final statusColor = room.status == 'VACANT'
        ? Colors.green
        : Theme.of(context).colorScheme.error;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(children: [
          _Field('Room Number', room.roomNumber),
          _Field('Status', room.status,
              valueStyle: TextStyle(
                  color: statusColor, fontWeight: FontWeight.w600)),
          _Field('Base Rent', '৳${room.baseRent}'),
          if (room.floor != null) _Field('Floor', room.floor!),
          _Field('Meter', room.meterAttached ? 'Attached' : 'Not attached'),
          if (room.meterNumber != null)
            _Field('Meter Number', room.meterNumber!),
          if (room.notes != null) _Field('Notes', room.notes!),
        ]),
        const SizedBox(height: 12),
        _InfoCard(children: [
          _Field('Created', room.createdAt),
          _Field('Updated', room.updatedAt),
        ]),
        const SizedBox(height: 12),
        // Current renter card
        if (room.currentRenter != null) ...[
          _InfoCard(children: [
            const _SectionHeader('Current Renter'),
            _Field('Name', room.currentRenter!.fullName),
            _Field('Mobile', room.currentRenter!.mobile),
            _Field('Since', room.currentRenter!.moveInDate),
          ]),
          const SizedBox(height: 16),
          if (canCollect)
            FilledButton.icon(
              icon: const Icon(Icons.payments),
              label: const Text('Collect Payment'),
              onPressed: () => context.push(
                '/houses/${room.houseId}/renters/${room.currentRenter!.id}/collect',
              ),
            ),
        ] else ...[
          Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Icon(Icons.door_front_door,
                      color: Theme.of(context).colorScheme.outline),
                  const SizedBox(width: 12),
                  Text(
                    'Vacant — no current renter',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.payments),
            label: const Text('Collect Payment'),
            onPressed: null, // disabled for vacant rooms
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

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field(this.label, this.value, {this.valueStyle});

  final String label;
  final String value;
  final TextStyle? valueStyle;

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
          Expanded(
            child: Text(value,
                style: valueStyle ??
                    Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
