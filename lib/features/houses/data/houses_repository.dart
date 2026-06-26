import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/api/dio_client.dart';
import '../../../core/db/database.dart';
import 'models/house.dart';

class HousesRepository {
  const HousesRepository(this._dio, this._db);

  final Dio _dio;
  final AppDatabase _db;

  // ─── Stream (cache) ──────────────────────────────────────────────────────

  Stream<List<House>> watchHouses() {
    return (_db.select(_db.cachedHouses)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .watch()
        .map((rows) => rows.map(_rowToHouse).toList());
  }

  Stream<House?> watchHouse(String id) {
    return (_db.select(_db.cachedHouses)..where((t) => t.id.equals(id)))
        .watchSingleOrNull()
        .map((row) => row == null ? null : _rowToHouse(row));
  }

  // ─── Network ─────────────────────────────────────────────────────────────

  /// Fetches all houses from the API and upserts them into the drift cache.
  /// Throws [ApiException] on server errors, [DioException] on network errors.
  Future<List<House>> getHouses() async {
    try {
      final res = await _dio.get('/houses');
      final data = unwrapData(res.data as Map<String, dynamic>);
      final houses = (data as List)
          .map((j) => House.fromJson(j as Map<String, dynamic>))
          .toList();
      await _upsertHouses(houses);
      return houses;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// Fetches a single house by id from the API and upserts it into drift.
  Future<House> getHouse(String id) async {
    try {
      final res = await _dio.get('/houses/$id');
      final data = unwrapData(res.data as Map<String, dynamic>);
      final house = House.fromJson(data as Map<String, dynamic>);
      await _upsertHouses([house]);
      return house;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  // ─── Internal ────────────────────────────────────────────────────────────

  Future<void> _upsertHouses(List<House> houses) async {
    await _db.batch((batch) {
      for (final h in houses) {
        batch.insert(
          _db.cachedHouses,
          _toCompanion(h),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  CachedHousesCompanion _toCompanion(House h) => CachedHousesCompanion(
        id: Value(h.id),
        ownerId: Value(h.ownerId),
        name: Value(h.name),
        address: Value(h.address),
        city: Value(h.city),
        totalFloors: Value(h.totalFloors),
        notes: Value(h.notes),
        createdAt: Value(h.createdAt),
        updatedAt: Value(h.updatedAt),
      );

  House _rowToHouse(CachedHouse row) => House(
        id: row.id,
        ownerId: row.ownerId,
        name: row.name,
        address: row.address,
        city: row.city,
        totalFloors: row.totalFloors,
        notes: row.notes,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
      );
}

final housesRepositoryProvider = Provider<HousesRepository>((ref) {
  return HousesRepository(
    ref.read(dioProvider),
    ref.read(appDatabaseProvider),
  );
});
