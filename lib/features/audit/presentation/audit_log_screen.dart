import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../../features/houses/application/houses_controller.dart';
import '../../../features/houses/data/models/house.dart';
import '../../../features/owners/application/owners_controller.dart';
import '../../../features/owners/data/models/owner.dart';
import '../../../l10n/app_localizations.dart';
import '../application/audit_controller.dart';
import '../data/models/audit_log.dart';

String _prettyEntity(String entityType) =>
    entityType.replaceFirst('App\\Models\\', '');

String _fieldValue(dynamic value) => value == null ? '—' : value.toString();

class AuditLogScreen extends ConsumerStatefulWidget {
  const AuditLogScreen({super.key});

  @override
  ConsumerState<AuditLogScreen> createState() => _AuditLogScreenState();
}

class _AuditLogScreenState extends ConsumerState<AuditLogScreen> {
  // Filter state. `_ownerId` maps to house_id(s) client-side; the server takes
  // exactly one house_id per request, so `_effectiveHouseId` is what we query.
  String? _ownerId;
  String? _houseId;

  List<House> _housesFor(List<House> all) =>
      _ownerId == null ? all : all.where((h) => h.ownerId == _ownerId).toList();

  /// The single house_id sent to the server: an explicit house pick wins;
  /// otherwise a single-house owner auto-maps to their one house.
  String? _effectiveHouseId(List<House> houses) {
    if (_houseId != null) return _houseId;
    if (_ownerId != null) {
      final owned = houses.where((h) => h.ownerId == _ownerId).toList();
      if (owned.length == 1) return owned.first.id;
    }
    return null;
  }

  bool get _filterActive => _houseId != null || _ownerId != null;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final housesAsync = ref.watch(housesControllerProvider);
    final houses = housesAsync.asData?.value ?? const <House>[];
    final effectiveHouseId = _effectiveHouseId(houses);
    final ownerHouses = _housesFor(houses);
    // A multi-house owner is selected but no specific house chosen yet — the
    // server can't filter by owner directly, so prompt for a house.
    final needsHousePick =
        _ownerId != null && ownerHouses.length > 1 && _houseId == null;

    final logsAsync = ref.watch(auditLogsProvider(effectiveHouseId));

    return Scaffold(
      appBar: AppBar(title: Text(loc.auditLogTitle)),
      body: Column(
        children: [
          _Filters(
            houses: houses,
            ownerHouses: ownerHouses,
            ownerId: _ownerId,
            houseId: _houseId,
            filterActive: _filterActive,
            onOwnerChanged: (v) => setState(() {
              _ownerId = v;
              _houseId = null; // owner change re-derives the house scope
            }),
            onHouseChanged: (v) => setState(() => _houseId = v),
            onClear: () => setState(() {
              _ownerId = null;
              _houseId = null;
            }),
          ),
          if (needsHousePick)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(loc.auditOwnerMultiHouseHint(ownerHouses.length),
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          Expanded(
            child: needsHousePick
                ? Center(child: Text(loc.auditPickHousePrompt))
                : logsAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => _ErrorView(
                      message: e is ApiException
                          ? e.message
                          : loc.failedToLoadAuditLogs,
                      onRetry: () =>
                          ref.invalidate(auditLogsProvider(effectiveHouseId)),
                    ),
                    data: (logs) => _AuditList(
                      logs: logs,
                      houses: houses,
                      filterActive: _filterActive,
                      onRefresh: () async =>
                          ref.invalidate(auditLogsProvider(effectiveHouseId)),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _Filters extends ConsumerWidget {
  const _Filters({
    required this.houses,
    required this.ownerHouses,
    required this.ownerId,
    required this.houseId,
    required this.filterActive,
    required this.onOwnerChanged,
    required this.onHouseChanged,
    required this.onClear,
  });

  final List<House> houses;
  final List<House> ownerHouses;
  final String? ownerId;
  final String? houseId;
  final bool filterActive;
  final ValueChanged<String?> onOwnerChanged;
  final ValueChanged<String?> onHouseChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final ownersAsync = ref.watch(allOwnersProvider);
    final owners = ownersAsync.asData?.value ?? const <Owner>[];
    final houseChoices = ownerId == null ? houses : ownerHouses;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Owner filter (SA-only screen, so always shown here).
              Expanded(
                child: DropdownButtonFormField<String?>(
                  isExpanded: true,
                  initialValue: ownerId,
                  decoration: InputDecoration(
                    labelText: loc.auditFilterOwnerLabel,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                  items: [
                    DropdownMenuItem(value: null, child: Text(loc.auditFilterAllOwners)),
                    for (final o in owners)
                      DropdownMenuItem(value: o.id, child: Text(o.fullName)),
                  ],
                  onChanged: onOwnerChanged,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String?>(
                  isExpanded: true,
                  initialValue: houseId,
                  decoration: InputDecoration(
                    labelText: loc.auditFilterHouseLabel,
                    border: const OutlineInputBorder(),
                    isDense: true,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: null,
                      child: Text(ownerId == null
                          ? loc.auditFilterAllHouses
                          : loc.auditFilterAllTheirHouses),
                    ),
                    for (final h in houseChoices)
                      DropdownMenuItem(value: h.id, child: Text(h.name)),
                  ],
                  onChanged: onHouseChanged,
                ),
              ),
            ],
          ),
          if (filterActive)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onClear,
                child: Text(loc.auditClearFilters),
              ),
            ),
        ],
      ),
    );
  }
}

