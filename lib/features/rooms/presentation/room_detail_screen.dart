import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(state.asData?.value?.roomNumber != null
            ? 'Room ${state.asData!.value!.roomNumber}'
            : 'Room'),
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
                    Text('Room not found',
                        style: TextStyle(fontSize: 18)),
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

class _RoomDetail extends StatelessWidget {
  const _RoomDetail({required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
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
          if (room.floor != null) _Field('Floor', '${room.floor}'),
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
                      Theme.of(context).textTheme.bodyMedium)),
        ],
      ),
    );
  }
}
