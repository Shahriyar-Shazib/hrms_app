import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/houses_controller.dart';
import '../data/houses_repository.dart';
import '../data/models/house.dart';
import '../../../l10n/app_localizations.dart';

class HouseDetailScreen extends ConsumerStatefulWidget {
  const HouseDetailScreen({super.key, required this.houseId});

  final String houseId;

  @override
  ConsumerState<HouseDetailScreen> createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends ConsumerState<HouseDetailScreen> {
  bool _isDeleting = false;

  Future<void> _confirmDelete(House house) async {
    final loc = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.deleteHouseDialogTitle),
        content: Text(loc.deleteHouseDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(ctx).colorScheme.error),
            child: Text(loc.delete),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _isDeleting = true);
    try {
      await ref.read(housesRepositoryProvider).deleteHouse(house.id);
      if (!mounted) return;
      context.pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(loc.houseDeleted)));
    } on ApiException catch (e) {
      if (!mounted) return;
      final msg =
          e.code == 'NETWORK_ERROR' ? loc.mustBeOnlineToDelete : e.message;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      if (mounted) setState(() => _isDeleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(houseDetailProvider(widget.houseId));
    final house = state.asData?.value;
    final canEdit = ref.watch(canProvider('house.update'));
    final canDelete = ref.watch(canProvider('house.delete'));

    return Scaffold(
      appBar: AppBar(
        title: Text(house?.name ?? loc.houseAppBarFallback),
        actions: [
          if (house != null && canEdit)
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: loc.editHouseTooltip,
              onPressed: () => context.push(
                '/houses/${house.id}/edit',
                extra: house,
              ),
            ),
          if (house != null && canDelete)
            _isDeleting
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : IconButton(
                    icon: Icon(Icons.delete_outline,
                        color: Theme.of(context).colorScheme.error),
                    tooltip: loc.deleteHouseTooltip,
                    onPressed: () => _confirmDelete(house),
                  ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(e is ApiException ? e.message : loc.failedToLoadHouse),
        ),
        data: (house) {
          if (house == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cloud_off, size: 48),
                    const SizedBox(height: 12),
                    Text(loc.houseNotFound,
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    Text(
                      loc.connectToLoadHouse,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return _HouseDetail(house: house);
        },
      ),
    );
  }
}

class _HouseDetail extends ConsumerWidget {
  const _HouseDetail({required this.house});

  final House house;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final canManageBillConfig = ref.watch(canProvider('billConfig.manage'));
    final canManageMeters = ref.watch(canProvider('meterReading.manage'));
    final canManageManagers = ref.watch(canProvider('manager.manage'));
    final canLogExpenses = ref.watch(canProvider('expense.log'));
    final canViewReports = ref.watch(canProvider('report.view'));
    final canViewInvoices = ref.watch(canProvider('invoice.view'));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _InfoCard(children: [
          _Field(loc.houseFieldName, house.name),
          if (house.address != null)
            _Field(loc.houseFieldAddress, house.address!),
          if (house.city != null) _Field(loc.houseFieldCity, house.city!),
          if (house.totalFloors != null)
            _Field(loc.houseFieldTotalFloors, '${house.totalFloors}'),
          if (house.notes != null) _Field(loc.notesLabel, house.notes!),
        ]),
        const SizedBox(height: 12),
        _InfoCard(children: [
          _Field(loc.createdLabel, house.createdAt),
          _Field(loc.updatedLabel, house.updatedAt),
        ]),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.door_front_door),
                label: Text(loc.roomsButton),
                onPressed: () => context.push('/houses/${house.id}/rooms'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.people),
                label: Text(loc.rentersButton),
                onPressed: () => context.push('/houses/${house.id}/renters'),
              ),
            ),
          ],
        ),
        if (canManageMeters) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.speed),
            label: Text(loc.metersButton),
            onPressed: () => context.push('/houses/${house.id}/meters'),
          ),
        ],
        if (canManageBillConfig) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.receipt_long),
            label: Text(loc.billConfigButton),
            onPressed: () =>
                context.push('/houses/${house.id}/bill-configs'),
          ),
        ],
        if (canManageManagers) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.badge_outlined),
            label: Text(loc.managersButton),
            onPressed: () => context.push('/houses/${house.id}/managers'),
          ),
        ],
        if (canLogExpenses) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.payments_outlined),
            label: Text(loc.expensesButton),
            onPressed: () => context.push('/houses/${house.id}/expenses'),
          ),
        ],
        if (canViewReports) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.bar_chart),
            label: Text(loc.reportsButton),
            onPressed: () => context.push('/houses/${house.id}/reports'),
          ),
        ],
        if (canViewInvoices) ...[
          const SizedBox(height: 12),
          OutlinedButton.icon(
            icon: const Icon(Icons.request_page_outlined),
            label: Text(loc.invoicesButton),
            onPressed: () => context.push('/houses/${house.id}/invoices'),
          ),
        ],
      ],
    );
  }
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
            width: 110,
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
