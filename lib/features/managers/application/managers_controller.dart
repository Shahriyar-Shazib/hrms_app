import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/managers_repository.dart';
import '../data/models/manager.dart';

final managersProvider =
    FutureProvider.autoDispose<List<Manager>>((ref) async {
  return ref.watch(managersRepositoryProvider).getManagers();
});

final houseManagersProvider = FutureProvider.autoDispose
    .family<List<HouseManagerAssignment>, String>((ref, houseId) async {
  return ref.watch(managersRepositoryProvider).getHouseManagers(houseId);
});
