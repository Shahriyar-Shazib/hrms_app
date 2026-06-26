import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import '../../../core/db/database.dart';
import 'models/renter.dart';

class RentersRepository {
  const RentersRepository(this._dio, this._db);

  final Dio _dio;
  final AppDatabase _db;

  // ─── Streams (cache) ─────────────────────────────────────────────────────

  Stream<List<Renter>> watchByHouse(String houseId) {
    return (_db.select(_db.cachedRenters)
          ..where((t) => t.houseId.equals(houseId))
          ..orderBy([(t) => OrderingTerm.asc(t.fullName)]))
        .watch()
        .map((rows) => rows.map(_rowToRenter).toList());
  }

  Stream<Renter?> watchOne(String id) {
    return (_db.select(_db.cachedRenters)..where((t) => t.id.equals(id)))
        .watchSingleOrNull()
        .map((row) => row == null ? null : _rowToRenter(row));
  }

  // ─── Network ─────────────────────────────────────────────────────────────

  Future<List<Renter>> getByHouse(String houseId) async {
    try {
      final res = await _dio.get('/houses/$houseId/renters');
      final data = unwrapData(res.data as Map<String, dynamic>);
      final renters = (data as List)
          .map((j) => Renter.fromJson(j as Map<String, dynamic>))
          .toList();
      await _upsertRenters(renters);
      return renters;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Renter> getOne(String houseId, String renterId) async {
    try {
      final res = await _dio.get('/houses/$houseId/renters/$renterId');
      final data = unwrapData(res.data as Map<String, dynamic>);
      final renter = Renter.fromJson(data as Map<String, dynamic>);
      await _upsertRenters([renter]);
      return renter;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  // ─── Internal ────────────────────────────────────────────────────────────

  Future<void> _upsertRenters(List<Renter> renters) async {
    await _db.batch((batch) {
      for (final r in renters) {
        batch.insert(
          _db.cachedRenters,
          _toCompanion(r),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  CachedRentersCompanion _toCompanion(Renter r) => CachedRentersCompanion(
        id: Value(r.id),
        houseId: Value(r.houseId),
        fullName: Value(r.fullName),
        mobile: Value(r.mobile),
        nidNumber: Value(r.nidNumber),
        photoUrl: Value(r.photoUrl),
        nidPhotoUrl: Value(r.nidPhotoUrl),
        presentAddress: Value(r.presentAddress),
        permanentAddress: Value(r.permanentAddress),
        occupation: Value(r.occupation),
        organization: Value(r.organization),
        emergencyContactName: Value(r.emergencyContactName),
        emergencyContactMobile: Value(r.emergencyContactMobile),
        advanceAmount: Value(r.advanceAmount),
        status: Value(r.status),
        createdBy: Value(r.createdBy),
        createdAt: Value(r.createdAt),
        updatedAt: Value(r.updatedAt),
        currentAssignmentJson: Value(
          r.currentAssignment != null
              ? jsonEncode(r.currentAssignment!.toJson())
              : null,
        ),
      );

  Renter _rowToRenter(CachedRenter row) => Renter(
        id: row.id,
        houseId: row.houseId,
        fullName: row.fullName,
        mobile: row.mobile,
        nidNumber: row.nidNumber,
        photoUrl: row.photoUrl,
        nidPhotoUrl: row.nidPhotoUrl,
        presentAddress: row.presentAddress,
        permanentAddress: row.permanentAddress,
        occupation: row.occupation,
        organization: row.organization,
        emergencyContactName: row.emergencyContactName,
        emergencyContactMobile: row.emergencyContactMobile,
        advanceAmount: row.advanceAmount,
        status: row.status,
        createdBy: row.createdBy,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        currentAssignment: row.currentAssignmentJson != null
            ? CurrentAssignment.fromJson(
                jsonDecode(row.currentAssignmentJson!) as Map<String, dynamic>)
            : null,
      );
}

final rentersRepositoryProvider = Provider<RentersRepository>((ref) {
  return RentersRepository(
    ref.read(dioProvider),
    ref.read(appDatabaseProvider),
  );
});
