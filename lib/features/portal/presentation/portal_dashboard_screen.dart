import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/auth/auth_controller.dart';
import '../../../core/auth/current_user_provider.dart';
import '../../../core/locale/locale_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../application/portal_controller.dart';
import '../data/models/renter_ledger.dart';
import '../data/models/renter_profile.dart';

String _monthName(AppLocalizations loc, int month) => [
      loc.monthName1, loc.monthName2, loc.monthName3, loc.monthName4,
      loc.monthName5, loc.monthName6, loc.monthName7, loc.monthName8,
      loc.monthName9, loc.monthName10, loc.monthName11, loc.monthName12,
    ][month - 1];

String _invoiceStatusLabel(AppLocalizations loc, String status) =>
    switch (status) {
      'UNPAID' => loc.invoiceStatusUnpaid,
      'PARTIAL' => loc.invoiceStatusPartial,
      'PAID' => loc.invoiceStatusPaid,
      'CLOSED' => loc.invoiceStatusClosed,
      _ => status,
    };

String _dueStatusLabel(AppLocalizations loc, String status) => switch (status) {
      'OPEN' => loc.dueStatusOpen,
      'PARTIAL' => loc.dueStatusPartial,
      'PAID' => loc.dueStatusPaid,
      'WAIVED' => loc.dueStatusWaived,
      _ => status,
    };

Color _statusColor(BuildContext context, String status) {
  switch (status) {
    case 'UNPAID':
    case 'OPEN':
      return Colors.orange;
    case 'PARTIAL':
      return Colors.blue;
    case 'PAID':
    case 'CLOSED':
      return Colors.green;
    case 'WAIVED':
      return Colors.grey;
    default:
      return Theme.of(context).colorScheme.outline;
  }
}

/// RENTER-only self-service dashboard: a single read-only view of the
/// logged-in renter's own invoices/dues/payment history. No action buttons,
/// no swipe actions, no house/room/renter/manager/owner management UI.
///
/// Self-contained: owns its own AppBar (profile/language/sign-out) so it can
/// stand in for the entire home screen for a RENTER (see HomeScreen) as well
/// as being reachable directly via the /portal route.
class PortalDashboardScreen extends ConsumerStatefulWidget {
  const PortalDashboardScreen({super.key});

  @override
  ConsumerState<PortalDashboardScreen> createState() =>
      _PortalDashboardScreenState();
}

