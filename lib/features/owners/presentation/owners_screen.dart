import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../core/auth/user_model.dart';
import '../../../l10n/app_localizations.dart';
import '../application/owners_controller.dart';
import '../data/models/owner.dart';
import '../data/owners_repository.dart';

class OwnersScreen extends ConsumerStatefulWidget {
  const OwnersScreen({super.key});

  @override
  ConsumerState<OwnersScreen> createState() => _OwnersScreenState();
}

class _OwnersScreenState extends ConsumerState<OwnersScreen> {
  final _searchCtrl = TextEditingController();
  String _search = '';
  String? _status;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  OwnersFilter get _filter => (status: _status, search: _search.isEmpty ? null : _search);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final role = ref.watch(currentRoleProvider);
    final canManage = ref.watch(canProvider('owner.manage'));

    // SA-only screen: role AND permission (mirrors the server's SA-only gate).
    if (role != UserRole.superAdmin || !canManage) {
      return Scaffold(
        appBar: AppBar(title: Text(loc.ownersTitle)),
        body: Center(child: Text(loc.ownersSuperAdminOnly)),
      );
    }

    final ownersAsync = ref.watch(ownersListProvider(_filter));

    return Scaffold(
      appBar: AppBar(title: Text(loc.ownersTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openCreateSheet(context),
        icon: const Icon(Icons.person_add_alt),
        label: Text(loc.ownersCreateButton),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      labelText: loc.ownersSearchLabel,
                      border: const OutlineInputBorder(),
                      isDense: true,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () => setState(() => _search = _searchCtrl.text.trim()),
                      ),
                    ),
                    onSubmitted: (v) => setState(() => _search = v.trim()),
                  ),
                ),
                const SizedBox(width: 12),
                DropdownButton<String?>(
                  value: _status,
                  hint: Text(loc.ownersStatusAll),
                  items: [
                    DropdownMenuItem(value: null, child: Text(loc.ownersStatusAll)),
                    DropdownMenuItem(value: 'ACTIVE', child: Text(loc.ownerStatusActive)),
                    DropdownMenuItem(value: 'SUSPENDED', child: Text(loc.ownerStatusSuspended)),
                    DropdownMenuItem(
                        value: 'PASSWORD_RESET_REQUIRED',
                        child: Text(loc.ownerStatusResetRequired)),
                  ],
                  onChanged: (v) => setState(() => _status = v),
                ),
              ],
            ),
          ),
          Expanded(
            child: ownersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => _ErrorView(
                message: e is ApiException ? e.message : loc.ownersLoadFailed,
                onRetry: () => ref.invalidate(ownersListProvider(_filter)),
              ),
              data: (owners) => owners.isEmpty
                  ? RefreshIndicator(
                      onRefresh: () async => ref.invalidate(ownersListProvider(_filter)),
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                              child: Center(child: Text(loc.ownersEmpty))),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async => ref.invalidate(ownersListProvider(_filter)),
                      child: ListView.separated(
                        itemCount: owners.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (context, i) => _OwnerTile(
                          owner: owners[i],
                          onChanged: () => ref.invalidate(ownersListProvider(_filter)),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openCreateSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _CreateOwnerSheet(
        onCreated: () => ref.invalidate(ownersListProvider(_filter)),
      ),
    );
  }
}

class _OwnerTile extends ConsumerWidget {
  const _OwnerTile({required this.owner, required this.onChanged});

