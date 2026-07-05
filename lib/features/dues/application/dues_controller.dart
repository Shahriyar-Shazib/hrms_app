import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dues_repository.dart';
import '../data/models/due.dart';

final duesProvider = FutureProvider.autoDispose
    .family<List<Due>, (String, String)>((ref, params) async {
  final (houseId, renterId) = params;
  return ref.read(duesRepositoryProvider).getByRenter(houseId, renterId);
});
