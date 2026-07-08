import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../rooms/application/rooms_controller.dart';
import '../../rooms/data/models/room.dart';
import '../../../l10n/app_localizations.dart';

class HouseMetersScreen extends ConsumerWidget {
  const HouseMetersScreen({super.key, required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(roomsControllerProvider(houseId));

    return Scaffold(
      appBar: AppBar(title: Text(loc.metersTitle)),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : loc.failedToLoadMeters,
          onRetry: () => ref.invalidate(roomsControllerProvider(houseId)),
        ),
        data: (rooms) {
          final meteredRooms = rooms.where((r) => r.meterAttached).toList();
          if (meteredRooms.isEmpty) {
            return Center(child: Text(loc.noMeteredRooms));
          }
          return ListView.builder(
            itemCount: meteredRooms.length,
            itemBuilder: (context, i) =>
                _MeteredRoomTile(houseId: houseId, room: meteredRooms[i]),
          );
        },
      ),
    );
  }
}

class _MeteredRoomTile extends StatelessWidget {
  const _MeteredRoomTile({required this.houseId, required this.room});

  final String houseId;
  final Room room;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final statusColor = room.status == 'VACANT'
        ? Colors.green
        : Theme.of(context).colorScheme.error;

    final subtitleParts = <String>[
      if (room.meterNumber != null) loc.meterNumberLine(room.meterNumber!),
      room.status == 'VACANT' ? loc.roomStatusVacant : loc.roomStatusOccupied,
      if (room.currentRenter != null) room.currentRenter!.fullName,
    ];

    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.speed)),
      title: Text(loc.roomTileTitle(room.roomNumber)),
      subtitle: Text(subtitleParts.join('  ·  '),
          style: TextStyle(color: statusColor)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context
          .push('/houses/$houseId/rooms/${room.id}/meter-readings'),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
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
            FilledButton(onPressed: onRetry, child: Text(loc.retry)),
          ],
        ),
      ),
    );
  }
}
