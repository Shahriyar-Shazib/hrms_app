import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/houses_repository.dart';
import '../data/models/house.dart';

class HousesController extends StreamNotifier<List<House>> {
  @override
  Stream<List<House>> build() {
    final repo = ref.read(housesRepositoryProvider);
    // Fire-and-forget: upserts into drift, stream auto-updates.
    // Surface error only when the cache is also empty.
    _backgroundFetch(repo);
    return repo.watchHouses();
  }

  Future<void> _backgroundFetch(HousesRepository repo) async {
    try {
      await repo.getHouses();
    } catch (e, st) {
      final isEmpty = state.asData?.value.isEmpty ?? true;
      if (isEmpty) state = AsyncValue.error(e, st);
    }
  }

  /// Called by pull-to-refresh. Throws on error so the caller can show a
  /// SnackBar; drift stream handles the state update on success.
  Future<void> refresh() => ref.read(housesRepositoryProvider).getHouses();
}

final housesControllerProvider =
    StreamNotifierProvider<HousesController, List<House>>(HousesController.new);

// ─── Detail provider ─────────────────────────────────────────────────────────

final houseDetailProvider =
    StreamProvider.autoDispose.family<House?, String>((ref, id) {
  final repo = ref.watch(housesRepositoryProvider);
  // Background refresh — cache still serves the UI if this fails.
  () async {
    try {
      await repo.getHouse(id);
    } catch (_) {}
  }();
  return repo.watchHouse(id);
});
