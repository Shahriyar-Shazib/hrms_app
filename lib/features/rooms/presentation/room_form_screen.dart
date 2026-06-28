import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../data/rooms_repository.dart';
import '../data/models/room.dart';

class RoomFormScreen extends ConsumerStatefulWidget {
  const RoomFormScreen({super.key, required this.houseId, this.existing});

  final String houseId;

  /// Null → create mode. Non-null → edit mode (prefilled).
  final Room? existing;

  @override
  ConsumerState<RoomFormScreen> createState() => _RoomFormScreenState();
}

class _RoomFormScreenState extends ConsumerState<RoomFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _roomNumberCtrl;
  late final TextEditingController _baseRentCtrl;
  late final TextEditingController _floorCtrl;
  late final TextEditingController _meterNumberCtrl;
  late final TextEditingController _notesCtrl;

  late bool _meterAttached;
  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};

  bool get _isEditMode => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final r = widget.existing;
    _roomNumberCtrl = TextEditingController(text: r?.roomNumber ?? '');
    _baseRentCtrl = TextEditingController(text: r?.baseRent ?? '');
    _floorCtrl = TextEditingController(text: r?.floor ?? '');
    _meterNumberCtrl = TextEditingController(text: r?.meterNumber ?? '');
    _notesCtrl = TextEditingController(text: r?.notes ?? '');
    _meterAttached = r?.meterAttached ?? false;
  }

  @override
  void dispose() {
    _roomNumberCtrl.dispose();
    _baseRentCtrl.dispose();
    _floorCtrl.dispose();
    _meterNumberCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  String? _trim(TextEditingController c) {
    final v = c.text.trim();
    return v.isEmpty ? null : v;
  }

  void _clearFieldError(String key) {
    if (_fieldErrors.containsKey(key)) {
      setState(() => _fieldErrors.remove(key));
    }
  }

  Future<void> _submit() async {
    setState(() => _fieldErrors = {});

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final roomNumber = _roomNumberCtrl.text.trim();
    final baseRent = _baseRentCtrl.text.trim();
    final floor = _trim(_floorCtrl);
    final meterNumber = _meterAttached ? _trim(_meterNumberCtrl) : null;
    final notes = _trim(_notesCtrl);

    setState(() => _isSubmitting = true);

    try {
      final repo = ref.read(roomsRepositoryProvider);
      if (_isEditMode) {
        await repo.updateRoom(
          widget.houseId,
          widget.existing!.id,
          roomNumber: roomNumber,
          baseRent: baseRent,
          meterAttached: _meterAttached,
          floor: floor,
          meterNumber: meterNumber,
          notes: notes,
        );
      } else {
        await repo.createRoom(
          widget.houseId,
          roomNumber: roomNumber,
          baseRent: baseRent,
          meterAttached: _meterAttached,
          floor: floor,
          meterNumber: meterNumber,
          notes: notes,
        );
      }

      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Saved')));
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.code == 'VALIDATION_FAILED' && e.details is Map) {
        final raw = e.details as Map<String, dynamic>;
        final errors = <String, String>{};
        for (final entry in raw.entries) {
          final msgs = entry.value;
          if (msgs is List && msgs.isNotEmpty) {
            errors[entry.key] = msgs.first.toString();
          }
        }
        setState(() => _fieldErrors = errors);
        _formKey.currentState!.validate();
      } else if (e.code == 'NETWORK_ERROR') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You must be online to save.')),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit Room' : 'New Room'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _roomNumberCtrl,
              decoration: const InputDecoration(
                labelText: 'Room Number *',
                hintText: 'e.g. 101',
              ),
              validator: (v) {
                if (_fieldErrors.containsKey('room_number')) {
                  return _fieldErrors['room_number'];
                }
                if (v == null || v.trim().isEmpty) return 'Room number is required';
                return null;
              },
              onChanged: (_) => _clearFieldError('room_number'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _baseRentCtrl,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: const InputDecoration(
                labelText: 'Base Rent *',
                hintText: 'e.g. 7500',
                prefixText: '৳ ',
              ),
              validator: (v) {
                if (_fieldErrors.containsKey('base_rent')) {
                  return _fieldErrors['base_rent'];
                }
                if (v == null || v.trim().isEmpty) return 'Base rent is required';
                final n = double.tryParse(v.trim());
                if (n == null || n <= 0) return 'Must be a positive number';
                return null;
              },
              onChanged: (_) => _clearFieldError('base_rent'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _floorCtrl,
              decoration: const InputDecoration(
                labelText: 'Floor',
                hintText: 'e.g. 2 or Ground',
              ),
              validator: (_) =>
                  _fieldErrors.containsKey('floor') ? _fieldErrors['floor'] : null,
              onChanged: (_) => _clearFieldError('floor'),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Meter Attached'),
              subtitle: Text(
                _meterAttached ? 'Electricity meter present' : 'No meter',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              value: _meterAttached,
              onChanged: (v) {
                setState(() {
                  _meterAttached = v;
                  if (!v) _meterNumberCtrl.clear();
                });
                _clearFieldError('meter_attached');
              },
            ),
            if (_fieldErrors.containsKey('meter_attached'))
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 4),
                child: Text(
                  _fieldErrors['meter_attached']!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
            if (_meterAttached) ...[
              const SizedBox(height: 8),
              TextFormField(
                controller: _meterNumberCtrl,
                decoration: const InputDecoration(
                  labelText: 'Meter Number',
                  hintText: 'e.g. MTR-001',
                ),
                validator: (_) => _fieldErrors.containsKey('meter_number')
                    ? _fieldErrors['meter_number']
                    : null,
                onChanged: (_) => _clearFieldError('meter_number'),
              ),
            ],
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesCtrl,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Notes',
                alignLabelWithHint: true,
              ),
              validator: (_) =>
                  _fieldErrors.containsKey('notes') ? _fieldErrors['notes'] : null,
              onChanged: (_) => _clearFieldError('notes'),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isSubmitting ? null : _submit,
              child: _isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
