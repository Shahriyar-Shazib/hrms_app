import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/renters_controller.dart';
import '../data/models/renter.dart';

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
    final state = ref.watch(renterDetailProvider((houseId, renterId)));
    final canEdit = ref.watch(canProvider('renter.update'));
    final renter = state.asData?.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(renter?.fullName ?? 'Renter'),
        actions: [
          if (canEdit && renter != null)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit renter',
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
              e is ApiException ? e.message : 'Failed to load renter'),
        ),
        data: (renter) {
          if (renter == null) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.cloud_off, size: 48),
                    SizedBox(height: 12),
                    Text('Renter not found',
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text(
                      'Connect to the internet to load this renter.',
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
    final canCollect = ref.watch(canProvider('payment.collect'));
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(children: [
          _Field('Name', renter.fullName),
          _Field('Mobile', renter.mobile),
          _Field('Status', renter.status),
          _Field('Advance', '৳${renter.advanceAmount}'),
        ]),
        if (renter.currentAssignment != null) ...[
          const SizedBox(height: 12),
          _InfoCard(children: [
            const _SectionHeader('Current Assignment'),
            _Field('Room', renter.currentAssignment!.roomNumber),
            _Field('Move-in', renter.currentAssignment!.moveInDate),
          ]),
        ],
        if (_hasContactInfo(renter)) ...[
          const SizedBox(height: 12),
          _InfoCard(children: [
            const _SectionHeader('Contact & Identity'),
            if (renter.nidNumber != null)
              _Field('NID', renter.nidNumber!),
            if (renter.presentAddress != null)
              _Field('Present Address', renter.presentAddress!),
            if (renter.permanentAddress != null)
              _Field('Permanent Address', renter.permanentAddress!),
            if (renter.occupation != null)
              _Field('Occupation', renter.occupation!),
            if (renter.organization != null)
              _Field('Organization', renter.organization!),
            if (renter.emergencyContactName != null)
              _Field('Emergency Contact', renter.emergencyContactName!),
            if (renter.emergencyContactMobile != null)
              _Field('Emergency Mobile', renter.emergencyContactMobile!),
          ]),
        ],
        const SizedBox(height: 12),
        _InfoCard(children: [
          _Field('Created', renter.createdAt),
          _Field('Updated', renter.updatedAt),
        ]),
        if (canCollect) ...[
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.payments),
            label: const Text('Collect Payment'),
            onPressed: () => context.push(
              '/houses/${renter.houseId}/renters/${renter.id}/collect',
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
