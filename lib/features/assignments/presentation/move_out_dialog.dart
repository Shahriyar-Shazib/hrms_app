import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../data/assignments_repository.dart';

// TRANSFER is set automatically by the server on transfer(); do NOT offer it here.
const _reasons = [
  ('MOVED_OUT', 'Moved Out'),
  ('EVICTED', 'Evicted'),
];

Future<void> showMoveOutDialog(
  BuildContext context, {
  required String houseId,
  required String renterId,
}) {
  return showDialog(
    context: context,
    builder: (_) => _MoveOutDialog(houseId: houseId, renterId: renterId),
  );
}

class _MoveOutDialog extends ConsumerStatefulWidget {
  const _MoveOutDialog({required this.houseId, required this.renterId});

  final String houseId;
  final String renterId;

  @override
  ConsumerState<_MoveOutDialog> createState() => _MoveOutDialogState();
}

class _MoveOutDialogState extends ConsumerState<_MoveOutDialog> {
  final _formKey = GlobalKey<FormState>();
  DateTime _date = DateTime.now();
  String? _reason;
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
      await ref.read(assignmentsRepositoryProvider).moveOut(
            widget.houseId,
            widget.renterId,
            moveOutDate: _fmt(_date),
            reason: _reason!,
          );
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Moved out successfully')),
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
    return AlertDialog(
      title: const Text('Move Out'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: _pickDate,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Move-out Date *',
                    suffixIcon: Icon(Icons.calendar_today, size: 18),
                  ),
                  child: Text(_fmt(_date)),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                key: ValueKey(_reason ?? ''),
                initialValue: _reason,
                decoration: const InputDecoration(labelText: 'Reason *'),
                items: _reasons
                    .map((r) => DropdownMenuItem(
                          value: r.$1,
                          child: Text(r.$2),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _reason = v),
                validator: (v) => v == null ? 'Select a reason' : null,
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
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
          child: _isSubmitting
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Move Out'),
        ),
      ],
    );
  }
}
