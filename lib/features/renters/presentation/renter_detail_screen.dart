import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../assignments/presentation/assign_dialog.dart';
import '../../assignments/presentation/move_out_dialog.dart';
import '../../assignments/presentation/transfer_dialog.dart';
import '../application/renters_controller.dart';
import '../data/models/renter.dart';
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
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(children: [
          _Field(loc.roomFieldName, renter.fullName),
          _Field(loc.roomFieldMobile, renter.mobile),
          _Field(loc.roomFieldStatus, renter.status),
          _Field(loc.renterFieldAdvance, '৳${renter.advanceAmount ?? '0.00'}'),
        ]),
        if (renter.currentAssignment != null) ...[
          const SizedBox(height: 12),
          _InfoCard(children: [
            _SectionHeader(loc.currentAssignmentSectionTitle),
            _Field(loc.renterFieldRoom, renter.currentAssignment!.roomNumber),
            _Field(loc.renterFieldMoveIn, renter.currentAssignment!.moveInDate),
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
        if (canManage) ...[
          const SizedBox(height: 16),
          if (renter.currentAssignment == null)
            FilledButton.icon(
              icon: const Icon(Icons.home),
              label: Text(loc.assignToRoomButton),
              onPressed: () => showAssignDialog(
                context,
                houseId: renter.houseId,
                renterId: renter.id,
              ),
            )
          else ...[
            OutlinedButton.icon(
              icon: const Icon(Icons.swap_horiz),
              label: Text(loc.transfer),
              onPressed: () => showTransferDialog(
                context,
                houseId: renter.houseId,
                renterId: renter.id,
                currentRoomId: renter.currentAssignment!.roomId,
              ),
            ),
            const SizedBox(height: 8),
            FilledButton.icon(
              icon: const Icon(Icons.exit_to_app),
              label: Text(loc.moveOut),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
              onPressed: () => showMoveOutDialog(
                context,
                houseId: renter.houseId,
                renterId: renter.id,
              ),
            ),
          ],
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
      ],
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
