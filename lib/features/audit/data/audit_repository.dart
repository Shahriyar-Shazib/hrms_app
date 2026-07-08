import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/audit_log.dart';

/// Audit log — super-admin only, online-first, no drift cache.
class AuditRepository {
  const AuditRepository(this._dio);

  final Dio _dio;

  Future<List<AuditLog>> getLogs({int page = 1}) async {
    try {
      final res =
          await _dio.get('/audit-logs', queryParameters: {'page': page});
      final data = unwrapData(res.data as Map<String, dynamic>);
      return (data as List)
          .map((j) => AuditLog.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final auditRepositoryProvider = Provider<AuditRepository>((ref) {
  return AuditRepository(ref.read(dioProvider));
});
