import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../rooms/application/rooms_controller.dart';
import '../../rooms/data/models/room.dart';
import '../data/assignments_repository.dart';

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
        const SnackBar(content: Text('Transferred successfully')),
      );
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() => _errorMessage = e.code == 'NETWORK_ERROR'
          ? 'You must be online to save.'
          : e.message);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final roomsState = ref.watch(roomsControllerProvider(widget.houseId));
    // Vacant rooms, excluding the renter's current room.
    final eligibleRooms = roomsState.asData?.value
            .where((r) => r.status == 'VACANT' && r.id != widget.currentRoomId)
            .toList() ??
        [];

    return AlertDialog(
      title: const Text('Transfer to Room'),
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
                  const Text('No other vacant rooms available.'),
                if (eligibleRooms.isNotEmpty)
                  DropdownButtonFormField<Room>(
                    key: ValueKey(_selectedRoom?.id ?? ''),
                    initialValue: _selectedRoom,
                    decoration:
                        const InputDecoration(labelText: 'Transfer to Room *'),
                    items: eligibleRooms
                        .map((r) => DropdownMenuItem(
                              value: r,
                              child: Text('Room ${r.roomNumber}'),
                            ))
                        .toList(),
                    onChanged: (r) => setState(() => _selectedRoom = r),
                    validator: (v) => v == null ? 'Select a room' : null,
                  ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Transfer Date *',
                      suffixIcon: Icon(Icons.calendar_today, size: 18),
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
          child: const Text('Cancel'),
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
              : const Text('Transfer'),
        ),
      ],
    );
  }
}
