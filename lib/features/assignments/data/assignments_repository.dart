import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/dio_client.dart';
import '../../renters/data/renters_repository.dart';
import '../../rooms/data/rooms_repository.dart';

class AssignmentsRepository {
  const AssignmentsRepository(this._dio, this._rentersRepo, this._roomsRepo);

  final Dio _dio;
  final RentersRepository _rentersRepo;
  final RoomsRepository _roomsRepo;

  /// Assign an unassigned renter to a vacant room.
  Future<void> assign(
    String houseId,
    String renterId, {
    required String roomId,
    required String moveInDate,
    String? moveInMeterReading,
  }) async {
    try {
      final body = <String, dynamic>{
        'room_id': roomId,
        'move_in_date': moveInDate,
      };
      if (moveInMeterReading != null && moveInMeterReading.isNotEmpty) {
        body['move_in_meter_reading'] = moveInMeterReading;
      }
      await _dio.post(
        '/houses/$houseId/renters/$renterId/assign',
        data: body,
      );
      await _refreshBoth(houseId, renterId);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// Transfer an assigned renter to a different room.
  /// NOTE: API uses `transfer_date`, not `move_in_date`.
  Future<void> transfer(
    String houseId,
    String renterId, {
    required String roomId,
    required String transferDate,
  }) async {
    try {
      await _dio.post(
        '/houses/$houseId/renters/$renterId/transfer',
        data: {'room_id': roomId, 'transfer_date': transferDate},
      );
      await _refreshBoth(houseId, renterId);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// End an active tenancy.
  /// reason must be "MOVED_OUT" or "EVICTED" (not "TRANSFER" — set by server).
  /// API field is `reason`, NOT `move_out_reason`.
  Future<void> moveOut(
    String houseId,
    String renterId, {
    required String moveOutDate,
    required String reason,
  }) async {
    try {
      await _dio.post(
        '/houses/$houseId/renters/$renterId/move-out',
        data: {'move_out_date': moveOutDate, 'reason': reason},
      );
      await _refreshBoth(houseId, renterId);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// Refresh both caches after any assignment mutation so the room's
  /// status/current_renter and the renter's currentAssignment update atomically.
  Future<void> _refreshBoth(String houseId, String renterId) async {
    await Future.wait([
      _rentersRepo.getOne(houseId, renterId),
      _roomsRepo.getByHouse(houseId),
    ]);
  }
}

final assignmentsRepositoryProvider = Provider<AssignmentsRepository>((ref) {
  return AssignmentsRepository(
    ref.read(dioProvider),
    ref.read(rentersRepositoryProvider),
    ref.read(roomsRepositoryProvider),
  );
});
