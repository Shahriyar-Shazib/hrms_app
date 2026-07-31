import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/collection.dart';

class CollectionRepository {
  const CollectionRepository(this._dio);

  final Dio _dio;

  /// Fetches the collection preview (outstanding invoices + open dues) for a
  /// renter — one invoice per room (a renter may hold several).  Online-only
  /// — never cached.  Throws [ApiException] on any error.  [roomIds], when
  /// given, restricts the preview to just those rooms.
  Future<CollectionPreview> getPreview(
    String houseId,
    String renterId, {
    List<String>? roomIds,
  }) async {
    try {
      final res = await _dio.get(
        '/houses/$houseId/renters/$renterId/collection-preview',
        queryParameters: roomIds != null ? {'room_ids': roomIds} : null,
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
  /// [roomIds], when given, restricts auto-allocation to just those rooms —
  /// lets staff pay for one of a multi-room renter's rooms without touching
  /// the others.
  Future<CollectResult> collect(
    String houseId,
    String renterId, {
    required String amount,
    required String paymentMethod,
    String? reference,
    String? notes,
    List<String>? roomIds,
  }) async {
    final body = <String, dynamic>{
      'amount': amount,
      'payment_method': paymentMethod,
    };
    if (reference != null && reference.isNotEmpty) body['reference'] = reference;
    if (notes != null && notes.isNotEmpty) body['notes'] = notes;
    if (roomIds != null) body['room_ids'] = roomIds;

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
