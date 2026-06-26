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
  IntColumn get floor => integer().nullable()();
  TextColumn get baseRent => text()();
  BoolColumn get meterAttached => boolean()();
  TextColumn get meterNumber => text().nullable()();
  TextColumn get status => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();

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
  TextColumn get advanceAmount => text()();
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

@DriftDatabase(tables: [CachedHouses, CachedRooms, CachedRenters])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(cachedRooms);
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
