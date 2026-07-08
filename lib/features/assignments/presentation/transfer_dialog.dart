import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../rooms/application/rooms_controller.dart';
import '../../rooms/data/models/room.dart';
import '../data/assignments_repository.dart';
import '../../../l10n/app_localizations.dart';

Future<void> showTransferDialog(
  BuildContext context, {
  required String houseId,
  required String renterId,
  required String currentRoomId,
}) {
  return showDialog(
    context: context,
    builder: (_) => _TransferDialog(
      houseId: houseId,
      renterId: renterId,
      currentRoomId: currentRoomId,
    ),
  );
}

class _TransferDialog extends ConsumerStatefulWidget {
  const _TransferDialog({
    required this.houseId,
    required this.renterId,
    required this.currentRoomId,
  });

  final String houseId;
  final String renterId;
  final String currentRoomId;

  @override
  ConsumerState<_TransferDialog> createState() => _TransferDialogState();
}

class _TransferDialogState extends ConsumerState<_TransferDialog> {
  final _formKey = GlobalKey<FormState>();
  Room? _selectedRoom;
  DateTime _date = DateTime.now();
  bool _isSubmitting = false;
  String? _errorMessage;

  String _fmt(DateTime dt) => dt.toIso8601String().substring(0, 10);

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _submit() async {
    final loc = AppLocalizations.of(context)!;
    setState(() => _errorMessage = null);
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(assignmentsRepositoryProvider).transfer(
            widget.houseId,
            widget.renterId,
            roomId: _selectedRoom!.id,
            transferDate: _fmt(_date),
          );
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.transferredSuccess)),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _errorMessage = e.code == 'NETWORK_ERROR'
          ? loc.mustBeOnlineToSave
          : e.message);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final roomsState = ref.watch(roomsControllerProvider(widget.houseId));
    // Vacant rooms, excluding the renter's current room.
    final eligibleRooms = roomsState.asData?.value
            .where((r) => r.status == 'VACANT' && r.id != widget.currentRoomId)
            .toList() ??
        [];

    return AlertDialog(
      title: Text(loc.transferDialogTitle),
      content: SizedBox(
        width: double.maxFinite,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (roomsState.isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (!roomsState.isLoading && eligibleRooms.isEmpty)
                  Text(loc.noOtherVacantRooms),
                if (eligibleRooms.isNotEmpty)
                  DropdownButtonFormField<Room>(
                    key: ValueKey(_selectedRoom?.id ?? ''),
                    initialValue: _selectedRoom,
                    decoration: InputDecoration(
                        labelText: '${loc.transferToRoomLabel} *'),
                    items: eligibleRooms
                        .map((r) => DropdownMenuItem(
                              value: r,
                              child: Text(loc.roomTileTitle(r.roomNumber)),
                            ))
                        .toList(),
                    onChanged: (r) => setState(() => _selectedRoom = r),
                    validator: (v) => v == null ? loc.selectARoom : null,
                  ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: '${loc.transferDateLabel} *',
                      suffixIcon: const Icon(Icons.calendar_today, size: 18),
                    ),
                    child: Text(_fmt(_date)),
                  ),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.error),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(),
          child: Text(loc.cancel),
        ),
        FilledButton(
          onPressed: (_isSubmitting || eligibleRooms.isEmpty)
              ? null
              : _submit,
          child: _isSubmitting
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(loc.transfer),
        ),
      ],
    );
  }
}
