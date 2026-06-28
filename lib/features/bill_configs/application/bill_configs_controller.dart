import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/bill_configs_repository.dart';
import '../data/models/bill_config.dart';

final billConfigsProvider = StreamProvider.autoDispose
    .family<List<BillConfig>, String>((ref, houseId) {
  final repo = ref.watch(billConfigsRepositoryProvider);
  () async {
    try {
      await repo.getCurrent(houseId);
    } catch (_) {}
  }();
  return repo.watchByHouse(houseId);
});
