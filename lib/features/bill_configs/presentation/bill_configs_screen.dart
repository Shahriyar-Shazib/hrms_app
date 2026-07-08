import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/bill_configs_controller.dart';
import '../data/models/bill_config.dart';
import '../../../l10n/app_localizations.dart';

class BillConfigsScreen extends ConsumerWidget {
  const BillConfigsScreen({super.key, required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(billConfigsProvider(houseId));
    final canManage = ref.watch(canProvider('billConfig.manage'));

    return Scaffold(
      appBar: AppBar(title: Text(loc.billConfigTitle)),
      floatingActionButton: canManage
          ? FloatingActionButton(
              tooltip: loc.addBillHeadTooltip,
              onPressed: () =>
                  context.push('/houses/$houseId/bill-configs/new'),
              child: const Icon(Icons.add),
            )
          : null,
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
              e is ApiException ? e.message : loc.failedToLoadBillConfig),
        ),
        data: (configs) => configs.isEmpty
            ? Center(child: Text(loc.noBillHeadsConfigured))
            : ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: configs.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, i) => _BillConfigTile(
                  config: configs[i],
                  houseId: houseId,
                  canManage: canManage,
                ),
              ),
      ),
    );
  }
}

class _BillConfigTile extends StatelessWidget {
  const _BillConfigTile({
    required this.config,
    required this.houseId,
    required this.canManage,
  });

  final BillConfig config;
  final String houseId;
  final bool canManage;

  Map<String, String> _headLabels(AppLocalizations loc) => {
        'SERVICE_CHARGE': loc.billHeadServiceCharge,
        'WASTE_BILL': loc.billHeadWasteBill,
        'ELECTRICITY_RATE_PER_UNIT': loc.billHeadElectricityRate,
        'CUSTOM': loc.billHeadCustom,
      };

  String get _amountText => config.head == 'ELECTRICITY_RATE_PER_UNIT'
      ? '৳${config.amount} / unit'
      : '৳${config.amount}';

  String _headLabel(AppLocalizations loc) =>
      _headLabels(loc)[config.head] ?? config.head;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          _headIcon(config.head),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          size: 20,
        ),
      ),
      title: Text(config.label),
      subtitle: Text(
        loc.billConfigSubtitle(_headLabel(loc), config.effectiveFrom),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Theme.of(context).colorScheme.outline),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _amountText,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          if (canManage) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.edit_outlined,
              size: 18,
              color: Theme.of(context).colorScheme.outline,
            ),
          ],
        ],
      ),
      onTap: canManage
          ? () => context.push(
                '/houses/$houseId/bill-configs/edit',
                extra: config,
              )
          : null,
    );
  }

  IconData _headIcon(String head) {
    switch (head) {
      case 'SERVICE_CHARGE':
        return Icons.miscellaneous_services;
      case 'WASTE_BILL':
        return Icons.delete_outline;
      case 'ELECTRICITY_RATE_PER_UNIT':
        return Icons.bolt;
      default:
        return Icons.receipt_long;
    }
  }
}
