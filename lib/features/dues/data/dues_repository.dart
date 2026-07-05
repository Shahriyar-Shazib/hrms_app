import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/due.dart';

/// Dues — per-renter, online-first (no drift cache). Money-mutating
/// (add/waive) are server-authoritative: the server may reject a waive
/// (e.g. DUE_NOT_WAIVABLE if already PAID/WAIVED).
class DuesRepository {
  const DuesRepository(this._dio);

  final Dio _dio;

  Future<List<Due>> getByRenter(String houseId, String renterId) async {
    try {
      final res = await _dio.get(
        '/houses/$houseId/renters/$renterId/dues',
        queryParameters: {'page': 1},
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return (data as List)
          .map((j) => Due.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Due> addDue(
    String houseId,
    String renterId, {
    required String head,
    required String headLabel,
    required String amount,
    required String dueDate,
    required String reason,
  }) async {
    try {
      final res = await _dio.post(
        '/houses/$houseId/renters/$renterId/dues',
        data: <String, dynamic>{
          'head': head,
          'head_label': headLabel,
          'amount': amount,
          'due_date': dueDate,
          'reason': reason,
        },
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return Due.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<void> waiveDue(
    String houseId,
    String dueId, {
    required String waiveReason,
  }) async {
    try {
      final res = await _dio.post(
        '/houses/$houseId/dues/$dueId/waive',
        data: <String, dynamic>{'waive_reason': waiveReason},
      );
      unwrapData(res.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final duesRepositoryProvider = Provider<DuesRepository>((ref) {
  return DuesRepository(ref.read(dioProvider));
});