class _AuditList extends StatelessWidget {
  const _AuditList({
    required this.logs,
    required this.houses,
    required this.filterActive,
    required this.onRefresh,
  });

  final List<AuditLog> logs;
  final List<House> houses;
  final bool filterActive;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    if (logs.isEmpty) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(child: Center(child: Text(loc.noAuditEntries))),
          ],
        ),
      );
    }

    final houseName = {for (final h in houses) h.id: h.name};

    // Group by house_id, preserving the API's newest-first order within each
    // group. When a filter is active every row shares one house_id, so the
    // System (null-house) group cannot appear — but we also exclude it
    // defensively so a filtered view never shows System.
    final groups = <String, List<AuditLog>>{};
    for (final log in logs) {
      final key = log.houseId ?? '__system__';
      if (filterActive && key == '__system__') continue;
      (groups[key] ??= []).add(log);
    }

    String labelFor(String key) => key == '__system__'
        ? loc.auditSystemGroup
        : (houseName[key] ??
            loc.auditHouseShort(key.length > 6 ? key.substring(0, 6) : key));

    final keys = groups.keys.toList();

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: keys.length,
        itemBuilder: (context, gi) {
          final key = keys[gi];
          final entries = groups[key]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Text(
                  labelFor(key),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              for (final log in entries) _AuditLogTile(log: log),
              const Divider(height: 1),
            ],
          );
        },
      ),
    );
  }
}

class _AuditLogTile extends StatelessWidget {
  const _AuditLogTile({required this.log});

  final AuditLog log;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final subtitle = [
      log.occurredAt,
      log.actorRole ?? loc.auditSystemActor,
      if (log.ip != null && log.ip!.isNotEmpty) log.ip!,
    ].join(' · ');

    return ListTile(
      dense: true,
      title: Text('${_prettyEntity(log.entityType)} ${log.action}'),
      subtitle: Text(subtitle),
      onTap: () => _showDetails(context, loc, log),
    );
  }

  void _showDetails(BuildContext context, AppLocalizations loc, AuditLog log) {
    final before = log.before ?? const <String, dynamic>{};
    final after = log.after ?? const <String, dynamic>{};
    final fields = {...before.keys, ...after.keys}.toList()..sort();

    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.auditDetailsDialogTitle),
        content: SizedBox(
          width: double.maxFinite,
          child: fields.isEmpty
              ? Text(loc.auditNoChangeDetails)
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final field in fields)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(loc.auditFieldChangeLine(
                            field,
                            _fieldValue(before[field]),
                            _fieldValue(after[field]),
                          )),
                        ),
                    ],
                  ),
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.close),
          ),
        ],
      ),
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
