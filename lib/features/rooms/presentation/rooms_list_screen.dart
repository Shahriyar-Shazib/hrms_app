import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../application/rooms_controller.dart';
import '../data/models/room.dart';

class RoomsListScreen extends ConsumerWidget {
  const RoomsListScreen({super.key, required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(roomsControllerProvider(houseId));

    return Scaffold(
      appBar: AppBar(title: const Text('Rooms')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : 'Failed to load rooms',
          onRetry: () => ref.invalidate(roomsControllerProvider(houseId)),
        ),
        data: (rooms) => _RoomsList(houseId: houseId, rooms: rooms),
      ),
    );
  }
}

class _RoomsList extends ConsumerWidget {
  const _RoomsList({required this.houseId, required this.rooms});

  final String houseId;
  final List<Room> rooms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (rooms.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => _refresh(context, ref),
        child: const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(child: Text('No rooms yet')),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _refresh(context, ref),
      child: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, i) =>
            _RoomTile(houseId: houseId, room: rooms[i]),
      ),
    );
  }

  Future<void> _refresh(BuildContext context, WidgetRef ref) {
    ref.invalidate(roomsControllerProvider(houseId));
    return Future.value();
  }
}

class _RoomTile extends StatelessWidget {
  const _RoomTile({required this.houseId, required this.room});

  final String houseId;
  final Room room;

  @override
  Widget build(BuildContext context) {
    final statusColor = room.status == 'VACANT'
        ? Colors.green
        : Theme.of(context).colorScheme.error;

    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.door_front_door)),
      title: Text('Room ${room.roomNumber}'),
      subtitle: Text('৳${room.baseRent}  ·  ${room.status}',
          style: TextStyle(color: statusColor)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push('/houses/$houseId/rooms/${room.id}'),
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
