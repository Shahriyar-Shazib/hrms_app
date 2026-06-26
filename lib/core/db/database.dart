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

// ─── Database ─────────────────────────────────────────────────────────────────

@DriftDatabase(tables: [CachedHouses])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}

// ─── Provider ─────────────────────────────────────────────────────────────────

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
