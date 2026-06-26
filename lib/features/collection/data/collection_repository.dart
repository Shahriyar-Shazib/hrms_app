import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/collection.dart';

class CollectionRepository {
  const CollectionRepository(this._dio);

  final Dio _dio;

  /// Fetches the collection preview (outstanding invoice + open dues) for a
  /// renter.  Online-only — never cached.  Throws [ApiException] on any error.
  Future<CollectionPreview> getPreview(
    String houseId,
    String renterId,
  ) async {
    try {
      final res = await _dio.get(
        '/houses/$houseId/renters/$renterId/collection-preview',
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return CollectionPreview.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// Posts a payment.  The server is authoritative — only treat as successful
  /// after a 2xx response.  Throws [ApiException] on error (including
  /// OVERPAYMENT_NOT_ALLOWED) and network errors (code = NETWORK_ERROR).
  ///
  /// [amount] is the validated user-entered string (e.g. "8500.00"), sent
  /// as-is.  The API accepts a numeric string; no float conversion is needed.
  Future<CollectResult> collect(
    String houseId,
    String renterId, {
    required String amount,
    required String paymentMethod,
    String? reference,
    String? notes,
  }) async {
    final body = <String, dynamic>{
      'amount': amount,
      'payment_method': paymentMethod,
    };
    if (reference != null && reference.isNotEmpty) body['reference'] = reference;
    if (notes != null && notes.isNotEmpty) body['notes'] = notes;

    try {
      final res = await _dio.post(
        '/houses/$houseId/renters/$renterId/collect',
        data: body,
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return CollectResult.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final collectionRepositoryProvider = Provider<CollectionRepository>((ref) {
  return CollectionRepository(ref.read(dioProvider));
});
