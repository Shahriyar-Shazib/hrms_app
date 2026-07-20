import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/owners_repository.dart';
import '../data/models/owner.dart';

typedef OwnersFilter = ({String? status, String? search});

/// Owners list, filtered server-side by status/search. Keyed by the filter so
/// each combination caches separately; autoDispose frees it when unwatched.
final ownersListProvider =
    FutureProvider.autoDispose.family<List<Owner>, OwnersFilter>((ref, filter) {
  return ref
      .watch(ownersRepositoryProvider)
      .list(status: filter.status, search: filter.search);
});

/// A plain (unfiltered) owners list — used by the audit screen's owner filter
/// dropdown. Kept separate so the audit screen doesn't couple to the owners
/// screen's current filter state.
final allOwnersProvider = FutureProvider.autoDispose<List<Owner>>((ref) {
  return ref.watch(ownersRepositoryProvider).list();
});