class _PortalDashboardScreenState extends ConsumerState<PortalDashboardScreen> {
  String? _selectedRenterId;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final user = ref.watch(currentUserProvider);
    final locale = ref.watch(localeProvider);
    final profilesAsync = ref.watch(myRenterProfilesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.portalTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: loc.profileTooltip,
            onPressed: () => context.push('/profile'),
          ),
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            tooltip: loc.languageSwitchTooltip,
            initialValue: locale,
            onSelected: (l) => ref.read(localeProvider.notifier).setLocale(l),
            itemBuilder: (context) => [
              CheckedPopupMenuItem(
                value: const Locale('bn'),
                checked: locale.languageCode == 'bn',
                child: Text(loc.languageBangla),
              ),
              CheckedPopupMenuItem(
                value: const Locale('en'),
                checked: locale.languageCode == 'en',
                child: Text(loc.languageEnglish),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: loc.signOutTooltip,
            onPressed: () =>
                ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: profilesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(e is ApiException ? e.message : loc.portalLoadProfilesFailed),
        ),
        data: (profiles) {
          if (profiles.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(loc.portalNoProfiles, textAlign: TextAlign.center),
              ),
            );
          }
          final selected = profiles.firstWhere(
            (p) => p.id == _selectedRenterId,
            orElse: () => profiles.first,
          );
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(myRenterProfilesProvider);
              ref.invalidate(myLedgerProvider(selected.id));
            },
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  loc.homeWelcome(user?.fullName ?? '...'),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                if (profiles.length > 1) ...[
                  DropdownButtonFormField<String>(
                    initialValue: selected.id,
                    decoration: InputDecoration(
                      labelText: loc.portalSelectPropertyLabel,
                      border: const OutlineInputBorder(),
                    ),
                    items: profiles
                        .map((p) => DropdownMenuItem(
                              value: p.id,
                              child: Text(p.houseName),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _selectedRenterId = v),
                  ),
                  const SizedBox(height: 12),
                ],
                _ProfileHeaderCard(profile: selected),
                const SizedBox(height: 16),
                _LedgerSection(renterId: selected.id),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard({required this.profile});

  final RenterProfile profile;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.home_work_outlined, size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.houseName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  if (profile.currentRoomNumbers.isNotEmpty)
                    Text(
                      profile.currentRoomNumbers.join(', '),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Theme.of(context).colorScheme.outline),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LedgerSection extends ConsumerWidget {
  const _LedgerSection({required this.renterId});

  final String renterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final ledgerAsync = ref.watch(myLedgerProvider(renterId));

    return ledgerAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: Text(e is ApiException ? e.message : loc.portalLoadLedgerFailed),
        ),
      ),
      data: (ledger) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SummaryCard(summary: ledger.summary),
          const SizedBox(height: 16),
          _SectionCard(
            title: loc.portalInvoicesSection,
            emptyText: loc.portalNoInvoices,
            itemCount: ledger.invoices.length,
            itemBuilder: (context, i) => _InvoiceTile(invoice: ledger.invoices[i]),
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: loc.portalDuesSection,
            emptyText: loc.portalNoDues,
            itemCount: ledger.dues.length,
            itemBuilder: (context, i) => _DueTile(due: ledger.dues[i]),
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: loc.portalPaymentsSection,
            emptyText: loc.portalNoPayments,
            itemCount: ledger.payments.length,
            itemBuilder: (context, i) => _PaymentTile(payment: ledger.payments[i]),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.summary});

  final LedgerSummary summary;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.portalSummaryTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            _SummaryRow(loc.portalTotalBilled, summary.totalBilled),
            _SummaryRow(loc.portalTotalPaid, summary.totalPaid),
            _SummaryRow(loc.portalTotalOutstanding, summary.totalOutstanding,
                emphasize: true),
            _SummaryRow(loc.portalTotalWaived, summary.totalWaived),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow(this.label, this.value, {this.emphasize = false});

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final style = emphasize
        ? Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)
        : Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text('৳$value', style: style),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.emptyText,
    required this.itemCount,
    required this.itemBuilder,
  });

  final String title;
  final String emptyText;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
            ),
            const SizedBox(height: 4),
            if (itemCount == 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(emptyText,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Theme.of(context).colorScheme.outline)),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemCount,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: itemBuilder,
              ),
          ],
        ),
      ),
    );
  }
}

class _InvoiceTile extends StatelessWidget {
  const _InvoiceTile({required this.invoice});

  final LedgerInvoice invoice;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final color = _statusColor(context, invoice.status);
    return ListTile(
      title: Text(
          '${_monthName(loc, invoice.period.month)} ${invoice.period.year}'),
      subtitle: Text(invoice.issuedAt),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('৳${invoice.totalAmount}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          _StatusChip(
            label: _invoiceStatusLabel(loc, invoice.status),
            color: color,
          ),
        ],
      ),
    );
  }
}

class _DueTile extends StatelessWidget {
  const _DueTile({required this.due});

  final LedgerDue due;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final color = _statusColor(context, due.status);
    return ListTile(
      title: Text(due.headLabel),
      subtitle: Text(
        due.status == 'WAIVED' && due.waiveReason != null
            ? due.waiveReason!
            : due.dueDate,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Theme.of(context).colorScheme.outline),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('৳${due.amount}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          _StatusChip(label: _dueStatusLabel(loc, due.status), color: color),
        ],
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({required this.payment});

  final LedgerPayment payment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('৳${payment.amount}'),
      subtitle: Text('${payment.paymentMethod} · ${payment.paidAt}'),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}
