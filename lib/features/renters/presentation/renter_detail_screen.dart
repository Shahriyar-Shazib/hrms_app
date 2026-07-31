import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../assignments/presentation/assign_dialog.dart';
import '../../assignments/presentation/move_out_dialog.dart';
import '../../assignments/presentation/transfer_dialog.dart';
import '../../../core/auth/user_model.dart';
import '../../rooms/application/rooms_controller.dart';
import '../application/renters_controller.dart';
import '../data/models/renter.dart';
import '../data/renters_repository.dart';
import '../../../l10n/app_localizations.dart';

class RenterDetailScreen extends ConsumerWidget {
  const RenterDetailScreen({
    super.key,
    required this.houseId,
    required this.renterId,
  });

  final String houseId;
  final String renterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(renterDetailProvider((houseId, renterId)));
    final canEdit = ref.watch(canProvider('renter.update'));
    final renter = state.asData?.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(renter?.fullName ?? loc.renterAppBarFallback),
        actions: [
          if (canEdit && renter != null)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: loc.editRenterTooltip,
              onPressed: () => context.push(
                '/houses/$houseId/renters/$renterId/edit',
                extra: renter,
              ),
            ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
              e is ApiException ? e.message : loc.failedToLoadRenter),
        ),
        data: (renter) {
          if (renter == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cloud_off, size: 48),
                    const SizedBox(height: 12),
                    Text(loc.renterNotFound,
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    Text(
                      loc.connectToLoadRenter,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return _RenterDetail(renter: renter);
        },
      ),
    );
  }
}

class _RenterDetail extends ConsumerWidget {
  const _RenterDetail({required this.renter});

  final Renter renter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final canCollect = ref.watch(canProvider('payment.collect'));
    final canManage = ref.watch(canProvider('assignment.manage'));
    final canManageDues = ref.watch(canProvider('due.waive'));
    // "owner/manager action" per spec — not gated by a permission slug (the
    // client-side permission map has no dedicated portal-access entry), just
    // by role, same as every other staff-only affordance on this screen.
    final role = ref.watch(currentRoleProvider);
    final canEnablePortalAccess =
        role == UserRole.houseOwner || role == UserRole.manager;
    final roomsState = ref.watch(roomsControllerProvider(renter.houseId));
    final vacantRooms = roomsState.asData?.value
            .where((r) => r.status == 'VACANT')
            .toList() ??
        [];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(children: [
          _Field(loc.roomFieldName, renter.fullName),
          _Field(loc.roomFieldMobile, renter.mobile),
          _Field(loc.roomFieldStatus, renter.status),
          _Field(loc.renterFieldAdvance, '৳${renter.advanceAmount ?? '0.00'}'),
        ]),
        // A renter may hold several active room assignments at once.
        for (final assignment in renter.currentAssignments) ...[
          const SizedBox(height: 12),
          _InfoCard(children: [
            _SectionHeader(loc.currentAssignmentSectionTitle),
            _Field(loc.renterFieldRoom, assignment.roomNumber),
            _Field(loc.renterFieldMoveIn, assignment.moveInDate),
            if (canManage) ...[
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.swap_horiz, size: 18),
                        label: Text(loc.transfer),
                        onPressed: () => showTransferDialog(
                          context,
                          houseId: renter.houseId,
                          renterId: renter.id,
                          fromRoomId: assignment.roomId,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FilledButton.icon(
                        icon: const Icon(Icons.exit_to_app, size: 18),
                        label: Text(loc.moveOut),
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                        onPressed: () => showMoveOutDialog(
                          context,
                          houseId: renter.houseId,
                          renterId: renter.id,
                          roomId: assignment.roomId,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ]),
        ],
        if (_hasContactInfo(renter)) ...[
          const SizedBox(height: 12),
          _InfoCard(children: [
            _SectionHeader(loc.contactIdentitySectionTitle),
            if (renter.nidNumber != null)
              _Field(loc.renterFieldNid, renter.nidNumber!),
            if (renter.presentAddress != null)
              _Field(loc.renterFieldPresentAddress, renter.presentAddress!),
            if (renter.permanentAddress != null)
              _Field(
                  loc.renterFieldPermanentAddress, renter.permanentAddress!),
            if (renter.occupation != null)
              _Field(loc.renterFieldOccupation, renter.occupation!),
            if (renter.organization != null)
              _Field(loc.renterFieldOrganization, renter.organization!),
            if (renter.emergencyContactName != null)
              _Field(loc.renterFieldEmergencyContact,
                  renter.emergencyContactName!),
            if (renter.emergencyContactMobile != null)
              _Field(loc.renterFieldEmergencyMobile,
                  renter.emergencyContactMobile!),
          ]),
        ],
        const SizedBox(height: 12),
        _InfoCard(children: [
          _Field(loc.createdLabel, renter.createdAt),
          _Field(loc.updatedLabel, renter.updatedAt),
        ]),
        if (canManage && vacantRooms.isNotEmpty) ...[
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.home),
            label: Text(loc.assignToRoomButton),
            onPressed: () => showAssignDialog(
              context,
              houseId: renter.houseId,
              renterId: renter.id,
            ),
          ),
        ],
        if (canCollect) ...[
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.payments),
            label: Text(loc.collectPaymentButton),
            onPressed: () => context.push(
              '/houses/${renter.houseId}/renters/${renter.id}/collect',
            ),
          ),
        ],
        if (canManageDues) ...[
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.request_quote_outlined),
            label: Text(loc.duesButton),
            onPressed: () => context.push(
              '/houses/${renter.houseId}/renters/${renter.id}/dues',
            ),
          ),
        ],
        if (canEnablePortalAccess) ...[
          const SizedBox(height: 8),
          if (renter.hasPortalAccess)
            OutlinedButton.icon(
              icon: const Icon(Icons.check_circle_outline),
              label: Text(loc.renterPortalAccessEnabledLabel),
              onPressed: null,
            )
          else
            OutlinedButton.icon(
              icon: const Icon(Icons.key_outlined),
              label: Text(loc.renterEnablePortalAccessButton),
              onPressed: () => _showEnablePortalAccessSheet(context, ref, renter),
            ),
        ],
      ],
    );
  }

  Future<void> _showEnablePortalAccessSheet(
    BuildContext context,
    WidgetRef ref,
    Renter renter,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _EnablePortalAccessSheet(renter: renter),
    );
  }

  bool _hasContactInfo(Renter r) =>
      r.nidNumber != null ||
      r.presentAddress != null ||
      r.permanentAddress != null ||
      r.occupation != null ||
      r.organization != null ||
      r.emergencyContactName != null ||
      r.emergencyContactMobile != null;
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: children),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  const _Field(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.outline),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

