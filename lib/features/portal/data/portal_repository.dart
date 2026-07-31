import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/renter_ledger.dart';
import 'models/renter_profile.dart';

/// Renter self-service portal — RENTER role only, online-only (no drift
/// cache). Endpoints are NOT house-scoped (no `houses/{id}/` prefix); the
/// server derives the caller's own renter profile(s) from the auth token.
class PortalRepository {
  const PortalRepository(this._dio);

  final Dio _dio;

  /// GET /me/renter-profiles — normally exactly one entry; more than one
  /// only if the same person has rented across multiple houses/times.
  Future<List<RenterProfile>> getMyRenterProfiles() async {
    try {
      final res = await _dio.get('/me/renter-profiles');
      final data = unwrapData(res.data as Map<String, dynamic>);
      return (data as List)
          .map((j) => RenterProfile.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<RenterLedger> getMyLedger(String renterId) async {
    try {
      final res = await _dio.get('/me/renter-profiles/$renterId/ledger');
      final data = unwrapData(res.data as Map<String, dynamic>);
      return RenterLedger.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final portalRepositoryProvider = Provider<PortalRepository>((ref) {
  return PortalRepository(ref.read(dioProvider));
});
