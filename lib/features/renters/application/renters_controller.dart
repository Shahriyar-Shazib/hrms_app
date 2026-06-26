import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/renters_repository.dart';
import '../data/models/renter.dart';

final rentersControllerProvider = StreamProvider.autoDispose
    .family<List<Renter>, String>((ref, houseId) {
  final repo = ref.watch(rentersRepositoryProvider);
  () async {
    try {
      await repo.getByHouse(houseId);
    } catch (_) {}
  }();
  return repo.watchByHouse(houseId);
});

// ─── Detail provider ─────────────────────────────────────────────────────────

final renterDetailProvider = StreamProvider.autoDispose
    .family<Renter?, (String, String)>((ref, params) {
  final (houseId, renterId) = params;
  final repo = ref.watch(rentersRepositoryProvider);
  () async {
    try {
      await repo.getOne(houseId, renterId);
    } catch (_) {}
  }();
  return repo.watchOne(renterId);
});
