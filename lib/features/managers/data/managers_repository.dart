import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/manager.dart';

/// Managers — global user records plus per-house assignments.
/// Online-first (owner-only); no drift cache, never shown to managers.
class ManagersRepository {
  const ManagersRepository(this._dio);

  final Dio _dio;

  // ─── Global managers ─────────────────────────────────────────────────────

  Future<List<Manager>> getManagers() async {
    try {
      final res = await _dio.get('/managers', queryParameters: {'page': 1});
      final data = unwrapData(res.data as Map<String, dynamic>);
      return (data as List)
          .map((j) => Manager.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Manager> createManager({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final res = await _dio.post('/managers', data: <String, dynamic>{
        'full_name': fullName,
        'email': email,
        'password': password,
      });
      final data = unwrapData(res.data as Map<String, dynamic>);
      return Manager.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  // ─── Per-house assignments ───────────────────────────────────────────────

  Future<List<HouseManagerAssignment>> getHouseManagers(
      String houseId) async {
    try {
      final res = await _dio.get('/houses/$houseId/managers');
      final data = unwrapData(res.data as Map<String, dynamic>);
      return (data as List)
          .map((j) =>
              HouseManagerAssignment.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// The POST response does not include the nested `manager` object (only
  /// the GET list does), so the response body is not parsed — callers
  /// invalidate [houseManagersProvider] and refetch instead.
  Future<void> assignManager(
    String houseId, {
    required String managerId,
    required bool canLogExpenses,
  }) async {
    try {
      await _dio.post(
        '/houses/$houseId/managers',
        data: <String, dynamic>{
          'manager_id': managerId,
          'can_log_expenses': canLogExpenses,
        },
      );
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// [managerUserId] is the manager USER id, not the assignment id.
  /// The PATCH response does not include the nested `manager` object either,
  /// so the response body is not parsed — callers invalidate and refetch.
  Future<void> updateAssignment(
    String houseId,
    String managerUserId, {
    required bool canLogExpenses,
  }) async {
    try {
      await _dio.patch(
        '/houses/$houseId/managers/$managerUserId',
        data: <String, dynamic>{'can_log_expenses': canLogExpenses},
      );
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// [managerUserId] is the manager USER id, not the assignment id.
  Future<void> removeManager(String houseId, String managerUserId) async {
    try {
      await _dio.delete('/houses/$houseId/managers/$managerUserId');
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final managersRepositoryProvider = Provider<ManagersRepository>((ref) {
  return ManagersRepository(ref.read(dioProvider));
});
