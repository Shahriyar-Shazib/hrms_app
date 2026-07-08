import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/rooms_controller.dart';
import '../data/models/room.dart';
import '../../../l10n/app_localizations.dart';

String _roomStatusLabel(AppLocalizations loc, String status) =>
    status == 'VACANT'
        ? loc.roomStatusVacant
        : status == 'OCCUPIED'
            ? loc.roomStatusOccupied
            : status;

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
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(roomDetailProvider((houseId, roomId)));
    final canEdit = ref.watch(canProvider('room.update'));
    final room = state.asData?.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(room != null
            ? loc.roomTileTitle(room.roomNumber)
            : loc.roomAppBarFallback),
        actions: [
          if (canEdit && room != null)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: loc.editRoomTooltip,
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
              e is ApiException ? e.message : loc.failedToLoadRoom),
        ),
        data: (room) {
          if (room == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cloud_off, size: 48),
                    const SizedBox(height: 12),
                    Text(loc.roomNotFound, style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    Text(
                      loc.connectToLoadRoom,
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
    final loc = AppLocalizations.of(context)!;
    final canCollect = ref.watch(canProvider('payment.collect'));
    final canMeterReading = ref.watch(canProvider('meterReading.manage'));
    final statusColor = room.status == 'VACANT'
        ? Colors.green
        : Theme.of(context).colorScheme.error;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(children: [
          _Field(loc.roomFieldRoomNumber, room.roomNumber),
          _Field(loc.roomFieldStatus, _roomStatusLabel(loc, room.status),
              valueStyle: TextStyle(
                  color: statusColor, fontWeight: FontWeight.w600)),
          _Field(loc.roomFieldBaseRent, '৳${room.baseRent}'),
          if (room.floor != null) _Field(loc.roomFieldFloor, room.floor!),
          _Field(loc.roomFieldMeter,
              room.meterAttached ? loc.meterAttachedYes : loc.meterAttachedNo),
          if (room.meterNumber != null)
            _Field(loc.roomFieldMeterNumber, room.meterNumber!),
          if (room.notes != null) _Field(loc.notesLabel, room.notes!),
        ]),
        const SizedBox(height: 12),
        _InfoCard(children: [
          _Field(loc.createdLabel, room.createdAt),
          _Field(loc.updatedLabel, room.updatedAt),
        ]),
        const SizedBox(height: 12),
        // Current renter card
        if (room.currentRenter != null) ...[
          _InfoCard(children: [
            _SectionHeader(loc.currentRenterSectionTitle),
            _Field(loc.roomFieldName, room.currentRenter!.fullName),
            _Field(loc.roomFieldMobile, room.currentRenter!.mobile),
            _Field(loc.roomFieldSince, room.currentRenter!.moveInDate),
          ]),
          const SizedBox(height: 16),
          if (canCollect)
            FilledButton.icon(
              icon: const Icon(Icons.payments),
              label: Text(loc.collectPaymentButton),
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
                    loc.vacantNoRenter,
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
            label: Text(loc.collectPaymentButton),
            onPressed: null, // disabled for vacant rooms
          ),
        ],
        if (room.meterAttached && canMeterReading) ...[
          const SizedBox(height: 16),
          OutlinedButton.icon(
            icon: const Icon(Icons.electric_meter),
            label: Text(loc.meterReadingsButton),
            onPressed: () => context.push(
              '/houses/${room.houseId}/rooms/${room.id}/meter-readings',
            ),
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