/// Owner/manager action: grants an existing renter a RENTER-role login for
/// the self-service portal. Two-stage flow mirroring _CreateOwnerSheet in
/// owners_screen.dart — form stage, then a success stage revealing the typed
/// temp password (there is no email/SMS delivery in this system; the staff
/// user must relay it manually, exactly once).
class _EnablePortalAccessSheet extends ConsumerStatefulWidget {
  const _EnablePortalAccessSheet({required this.renter});

  final Renter renter;

  @override
  ConsumerState<_EnablePortalAccessSheet> createState() =>
      _EnablePortalAccessSheetState();
}

class _EnablePortalAccessSheetState
    extends ConsumerState<_EnablePortalAccessSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _mobileCtrl;
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;
  bool _submitting = false;
  String? _errorMessage;
  Renter? _updated;

  @override
  void initState() {
    super.initState();
    _mobileCtrl = TextEditingController(text: widget.renter.mobile);
  }

  @override
  void dispose() {
    _mobileCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _errorMessage = null;
      _submitting = true;
    });

    final repo = ref.read(rentersRepositoryProvider);
    final houseId = widget.renter.houseId;
    final renterId = widget.renter.id;
    final mobile = _mobileCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final password = _passwordCtrl.text;

    try {
      final renter = await repo.enablePortalAccess(
        houseId,
        renterId,
        mobile: mobile,
        email: email.isEmpty ? null : email,
        password: password,
      );
      if (!mounted) return;
      setState(() {
        _updated = renter;
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
      child: _updated != null
          ? _PortalAccessCreatedView(
              renter: _updated!,
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
                    Text(loc.renterEnablePortalAccessTitle,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(loc.renterPortalAccessIntro(widget.renter.fullName)),
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
                      controller: _mobileCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: '${loc.mobileLabel} *',
                        hintText: loc.mobileHint,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? loc.mobileRequired
                          : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: loc.emailLabel,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordCtrl,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: loc.ownersTempPasswordLabel,
                        helperText: loc.ownersTempPasswordHelp,
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword),
                        ),
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
                          : Text(loc.renterEnablePortalAccessButton),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class _PortalAccessCreatedView extends StatelessWidget {
  const _PortalAccessCreatedView({
    required this.renter,
    required this.tempPassword,
    required this.onDone,
  });

  final Renter renter;
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
              child: Text(loc.renterPortalAccessCreatedTitle,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(loc.renterPortalAccessCreatedFor(renter.fullName)),
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
            loc.renterPortalTempPasswordRelay,
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
