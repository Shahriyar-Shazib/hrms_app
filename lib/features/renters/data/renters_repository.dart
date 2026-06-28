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

  // ─── Network reads ────────────────────────────────────────────────────────

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
      await _upsertRenterDetail(renter);
      return renter;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  // ─── Network writes ───────────────────────────────────────────────────────

  Future<Renter> createRenter(
    String houseId, {
    required String fullName,
    required String mobile,
    String? nidNumber,
    String? presentAddress,
    String? permanentAddress,
    String? occupation,
    String? organization,
    String? emergencyContactName,
    String? emergencyContactMobile,
    String? advanceAmount,
  }) async {
    try {
      final body = _buildBody(
        fullName: fullName,
        mobile: mobile,
        nidNumber: nidNumber,
        presentAddress: presentAddress,
        permanentAddress: permanentAddress,
        occupation: occupation,
        organization: organization,
        emergencyContactName: emergencyContactName,
        emergencyContactMobile: emergencyContactMobile,
        advanceAmount: advanceAmount,
      );
      final res = await _dio.post('/houses/$houseId/renters', data: body);
      final data = unwrapData(res.data as Map<String, dynamic>);
      final renter = Renter.fromJson(data as Map<String, dynamic>);
      await _upsertRenters([renter]);
      return renter;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Renter> updateRenter(
    String houseId,
    String renterId, {
    required String fullName,
    required String mobile,
    String? nidNumber,
    String? presentAddress,
    String? permanentAddress,
    String? occupation,
    String? organization,
    String? emergencyContactName,
    String? emergencyContactMobile,
    String? advanceAmount,
  }) async {
    try {
      final body = _buildBody(
        fullName: fullName,
        mobile: mobile,
        nidNumber: nidNumber,
        presentAddress: presentAddress,
        permanentAddress: permanentAddress,
        occupation: occupation,
        organization: organization,
        emergencyContactName: emergencyContactName,
        emergencyContactMobile: emergencyContactMobile,
        advanceAmount: advanceAmount,
      );
      final res = await _dio.put(
        '/houses/$houseId/renters/$renterId',
        data: body,
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      final renter = Renter.fromJson(data as Map<String, dynamic>);
      await _upsertRenters([renter]);
      return renter;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Map<String, dynamic> _buildBody({
    required String fullName,
    required String mobile,
    String? nidNumber,
    String? presentAddress,
    String? permanentAddress,
    String? occupation,
    String? organization,
    String? emergencyContactName,
    String? emergencyContactMobile,
    String? advanceAmount,
  }) {
    final body = <String, dynamic>{
      'full_name': fullName,
      'mobile': mobile,
    };
    if (nidNumber != null && nidNumber.isNotEmpty) body['nid_number'] = nidNumber;
    if (presentAddress != null && presentAddress.isNotEmpty) body['present_address'] = presentAddress;
    if (permanentAddress != null && permanentAddress.isNotEmpty) body['permanent_address'] = permanentAddress;
    if (occupation != null && occupation.isNotEmpty) body['occupation'] = occupation;
    if (organization != null && organization.isNotEmpty) body['organization'] = organization;
    if (emergencyContactName != null && emergencyContactName.isNotEmpty) body['emergency_contact_name'] = emergencyContactName;
    if (emergencyContactMobile != null && emergencyContactMobile.isNotEmpty) body['emergency_contact_mobile'] = emergencyContactMobile;
    if (advanceAmount != null && advanceAmount.isNotEmpty) body['advance_amount'] = advanceAmount;
    return body;
  }

  // ─── Internal ─────────────────────────────────────────────────────────────

  /// List upsert — does NOT overwrite currentAssignmentJson.
  ///
  /// Uses DoUpdate with a companion that omits currentAssignmentJson
  /// (Value.absent()), so drift excludes that column from the UPDATE SET and
  /// any existing assignment info from a prior detail fetch is preserved.
  /// Also safe for create/update write responses that lack currentAssignment.
  Future<void> _upsertRenters(List<Renter> renters) async {
    await _db.batch((batch) {
      for (final r in renters) {
        final c = _toListCompanion(r);
        batch.insert(
          _db.cachedRenters,
          c,
          onConflict: DoUpdate((_) => c),
        );
      }
    });
  }

  /// Detail upsert — writes currentAssignmentJson (may be null when unassigned).
  Future<void> _upsertRenterDetail(Renter renter) async {
    await _db
        .into(_db.cachedRenters)
        .insertOnConflictUpdate(_toDetailCompanion(renter));
  }

  /// Companion for list/write responses: omits currentAssignmentJson so it is
  /// never cleared by a list refresh or a create/update response.
  CachedRentersCompanion _toListCompanion(Renter r) => CachedRentersCompanion(
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
        // currentAssignmentJson intentionally absent — preserved on conflict
      );

  /// Companion for detail-endpoint rows: writes currentAssignmentJson.
  CachedRentersCompanion _toDetailCompanion(Renter r) => CachedRentersCompanion(
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
