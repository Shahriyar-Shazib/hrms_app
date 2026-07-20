import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// dart.library.html is defined in browser builds; fall back to native.
import 'connection/connection_native.dart'
    if (dart.library.html) 'connection/connection_web.dart';

part 'database.g.dart';

// ─── Tables ──────────────────────────────────────────────────────────────────

class CachedHouses extends Table {
  TextColumn get id => text()();
  TextColumn get ownerId => text()();
  TextColumn get name => text()();
  TextColumn get address => text().nullable()();
  TextColumn get city => text().nullable()();
  IntColumn get totalFloors => integer().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class CachedRooms extends Table {
  TextColumn get id => text()();
  TextColumn get houseId => text()();
  TextColumn get roomNumber => text()();
  TextColumn get floor => text().nullable()();
  TextColumn get baseRent => text()();
  BoolColumn get meterAttached => boolean()();
  TextColumn get meterNumber => text().nullable()();
  TextColumn get status => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  // Populated only after a detail fetch; list fetches leave this untouched.
  TextColumn get currentRenterJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class CachedBillConfigs extends Table {
  TextColumn get id => text()();
  TextColumn get houseId => text()();
  TextColumn get head => text()();
  TextColumn get label => text()();
  TextColumn get amount => text()();
  BoolColumn get isActive => boolean()();
  TextColumn get effectiveFrom => text()();
  TextColumn get effectiveTo => text().nullable()();
  TextColumn get createdBy => text()();
  TextColumn get createdAt => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class CachedRenters extends Table {
  TextColumn get id => text()();
  TextColumn get houseId => text()();
  TextColumn get fullName => text()();
  TextColumn get mobile => text()();
  TextColumn get nidNumber => text().nullable()();
  TextColumn get photoUrl => text().nullable()();
  TextColumn get nidPhotoUrl => text().nullable()();
  TextColumn get presentAddress => text().nullable()();
  TextColumn get permanentAddress => text().nullable()();
  TextColumn get occupation => text().nullable()();
  TextColumn get organization => text().nullable()();
  TextColumn get emergencyContactName => text().nullable()();
  TextColumn get emergencyContactMobile => text().nullable()();
  TextColumn get advanceAmount => text().nullable()();
  TextColumn get status => text()();
  TextColumn get createdBy => text()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  // Nullable JSON blob; populated only after a detail fetch.
  TextColumn get currentAssignmentJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ─── Database ─────────────────────────────────────────────────────────────────

@DriftDatabase(tables: [CachedHouses, CachedRooms, CachedBillConfigs, CachedRenters])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 6;

  /// Security: wipe every cached table (drift is on-disk, so it survives a
  /// logout otherwise). Called on logout AND on account switch so one user's
  /// cached data — especially a SUPER_ADMIN's cross-owner houses — can never
  /// bleed into the next user's session. Does NOT touch secure storage
  /// (tokens / Remember Me live there, handled separately).
  Future<void> wipeAllData() async {
    await transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(cachedRooms);
            await m.createTable(cachedRenters);
          }
          if (from < 3) {
            await m.addColumn(cachedRooms, cachedRooms.currentRenterJson);
          }
          if (from < 4) {
            await m.createTable(cachedBillConfigs);
          }
          if (from < 5) {
            // floor changed from INTEGER to TEXT (string like "Ground" or "2").
            await m.drop(cachedRooms);
            await m.createTable(cachedRooms);
          }
          if (from < 6) {
            // advanceAmount made nullable (API returns null when not set).
            await m.drop(cachedRenters);
            await m.createTable(cachedRenters);
          }
        },
      );
}

// ─── Provider ─────────────────────────────────────────────────────────────────

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
