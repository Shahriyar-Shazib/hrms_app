import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove manager?'),
        content: Text(
            'Revoke ${assignment.manager?.fullName ?? 'Manager'}\'s access to this house.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(ctx).colorScheme.error),
            child: const Text('Remove'),
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
          .showSnackBar(const SnackBar(content: Text('Manager removed')));
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
    final state = ref.watch(houseManagersProvider(houseId));

    return Scaffold(
      appBar: AppBar(title: const Text('Managers')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAssignPicker(context, ref),
        icon: const Icon(Icons.person_add_alt),
        label: const Text('Assign Manager'),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : 'Failed to load managers',
          onRetry: () => ref.invalidate(houseManagersProvider(houseId)),
        ),
        data: (assignments) => assignments.isEmpty
            ? const Center(child: Text('No managers assigned to this house.'))
            : ListView.separated(
                itemCount: assignments.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, i) {
                  final a = assignments[i];
                  return ListTile(
                    leading: const CircleAvatar(
                        child: Icon(Icons.badge_outlined)),
                    title: Text(a.manager?.fullName ?? 'Manager'),
                    subtitle: Text(a.manager?.email ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Expenses',
                                style: TextStyle(fontSize: 10)),
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
                          tooltip: 'Remove',
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
    if (!widget.hasAnyManagers) {
      return AlertDialog(
        title: const Text('No managers yet'),
        content: const Text(
            'Create a manager first, then assign them to this house.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              context.push('/managers/new');
            },
            child: const Text('Create Manager'),
          ),
        ],
      );
    }

    if (widget.available.isEmpty) {
      return AlertDialog(
        title: const Text('Assign Manager'),
        content: const Text(
            'All of your managers are already assigned to this house.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      );
    }

    return AlertDialog(
      title: const Text('Assign Manager'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            initialValue: _selectedManagerId,
            decoration: const InputDecoration(labelText: 'Manager'),
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
            title: const Text('Can log expenses'),
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
          child: const Text('Cancel'),
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
              : const Text('Assign'),
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
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
