import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_exception.dart';
import '../../../l10n/app_localizations.dart';
import '../application/audit_controller.dart';
import '../data/models/audit_log.dart';

String _prettyEntity(String entityType) =>
    entityType.replaceFirst('App\\Models\\', '');

String _fieldValue(dynamic value) => value == null ? '—' : value.toString();

class AuditLogScreen extends ConsumerWidget {
  const AuditLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(auditLogsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(loc.auditLogTitle)),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(
          message: e is ApiException ? e.message : loc.failedToLoadAuditLogs,
          onRetry: () => ref.invalidate(auditLogsProvider),
        ),
        data: (logs) => logs.isEmpty
            ? RefreshIndicator(
                onRefresh: () async => ref.invalidate(auditLogsProvider),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Center(child: Text(loc.noAuditEntries)),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: () async => ref.invalidate(auditLogsProvider),
                child: ListView.separated(
                  itemCount: logs.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, i) => _AuditLogTile(log: logs[i]),
                ),
              ),
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
      title: Text('${_prettyEntity(log.entityType)} ${log.action}'),
      subtitle: Text(subtitle),
      onTap: () => _showDetails(context, loc, log),
    );
  }

  void _showDetails(
      BuildContext context, AppLocalizations loc, AuditLog log) {
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
