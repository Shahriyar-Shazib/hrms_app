import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import '../../../core/db/database.dart';
import 'models/bill_config.dart';

class BillConfigsRepository {
  const BillConfigsRepository(this._dio, this._db);

  final Dio _dio;
  final AppDatabase _db;

  // ─── Stream (cache) ──────────────────────────────────────────────────────

  Stream<List<BillConfig>> watchByHouse(String houseId) {
    return (_db.select(_db.cachedBillConfigs)
          ..where((t) => t.houseId.equals(houseId))
          ..orderBy([(t) => OrderingTerm.asc(t.head)]))
        .watch()
        .map((rows) => rows.map(_rowToConfig).toList());
  }

  // ─── Network ─────────────────────────────────────────────────────────────

  /// Fetches active configs and REPLACES the cached set for this house
  /// so stale/replaced heads don't linger.
  Future<List<BillConfig>> getCurrent(String houseId) async {
    try {
      final res =
          await _dio.get('/houses/$houseId/bill-configs/current');
      final data = unwrapData(res.data as Map<String, dynamic>);
      final configs = (data as List)
          .map((j) => BillConfig.fromJson(j as Map<String, dynamic>))
          .toList();
      await _db.transaction(() async {
        await (_db.delete(_db.cachedBillConfigs)
              ..where((t) => t.houseId.equals(houseId)))
            .go();
        await _db.batch((batch) {
          for (final c in configs) {
            batch.insert(_db.cachedBillConfigs, _toCompanion(c));
          }
        });
      });
      return configs;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  /// Posts a new bill config head, then refreshes the full current list.
  /// Propagates ApiException so the form can display VALIDATION_FAILED details.
  Future<BillConfig> addConfig(
    String houseId, {
    required String head,
    required String label,
    required String amount,
    required String effectiveFrom,
  }) async {
    try {
      final res = await _dio.post(
        '/houses/$houseId/bill-configs',
        data: <String, dynamic>{
          'head': head,
          'label': label,
          'amount': amount,
          'effective_from': effectiveFrom,
        },
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      final config = BillConfig.fromJson(data as Map<String, dynamic>);
      await getCurrent(houseId);
      return config;
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  // ─── Internal ────────────────────────────────────────────────────────────

  CachedBillConfigsCompanion _toCompanion(BillConfig c) =>
      CachedBillConfigsCompanion(
        id: Value(c.id),
        houseId: Value(c.houseId),
        head: Value(c.head),
        label: Value(c.label),
        amount: Value(c.amount),
        isActive: Value(c.isActive),
        effectiveFrom: Value(c.effectiveFrom),
        effectiveTo: Value(c.effectiveTo),
        createdBy: Value(c.createdBy),
        createdAt: Value(c.createdAt),
      );

  BillConfig _rowToConfig(CachedBillConfig row) => BillConfig(
        id: row.id,
        houseId: row.houseId,
        head: row.head,
        label: row.label,
        amount: row.amount,
        isActive: row.isActive,
        effectiveFrom: row.effectiveFrom,
        effectiveTo: row.effectiveTo,
        createdBy: row.createdBy,
        createdAt: row.createdAt,
      );
}

final billConfigsRepositoryProvider = Provider<BillConfigsRepository>((ref) {
  return BillConfigsRepository(
    ref.read(dioProvider),
    ref.read(appDatabaseProvider),
  );
});
