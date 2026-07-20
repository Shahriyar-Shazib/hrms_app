import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/owner.dart';

/// Owner management — SUPER_ADMIN only, online-only (no drift cache).
class OwnersRepository {
  const OwnersRepository(this._dio);

  final Dio _dio;

  Future<List<Owner>> list({String? status, String? search}) async {
    try {
      final res = await _dio.get('/owners', queryParameters: {
        if (status != null && status.isNotEmpty) 'status': status,
        if (search != null && search.isNotEmpty) 'search': search,
      });
      final data = unwrapData(res.data as Map<String, dynamic>);
      return (data as List)
          .map((j) => Owner.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Owner> create({
    required String email,
    required String password,
    required String fullName,
    String? mobile,
  }) async {
    try {
      final res = await _dio.post('/owners', data: {
        'email': email,
        'password': password,
        'full_name': fullName,
        if (mobile != null && mobile.isNotEmpty) 'mobile': mobile,
      });
      final data = unwrapData(res.data as Map<String, dynamic>);
      return Owner.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Owner> show(String id) async {
    try {
      final res = await _dio.get('/owners/$id');
      final data = unwrapData(res.data as Map<String, dynamic>);
      return Owner.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// PATCH /owners/{id}/status — only ACTIVE|SUSPENDED (server rejects others).
  Future<Owner> updateStatus(String id, String status) async {
    try {
      final res =
          await _dio.patch('/owners/$id/status', data: {'status': status});
      final data = unwrapData(res.data as Map<String, dynamic>);
      return Owner.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// DELETE /owners/{id} — soft delete; 422 OWNER_HAS_HOUSES if it still owns
  /// houses (surfaced to the caller as an ApiException with that code).
  Future<void> delete(String id) async {
    try {
      await _dio.delete('/owners/$id');
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final ownersRepositoryProvider = Provider<OwnersRepository>((ref) {
  return OwnersRepository(ref.read(dioProvider));
});
