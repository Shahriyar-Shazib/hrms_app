import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/rooms_repository.dart';
import '../data/models/room.dart';

final roomsControllerProvider = StreamProvider.autoDispose
    .family<List<Room>, String>((ref, houseId) {
  final repo = ref.watch(roomsRepositoryProvider);
  () async {
    try {
      await repo.getByHouse(houseId);
    } catch (_) {}
  }();
  return repo.watchByHouse(houseId);
});

// ─── Detail provider ─────────────────────────────────────────────────────────

final roomDetailProvider = StreamProvider.autoDispose
    .family<Room?, (String, String)>((ref, params) {
  final (houseId, roomId) = params;
  final repo = ref.watch(roomsRepositoryProvider);
  () async {
    try {
      await repo.getOne(houseId, roomId);
    } catch (_) {}
  }();
  return repo.watchOne(roomId);
});
