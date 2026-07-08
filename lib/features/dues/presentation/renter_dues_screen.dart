import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../collection/application/collection_controller.dart';
import '../application/dues_controller.dart';
import '../data/models/due.dart';
import 'waive_due_dialog.dart';

class RenterDuesScreen extends ConsumerWidget {
  const RenterDuesScreen({
    super.key,
    required this.houseId,
    required this.renterId,
  });

  final String houseId;
  final String renterId;

  Future<void> _waive(
    BuildContext context,
    WidgetRef ref,
    Due due,
  ) async {
    final waived = await showWaiveDueDialog(
      context,
      houseId: houseId,
      dueId: due.id,
      headLabel: due.headLabel,
      outstanding: due.outstanding,
    );
    if (!waived) return;

    ref.invalidate(duesProvider((houseId, renterId)));
    ref.invalidate(previewProvider((houseId, renterId)));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.dueWaived)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(duesProvider((houseId, renterId)));
    final canManage = ref.watch(canProvider('due.waive'));

    return Scaffold(
      appBar: AppBar(title: Text(loc.duesTitle)),
      floatingActionButton: canManage
          ? FloatingActionButton.extended(
              onPressed: () => context
                  .push('/houses/$houseId/renters/$renterId/dues/new'),
              icon: const Icon(Icons.add),
              label: Text(loc.addDueTooltip),
            )
          : null,
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(e is ApiException ? e.message : loc.failedToLoadDues),
        ),
        data: (dues) {
          if (dues.isEmpty) {
            return Center(child: Text(loc.noDuesForRenter));
          }
          final sorted = [...dues]
            ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
          return ListView.separated(
            itemCount: sorted.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, i) => _DueTile(
              due: sorted[i],
              canManage: canManage,
              onWaive: () => _waive(context, ref, sorted[i]),
            ),
          );
        },
      ),
    );
  }
}

class _DueTile extends StatelessWidget {
  const _DueTile({
    required this.due,
    required this.canManage,
    required this.onWaive,
  });

  final Due due;
  final bool canManage;
  final VoidCallback onWaive;

  bool get _isPartiallyPaid => due.paidAmount != '0.00';
  bool get _canWaive => due.status == 'OPEN' || due.status == 'PARTIAL';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return ListTile(
      title: Row(
        children: [
          Expanded(child: Text(due.headLabel)),
          if (due.source == 'MANUAL') ...[
            const SizedBox(width: 6),
            _Tag(label: loc.manualTag),
          ],
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            due.dueDate,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          if (due.status == 'WAIVED' && due.waiveReason != null)
            Text(
              loc.waivedLine(due.waiveReason!),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.outline),
            )
          else if (due.reason != null && due.reason!.isNotEmpty)
            Text(
              due.reason!,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.outline),
            ),
        ],
      ),
      isThreeLine: (due.status == 'WAIVED' && due.waiveReason != null) ||
          (due.reason != null && due.reason!.isNotEmpty),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _isPartiallyPaid
                    ? loc.dueOfAmount('৳${due.outstanding}', '৳${due.amount}')
                    : '৳${due.outstanding}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              _StatusChip(status: due.status),
            ],
          ),
          if (canManage && _canWaive) ...[
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(Icons.remove_circle_outline,
                  size: 20, color: Theme.of(context).colorScheme.error),
              tooltip: loc.waiveTooltip,
              onPressed: onWaive,
            ),
          ],
        ],
      ),
    );
  }
}

String _dueStatusLabel(AppLocalizations loc, String status) => switch (status) {
      'OPEN' => loc.dueStatusOpen,
      'PARTIAL' => loc.dueStatusPartial,
      'PAID' => loc.dueStatusPaid,
      'WAIVED' => loc.dueStatusWaived,
      _ => status,
    };

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final String status;

  Color _color(BuildContext context) {
    switch (status) {
      case 'OPEN':
        return Colors.orange;
      case 'PARTIAL':
        return Colors.blue;
      case 'PAID':
        return Colors.green;
      case 'WAIVED':
        return Colors.grey;
      default:
        return Theme.of(context).colorScheme.outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final color = _color(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _dueStatusLabel(loc, status),
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
