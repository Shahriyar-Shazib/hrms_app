import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../../l10n/app_localizations.dart';
import '../data/dues_repository.dart';

/// Shows a confirm dialog with a required reason field, then calls
/// [DuesRepository.waiveDue]. Returns true if the waive succeeded — the
/// caller is responsible for invalidating providers and showing a SnackBar.
Future<bool> showWaiveDueDialog(
  BuildContext context, {
  required String houseId,
  required String dueId,
  required String headLabel,
  required String outstanding,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (_) => _WaiveDueDialog(
      houseId: houseId,
      dueId: dueId,
      headLabel: headLabel,
      outstanding: outstanding,
    ),
  );
  return result ?? false;
}

class _WaiveDueDialog extends ConsumerStatefulWidget {
  const _WaiveDueDialog({
    required this.houseId,
    required this.dueId,
    required this.headLabel,
    required this.outstanding,
  });

  final String houseId;
  final String dueId;
  final String headLabel;
  final String outstanding;

  @override
  ConsumerState<_WaiveDueDialog> createState() => _WaiveDueDialogState();
}

class _WaiveDueDialogState extends ConsumerState<_WaiveDueDialog> {
  final _formKey = GlobalKey<FormState>();
  final _reasonCtrl = TextEditingController();
  bool _isSubmitting = false;
  String? _error;

  @override
  void dispose() {
    _reasonCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _isSubmitting = true;
      _error = null;
    });
    try {
      await ref.read(duesRepositoryProvider).waiveDue(
            widget.houseId,
            widget.dueId,
            waiveReason: _reasonCtrl.text.trim(),
          );
      if (!mounted) return;
      Navigator.pop(context, true);
    } on ApiException catch (e) {
      setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(loc.waiveDueDialogTitle),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.waiveDueDialogBody(widget.headLabel, widget.outstanding)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reasonCtrl,
              autofocus: true,
              maxLines: 2,
              decoration: InputDecoration(labelText: '${loc.reasonLabel} *'),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? loc.reasonRequired
                  : null,
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed:
              _isSubmitting ? null : () => Navigator.pop(context, false),
          child: Text(loc.cancel),
        ),
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error),
          child: _isSubmitting
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(loc.waive),
        ),
      ],
    );
  }
}
