import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/audit_repository.dart';
import '../data/models/audit_log.dart';

/// Page 1, filtered server-side by [houseId] (null = unfiltered). Keyed by
/// houseId so each filter caches separately and autoDisposes when unused.
final auditLogsProvider =
    FutureProvider.autoDispose.family<List<AuditLog>, String?>((ref, houseId) {
  return ref.watch(auditRepositoryProvider).getLogs(houseId: houseId);
});
