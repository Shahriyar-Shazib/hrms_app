import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/invoice.dart';

/// Invoices — per-house, online-first (no drift cache). Generation is a
/// money-creating action: server-authoritative, idempotent per house+month.
class InvoicesRepository {
  const InvoicesRepository(this._dio);

  final Dio _dio;

  Future<List<Invoice>> getByHouse(
    String houseId, {
    int? year,
    int? month,
    String? status,
    String? renterId,
  }) async {
    try {
      final res = await _dio.get(
        '/houses/$houseId/invoices',
        queryParameters: <String, dynamic>{
          if (year != null) 'year': year,
          if (month != null) 'month': month,
          if (status != null) 'status': status,
          if (renterId != null) 'renter_id': renterId,
        },
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return (data as List)
          .map((j) => Invoice.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Invoice> getOne(String houseId, String invoiceId) async {
    try {
      final res = await _dio.get('/houses/$houseId/invoices/$invoiceId');
      final data = unwrapData(res.data as Map<String, dynamic>);
      return Invoice.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// Idempotent per house+month: if invoices for that month already exist,
  /// the server returns them (`already_generated: true`) and creates
  /// nothing new. Otherwise generates invoices for occupied rooms AND closes
  /// prior unpaid invoices into dues — only treat as done after a 2xx.
  Future<GenerateResult> generate(
    String houseId, {
    required int year,
    required int month,
    List<String>? billHeads,
    bool? includeElectricity,
  }) async {
    try {
      final res = await _dio.post(
        '/houses/$houseId/invoices/generate',
        data: <String, dynamic>{
          'year': year,
          'month': month,
          if (billHeads != null && billHeads.isNotEmpty)
            'bill_heads': billHeads,
          if (includeElectricity != null)
            'include_electricity': includeElectricity,
        },
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return GenerateResult.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final invoicesRepositoryProvider = Provider<InvoicesRepository>((ref) {
  return InvoicesRepository(ref.read(dioProvider));
});
