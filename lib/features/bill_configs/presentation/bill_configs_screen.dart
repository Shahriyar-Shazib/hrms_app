import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../application/bill_configs_controller.dart';
import '../data/models/bill_config.dart';

class BillConfigsScreen extends ConsumerWidget {
  const BillConfigsScreen({super.key, required this.houseId});

  final String houseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(billConfigsProvider(houseId));
    final canManage = ref.watch(canProvider('billConfig.manage'));

    return Scaffold(
      appBar: AppBar(title: const Text('Bill Configuration')),
      floatingActionButton: canManage
          ? FloatingActionButton(
              tooltip: 'Add Bill Head',
              onPressed: () =>
                  context.push('/houses/$houseId/bill-configs/new'),
              child: const Icon(Icons.add),
            )
          : null,
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
              e is ApiException ? e.message : 'Failed to load bill config'),
        ),
        data: (configs) => configs.isEmpty
            ? const Center(child: Text('No bill heads configured.'))
            : ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: configs.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, i) =>
                    _BillConfigTile(config: configs[i]),
              ),
      ),
    );
  }
}

class _BillConfigTile extends StatelessWidget {
  const _BillConfigTile({required this.config});

  final BillConfig config;

  static const _headLabels = {
    'SERVICE_CHARGE': 'Service Charge',
    'WASTE_BILL': 'Waste Bill',
    'ELECTRICITY_RATE_PER_UNIT': 'Electricity Rate (per unit)',
    'CUSTOM': 'Custom',
  };

  String get _amountText => config.head == 'ELECTRICITY_RATE_PER_UNIT'
      ? '৳${config.amount} / unit'
      : '৳${config.amount}';

  String get _headLabel =>
      _headLabels[config.head] ?? config.head;

  @override
  Widget build(BuildContext context) {
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
        '$_headLabel · effective ${config.effectiveFrom}',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Theme.of(context).colorScheme.outline),
      ),
      trailing: Text(
        _amountText,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
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