  final Owner owner;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    return ListTile(
      title: Text(owner.fullName),
      subtitle: Text('${owner.email}\n${loc.ownersHousesCount(owner.housesCount ?? 0)}'),
      isThreeLine: true,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StatusChip(status: owner.status),
          PopupMenuButton<String>(
            onSelected: (action) => _onAction(context, ref, action),
            itemBuilder: (_) => [
              if (owner.status == OwnerStatus.suspended)
                PopupMenuItem(value: 'activate', child: Text(loc.ownerActivate))
              else
                PopupMenuItem(value: 'suspend', child: Text(loc.ownerSuspend)),
              PopupMenuItem(value: 'delete', child: Text(loc.delete)),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onAction(BuildContext context, WidgetRef ref, String action) async {
    final loc = AppLocalizations.of(context)!;
    final repo = ref.read(ownersRepositoryProvider);
    final messenger = ScaffoldMessenger.of(context);

    if (action == 'delete') {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(loc.ownerDeleteTitle),
          content: Text(loc.ownerDeleteConfirm(owner.fullName)),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(loc.cancel)),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(loc.delete)),
          ],
        ),
      );
      if (confirmed != true) return;
      try {
        await repo.delete(owner.id);
        onChanged();
        messenger.showSnackBar(SnackBar(content: Text(loc.ownerDeleted)));
      } catch (e) {
        // OWNER_HAS_HOUSES (and any other) surfaces its friendly message; no crash.
        messenger.showSnackBar(SnackBar(
            content: Text(e is ApiException ? e.message : loc.ownersActionFailed)));
      }
      return;
    }

    final newStatus = action == 'suspend' ? 'SUSPENDED' : 'ACTIVE';
    try {
      await repo.updateStatus(owner.id, newStatus);
      onChanged();
    } catch (e) {
      messenger.showSnackBar(SnackBar(
          content: Text(e is ApiException ? e.message : loc.ownersActionFailed)));
    }
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final OwnerStatus status;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final (label, color) = switch (status) {
      OwnerStatus.active => (loc.ownerStatusActive, scheme.primary),
      OwnerStatus.suspended => (loc.ownerStatusSuspended, scheme.error),
      OwnerStatus.passwordResetRequired =>
        (loc.ownerStatusResetRequired, scheme.tertiary),
    };
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Chip(
        label: Text(label, style: TextStyle(color: color, fontSize: 11)),
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

/// Create-owner form. On 201 it swaps to reveal the temp password prominently
/// (there is no email delivery — the SA relays it).
class _CreateOwnerSheet extends ConsumerStatefulWidget {
  const _CreateOwnerSheet({required this.onCreated});

  final VoidCallback onCreated;

  @override
  ConsumerState<_CreateOwnerSheet> createState() => _CreateOwnerSheetState();
}

class _CreateOwnerSheetState extends ConsumerState<_CreateOwnerSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _submitting = false;
  String? _errorMessage;
  Owner? _created;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _nameCtrl.dispose();
    _mobileCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _errorMessage = null;
      _submitting = true;
    });

    // Capture before await (gotcha: ref/context after await on a sheet that
    // may close). Notifier + plain values only.
    final repo = ref.read(ownersRepositoryProvider);
    final email = _emailCtrl.text.trim();
    final name = _nameCtrl.text.trim();
    final mobile = _mobileCtrl.text.trim();
    final password = _passwordCtrl.text;

    try {
      final owner = await repo.create(
        email: email,
        password: password,
        fullName: name,
        mobile: mobile.isEmpty ? null : mobile,
      );
      widget.onCreated();
      if (!mounted) return;
      setState(() {
        _created = owner;
        _submitting = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e is ApiException ? e.message : e.toString();
        _submitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
      child: _created != null
          ? _CreatedView(
              owner: _created!,
              tempPassword: _passwordCtrl.text,
              onDone: () => Navigator.pop(context),
            )
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(loc.ownersCreateTitle,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    if (_errorMessage != null) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(_errorMessage!,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onErrorContainer)),
                      ),
                      const SizedBox(height: 12),
                    ],
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: InputDecoration(
                        labelText: loc.ownersFullNameLabel,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? loc.ownersFullNameRequired
                          : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: loc.ownersEmailLabel,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? loc.ownersEmailRequired
                          : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _mobileCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: loc.ownersMobileLabel,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordCtrl,
                      decoration: InputDecoration(
                        labelText: loc.ownersTempPasswordLabel,
                        helperText: loc.ownersTempPasswordHelp,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.length < 8)
                          ? loc.ownersTempPasswordTooShort
                          : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _submitting ? null : _submit,
                      child: _submitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2))
                          : Text(loc.ownersCreateButton),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class _CreatedView extends StatelessWidget {
  const _CreatedView({
    required this.owner,
    required this.tempPassword,
    required this.onDone,
  });

  final Owner owner;
  final String tempPassword;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(loc.ownersCreatedTitle,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(loc.ownersCreatedFor(owner.fullName, owner.email)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SelectableText(
              tempPassword,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontFamily: 'monospace'),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            loc.ownersTempPasswordRelay,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onTertiaryContainer),
          ),
        ),
        const SizedBox(height: 20),
        FilledButton(onPressed: onDone, child: Text(loc.done)),
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
