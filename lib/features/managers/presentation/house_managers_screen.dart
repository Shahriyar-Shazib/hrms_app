import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../l10n/app_localizations.dart';
import '../application/managers_controller.dart';
import '../data/managers_repository.dart';
import '../data/models/manager.dart';

class HouseManagersScreen extends ConsumerWidget {
  const HouseManagersScreen({super.key, required this.houseId});

  final String houseId;

  Future<void> _openAssignPicker(BuildContext context, WidgetRef ref) async {
    final managers = await ref.read(managersProvider.future);
    final assigned = await ref.read(houseManagersProvider(houseId).future);
    if (!context.mounted) return;

    final assignedIds = assigned.map((a) => a.managerUserId).toSet();
    final available =
        managers.where((m) => !assignedIds.contains(m.id)).toList();

    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      builder: (_) => _AssignManagerDialog(
        houseId: houseId,
        available: available,
        hasAnyManagers: managers.isNotEmpty,
      ),
    );
  }

  Future<void> _confirmRemove(
    BuildContext context,
    WidgetRef ref,
    HouseManagerAssignment assignment,
  ) async {
    final loc = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.removeManagerDialogTitle),
        content: Text(loc.removeManagerDialogBody(
            assignment.manager?.fullName ?? loc.managerFallbackName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(ctx).colorScheme.error),
            child: Text(loc.remove),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await ref
          .read(managersRepositoryProvider)
          .removeManager(houseId, assignment.managerUserId);
      ref.invalidate(houseManagersProvider(houseId));
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(loc.managerRemoved)));
    } on ApiException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future<void> _toggleExpenses(
    BuildContext context,
    WidgetRef ref,
    HouseManagerAssignment assignment,
    bool value,
  ) async {
    try {
      await ref.read(managersRepositoryProvider).updateAssignment(
            houseId,
            assignment.managerUserId,
            canLogExpenses: value,
          );
      ref.invalidate(houseManagersProvider(houseId));
    } on ApiException catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(houseManagersProvider(houseId));

    return Scaffold(
      appBar: AppBar(title: Text(loc.managersTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAssignPicker(context, ref),
        icon: const Icon(Icons.person_add_alt),
        label: Text(loc.assignManagerTooltip),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : loc.failedToLoadManagers,
          onRetry: () => ref.invalidate(houseManagersProvider(houseId)),
        ),
        data: (assignments) => assignments.isEmpty
            ? Center(child: Text(loc.noManagersAssigned))
            : ListView.separated(
                itemCount: assignments.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, i) {
                  final a = assignments[i];
                  return ListTile(
                    leading: const CircleAvatar(
                        child: Icon(Icons.badge_outlined)),
                    title: Text(a.manager?.fullName ?? loc.managerFallbackName),
                    subtitle: Text(a.manager?.email ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(loc.expensesSwitchLabel,
                                style: const TextStyle(fontSize: 10)),
                            SizedBox(
                              height: 32,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Switch(
                                  value: a.canLogExpenses,
                                  onChanged: (v) =>
                                      _toggleExpenses(context, ref, a, v),
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline,
                              color: Theme.of(context).colorScheme.error),
                          tooltip: loc.removeManagerTooltip,
                          onPressed: () => _confirmRemove(context, ref, a),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class _AssignManagerDialog extends ConsumerStatefulWidget {
  const _AssignManagerDialog({
    required this.houseId,
    required this.available,
    required this.hasAnyManagers,
  });

  final String houseId;
  final List<Manager> available;
  final bool hasAnyManagers;

  @override
  ConsumerState<_AssignManagerDialog> createState() =>
      _AssignManagerDialogState();
}

class _AssignManagerDialogState extends ConsumerState<_AssignManagerDialog> {
  String? _selectedManagerId;
  bool _canLogExpenses = false;
  bool _isSubmitting = false;
  String? _error;

  Future<void> _assign() async {
    final managerId = _selectedManagerId;
    if (managerId == null) return;

    setState(() {
      _isSubmitting = true;
      _error = null;
    });
    try {
      await ref.read(managersRepositoryProvider).assignManager(
            widget.houseId,
            managerId: managerId,
            canLogExpenses: _canLogExpenses,
          );
      ref.invalidate(houseManagersProvider(widget.houseId));
      if (!mounted) return;
      Navigator.pop(context);
    } on ApiException catch (e) {
      setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    if (!widget.hasAnyManagers) {
      return AlertDialog(
        title: Text(loc.noManagersYetDialogTitle),
        content: Text(loc.noManagersYetDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              context.push('/managers/new');
            },
            child: Text(loc.createManagerButton),
          ),
        ],
      );
    }

    if (widget.available.isEmpty) {
      return AlertDialog(
        title: Text(loc.assignManagerTooltip),
        content: Text(loc.allManagersAssignedBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.close),
          ),
        ],
      );
    }

    return AlertDialog(
      title: Text(loc.assignManagerTooltip),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            initialValue: _selectedManagerId,
            decoration: InputDecoration(labelText: loc.managerDropdownLabel),
            items: widget.available
                .map((m) => DropdownMenuItem(
                      value: m.id,
                      child: Text(m.fullName),
                    ))
                .toList(),
            onChanged: (v) => setState(() => _selectedManagerId = v),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(loc.canLogExpensesLabel),
            value: _canLogExpenses,
            onChanged: (v) => setState(() => _canLogExpenses = v),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(_error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: _isSubmitting ? null : () => Navigator.pop(context),
          child: Text(loc.cancel),
        ),
        FilledButton(
          onPressed: (_selectedManagerId == null || _isSubmitting)
              ? null
              : _assign,
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
