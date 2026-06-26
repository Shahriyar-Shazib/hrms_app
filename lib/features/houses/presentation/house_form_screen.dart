import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../data/houses_repository.dart';
import '../data/models/house.dart';

class HouseFormScreen extends ConsumerStatefulWidget {
  const HouseFormScreen({super.key, this.existing});

  /// Null → create mode. Non-null → edit mode (prefilled).
  final House? existing;

  @override
  ConsumerState<HouseFormScreen> createState() => _HouseFormScreenState();
}

class _HouseFormScreenState extends ConsumerState<HouseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _addressCtrl;
  late final TextEditingController _cityCtrl;
  late final TextEditingController _floorsCtrl;
  late final TextEditingController _notesCtrl;

  bool _isSubmitting = false;
  Map<String, String> _fieldErrors = {};

  bool get _isEditMode => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final h = widget.existing;
    _nameCtrl = TextEditingController(text: h?.name ?? '');
    _addressCtrl = TextEditingController(text: h?.address ?? '');
    _cityCtrl = TextEditingController(text: h?.city ?? '');
    _floorsCtrl = TextEditingController(
      text: h?.totalFloors != null ? '${h!.totalFloors}' : '',
    );
    _notesCtrl = TextEditingController(text: h?.notes ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    _cityCtrl.dispose();
    _floorsCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  String? _trim(TextEditingController c) {
    final v = c.text.trim();
    return v.isEmpty ? null : v;
  }

  Future<void> _submit() async {
    // Clear server errors before a new attempt.
    setState(() => _fieldErrors = {});

    if (!(_formKey.currentState?.validate() ?? false)) return;

    final name = _nameCtrl.text.trim();
    final address = _trim(_addressCtrl);
    final city = _trim(_cityCtrl);
    final floors = _floorsCtrl.text.trim();
    final totalFloors = floors.isEmpty ? null : int.tryParse(floors);
    final notes = _trim(_notesCtrl);

    setState(() => _isSubmitting = true);

    try {
      final repo = ref.read(housesRepositoryProvider);
      if (_isEditMode) {
        await repo.updateHouse(
          widget.existing!.id,
          name: name,
          address: address,
          city: city,
          totalFloors: totalFloors,
          notes: notes,
        );
      } else {
        await repo.createHouse(
          name: name,
          address: address,
          city: city,
          totalFloors: totalFloors,
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

  void _clearFieldError(String key) {
    if (_fieldErrors.containsKey(key)) {
      setState(() => _fieldErrors.remove(key));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditMode ? 'Edit House' : 'New House'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Name *',
                hintText: 'e.g. Sunrise Apartments',
              ),
              validator: (v) {
                if (_fieldErrors.containsKey('name')) {
                  return _fieldErrors['name'];
                }
                if (v == null || v.trim().isEmpty) return 'Name is required';
                return null;
              },
              onChanged: (_) => _clearFieldError('name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _addressCtrl,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Address *',
                hintText: 'Street address',
              ),
              validator: (v) {
                if (_fieldErrors.containsKey('address')) return _fieldErrors['address'];
                if (v == null || v.trim().isEmpty) return 'Address is required';
                return null;
              },
              onChanged: (_) => _clearFieldError('address'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _cityCtrl,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'City',
              ),
              validator: (_) =>
                  _fieldErrors.containsKey('city') ? _fieldErrors['city'] : null,
              onChanged: (_) => _clearFieldError('city'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _floorsCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Total Floors',
                hintText: 'e.g. 4',
              ),
              validator: (v) {
                if (_fieldErrors.containsKey('total_floors')) {
                  return _fieldErrors['total_floors'];
                }
                if (v != null && v.trim().isNotEmpty) {
                  final n = int.tryParse(v.trim());
                  if (n == null || n < 1) return 'Must be a positive number';
                }
                return null;
              },
              onChanged: (_) => _clearFieldError('total_floors'),
            ),
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
