import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/renter_ledger.dart';
import '../data/models/renter_profile.dart';
import '../data/portal_repository.dart';

/// The logged-in renter's own profile(s) — see [PortalRepository.getMyRenterProfiles].
final myRenterProfilesProvider =
    FutureProvider.autoDispose<List<RenterProfile>>((ref) {
  return ref.watch(portalRepositoryProvider).getMyRenterProfiles();
});

/// The logged-in renter's own ledger for one of their profiles, keyed by
/// renterId so switching between profiles (rare multi-house case) caches
/// each one separately.
final myLedgerProvider =
    FutureProvider.autoDispose.family<RenterLedger, String>((ref, renterId) {
  return ref.watch(portalRepositoryProvider).getMyLedger(renterId);
});
