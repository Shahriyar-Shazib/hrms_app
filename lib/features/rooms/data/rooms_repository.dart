import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import '../../../core/db/database.dart';
import 'models/room.dart';

class RoomsRepository {
  const RoomsRepository(this._dio, this._db);

  final Dio _dio;
  final AppDatabase _db;

  // ─── Streams (cache) ─────────────────────────────────────────────────────

  Stream<List<Room>> watchByHouse(String houseId) {
    return (_db.select(_db.cachedRooms)
          ..where((t) => t.houseId.equals(houseId))
          ..orderBy([(t) => OrderingTerm.asc(t.roomNumber)]))
        .watch()
        .map((rows) => rows.map(_rowToRoom).toList());
  }

  Stream<Room?> watchOne(String id) {
    return (_db.select(_db.cachedRooms)..where((t) => t.id.equals(id)))
        .watchSingleOrNull()
        .map((row) => row == null ? null : _rowToRoom(row));
  }

  // ─── Network ─────────────────────────────────────────────────────────────

  Future<List<Room>> getByHouse(String houseId) async {
    try {
      final res = await _dio.get('/houses/$houseId/rooms');
      final data = unwrapData(res.data as Map<String, dynamic>);
      final rooms = (data as List)
          .map((j) => Room.fromJson(j as Map<String, dynamic>))
          .toList();
      await _upsertRooms(rooms);
      return rooms;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Room> getOne(String houseId, String roomId) async {
    try {
      final res = await _dio.get('/houses/$houseId/rooms/$roomId');
      final data = unwrapData(res.data as Map<String, dynamic>);
      final room = Room.fromJson(data as Map<String, dynamic>);
      await _upsertRoomDetail(room);
      return room;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  // ─── Internal ────────────────────────────────────────────────────────────

  /// List upsert — does NOT overwrite currentRenterJson.
  ///
  /// Uses ON CONFLICT DO UPDATE with a companion that omits currentRenterJson
  /// (Value.absent()), so Drift excludes that column from the UPDATE SET and
  /// any existing renter info from a prior detail fetch is preserved.
  Future<void> _upsertRooms(List<Room> rooms) async {
    await _db.batch((batch) {
      for (final r in rooms) {
        final c = _toListCompanion(r);
        batch.insert(
          _db.cachedRooms,
          c,
          onConflict: DoUpdate((_) => c),
        );
      }
    });
  }

  /// Detail upsert — writes currentRenterJson (may be null when vacant).
  Future<void> _upsertRoomDetail(Room room) async {
    await _db
        .into(_db.cachedRooms)
        .insertOnConflictUpdate(_toDetailCompanion(room));
  }

  /// Companion for list-endpoint rows: omits currentRenterJson so it is never
  /// cleared by a list refresh.
  CachedRoomsCompanion _toListCompanion(Room r) => CachedRoomsCompanion(
        id: Value(r.id),
        houseId: Value(r.houseId),
        roomNumber: Value(r.roomNumber),
        floor: Value(r.floor),
        baseRent: Value(r.baseRent),
        meterAttached: Value(r.meterAttached),
        meterNumber: Value(r.meterNumber),
        status: Value(r.status),
        notes: Value(r.notes),
        createdAt: Value(r.createdAt),
        updatedAt: Value(r.updatedAt),
        // currentRenterJson intentionally absent — preserved on conflict
      );

  /// Companion for detail-endpoint rows: writes currentRenterJson.
  CachedRoomsCompanion _toDetailCompanion(Room r) => CachedRoomsCompanion(
        id: Value(r.id),
        houseId: Value(r.houseId),
        roomNumber: Value(r.roomNumber),
        floor: Value(r.floor),
        baseRent: Value(r.baseRent),
        meterAttached: Value(r.meterAttached),
        meterNumber: Value(r.meterNumber),
        status: Value(r.status),
        notes: Value(r.notes),
        createdAt: Value(r.createdAt),
        updatedAt: Value(r.updatedAt),
        currentRenterJson: Value(
          r.currentRenter != null
              ? jsonEncode(r.currentRenter!.toJson())
              : null,
        ),
      );

  Room _rowToRoom(CachedRoom row) => Room(
        id: row.id,
        houseId: row.houseId,
        roomNumber: row.roomNumber,
        floor: row.floor,
        baseRent: row.baseRent,
        meterAttached: row.meterAttached,
        meterNumber: row.meterNumber,
        status: row.status,
        notes: row.notes,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        currentRenter: row.currentRenterJson != null
            ? CurrentRenter.fromJson(
                jsonDecode(row.currentRenterJson!) as Map<String, dynamic>)
            : null,
      );
}

final roomsRepositoryProvider = Provider<RoomsRepository>((ref) {
  return RoomsRepository(
    ref.read(dioProvider),
    ref.read(appDatabaseProvider),
  );
});
