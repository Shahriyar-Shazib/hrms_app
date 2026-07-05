import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/reports.dart';
import '../data/reports_repository.dart';

typedef PnlQuery = ({String houseId, int year, int month});

final pnlProvider =
    FutureProvider.autoDispose.family<PnlReport, PnlQuery>((ref, query) async {
  return ref.read(reportsRepositoryProvider).getPnl(
        query.houseId,
        year: query.year,
        month: query.month,
      );
});

final occupancyProvider = FutureProvider.autoDispose
    .family<OccupancyReport, String>((ref, houseId) async {
  return ref.read(reportsRepositoryProvider).getOccupancy(houseId);
});

final duesAgingProvider = FutureProvider.autoDispose
    .family<DuesAgingReport, String>((ref, houseId) async {
  return ref.read(reportsRepositoryProvider).getDuesAging(houseId);
});
