import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/reports.dart';

/// Reports — per-house read-only dashboards. Online-first, no drift cache.
class ReportsRepository {
  const ReportsRepository(this._dio);

  final Dio _dio;

  Future<PnlReport> getPnl(
    String houseId, {
    required int year,
    required int month,
  }) async {
    try {
      final res = await _dio.get(
        '/houses/$houseId/reports/pnl',
        queryParameters: <String, dynamic>{'year': year, 'month': month},
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return PnlReport.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<OccupancyReport> getOccupancy(String houseId) async {
    try {
      final res = await _dio.get('/houses/$houseId/reports/occupancy');
      final data = unwrapData(res.data as Map<String, dynamic>);
      return OccupancyReport.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<DuesAgingReport> getDuesAging(String houseId) async {
    try {
      final res = await _dio.get('/houses/$houseId/reports/dues-aging');
      final data = unwrapData(res.data as Map<String, dynamic>);
      return DuesAgingReport.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final reportsRepositoryProvider = Provider<ReportsRepository>((ref) {
  return ReportsRepository(ref.read(dioProvider));
});
