import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/meter_reading.dart';

class MeterReadingsRepository {
  const MeterReadingsRepository(this._dio);

  final Dio _dio;

  Future<List<MeterReading>> getByRoom(String houseId, String roomId) async {
    try {
      final res = await _dio.get(
        '/houses/$houseId/rooms/$roomId/meter-readings',
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      final readings = (data as List)
          .map((j) => MeterReading.fromJson(j as Map<String, dynamic>))
          .toList();
      // Newest first by reading_date descending.
      readings.sort((a, b) => b.readingDate.compareTo(a.readingDate));
      return readings;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// POST a new meter reading.
  ///
  /// [previousReading] is sent ONLY for the room's first ever reading.
  /// All computed fields (units_consumed, rate_snapshot, computed_amount,
  /// reading_type) are server-generated — never submitted.
  Future<MeterReading> addReading(
    String houseId,
    String roomId, {
    required String currentReading,
    required String readingDate,
    required int billingPeriodYear,
    required int billingPeriodMonth,
    String? previousReading,
  }) async {
    try {
      final body = <String, dynamic>{
        'current_reading': currentReading,
        'reading_date': readingDate,
        'billing_period_year': billingPeriodYear,
        'billing_period_month': billingPeriodMonth,
      };
      if (previousReading != null && previousReading.isNotEmpty) {
        body['previous_reading'] = previousReading;
      }
      final res = await _dio.post(
        '/houses/$houseId/rooms/$roomId/meter-readings',
        data: body,
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return MeterReading.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
  /// POST an adjustment to an existing NORMAL reading.
  ///
  /// [rateOverride] is omitted from the body when null/empty so the server
  /// uses the snapshot rate from the original reading's period.
  Future<MeterReading> adjustReading(
    String houseId,
    String roomId, {
    required String adjustsReadingId,
    required String currentReading,
    required String readingDate,
    String? rateOverride,
  }) async {
    try {
      final body = <String, dynamic>{
        'adjusts_reading_id': adjustsReadingId,
        'current_reading': currentReading,
        'reading_date': readingDate,
      };
      if (rateOverride != null && rateOverride.isNotEmpty) {
        body['rate_override'] = rateOverride;
      }
      final res = await _dio.post(
        '/houses/$houseId/rooms/$roomId/meter-readings/adjust',
        data: body,
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return MeterReading.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final meterReadingsRepositoryProvider =
    Provider<MeterReadingsRepository>((ref) {
  return MeterReadingsRepository(ref.read(dioProvider));
});
