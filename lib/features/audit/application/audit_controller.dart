import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/audit_repository.dart';
import '../data/models/audit_log.dart';

// Page 1 only for now — add pagination (infinite scroll / page controls)
// once the audit log grows large enough to need it.
final auditLogsProvider = FutureProvider.autoDispose<List<AuditLog>>((ref) {
  return ref.watch(auditRepositoryProvider).getLogs();
});
