import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../rooms/application/rooms_controller.dart';
import '../../rooms/data/models/room.dart';
import '../data/assignments_repository.dart';
import '../../../l10n/app_localizations.dart';

Future<void> showAssignDialog(
  BuildContext context, {
  required String houseId,
  required String renterId,
}) {
  return showDialog(
    context: context,
    builder: (_) => _AssignDialog(houseId: houseId, renterId: renterId),
  );
}

class _AssignDialog extends ConsumerStatefulWidget {
  const _AssignDialog({required this.houseId, required this.renterId});

  final String houseId;
  final String renterId;

  @override
  ConsumerState<_AssignDialog> createState() => _AssignDialogState();
}

class _AssignDialogState extends ConsumerState<_AssignDialog> {
  final _formKey = GlobalKey<FormState>();
  Room? _selectedRoom;
  DateTime _date = DateTime.now();
  final _meterReadingCtrl = TextEditingController();
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _meterReadingCtrl.dispose();
    super.dispose();
  }

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

  Future<void> _submit(List<Room> vacantRooms) async {
    final loc = AppLocalizations.of(context)!;
    setState(() => _errorMessage = null);
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(assignmentsRepositoryProvider).assign(
            widget.houseId,
            widget.renterId,
            roomId: _selectedRoom!.id,
            moveInDate: _fmt(_date),
            moveInMeterReading: (_selectedRoom!.meterAttached &&
                    _meterReadingCtrl.text.trim().isNotEmpty)
                ? _meterReadingCtrl.text.trim()
                : null,
          );
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.assignedSuccess)),
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
    final vacantRooms = roomsState.asData?.value
            .where((r) => r.status == 'VACANT')
            .toList() ??
        [];

    return AlertDialog(
      title: Text(loc.assignDialogTitle),
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
                if (!roomsState.isLoading && vacantRooms.isEmpty)
                  Text(loc.noVacantRooms),
                if (vacantRooms.isNotEmpty)
                  DropdownButtonFormField<Room>(
                    key: ValueKey(_selectedRoom?.id ?? ''),
                    initialValue: _selectedRoom,
                    decoration: InputDecoration(
                        labelText: '${loc.vacantRoomLabel} *'),
                    items: vacantRooms
                        .map((r) => DropdownMenuItem(
                              value: r,
                              child: Text(loc.roomTileTitle(r.roomNumber)),
                            ))
                        .toList(),
                    onChanged: (r) => setState(() {
                      _selectedRoom = r;
                      _meterReadingCtrl.clear();
                    }),
                    validator: (v) => v == null ? loc.selectARoom : null,
                  ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: '${loc.moveInDateLabel} *',
                      suffixIcon: const Icon(Icons.calendar_today, size: 18),
                    ),
                    child: Text(_fmt(_date)),
                  ),
                ),
                if (_selectedRoom?.meterAttached == true) ...[
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _meterReadingCtrl,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    decoration: InputDecoration(
                      labelText: loc.openingMeterReadingLabel,
                      hintText: loc.openingMeterReadingHint,
                    ),
                  ),
                ],
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
          onPressed: (_isSubmitting || vacantRooms.isEmpty)
              ? null
              : () => _submit(vacantRooms),
          child: _isSubmitting
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(loc.assign),
        ),
      ],
    );
  }
}
