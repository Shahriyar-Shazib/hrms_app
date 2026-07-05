import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports.freezed.dart';
part 'reports.g.dart';

@freezed
abstract class PnlPeriod with _$PnlPeriod {
  const factory PnlPeriod({
    required int year,
    required int month,
  }) = _PnlPeriod;

  factory PnlPeriod.fromJson(Map<String, dynamic> json) =>
      _$PnlPeriodFromJson(json);
}

@freezed
abstract class PnlBilled with _$PnlBilled {
  const factory PnlBilled({
    @JsonKey(name: 'invoices_total') required String invoicesTotal,
    required String rent,
    required String electricity,
    required String bills,
    @JsonKey(name: 'manual_dues') required String manualDues,
    required String total,
  }) = _PnlBilled;

  factory PnlBilled.fromJson(Map<String, dynamic> json) =>
      _$PnlBilledFromJson(json);
}

@freezed
abstract class PnlCollected with _$PnlCollected {
  const factory PnlCollected({
    required String total,
  }) = _PnlCollected;

  factory PnlCollected.fromJson(Map<String, dynamic> json) =>
      _$PnlCollectedFromJson(json);
}

@freezed
abstract class PnlExpenses with _$PnlExpenses {
  const factory PnlExpenses({
    @JsonKey(name: 'by_category') required Map<String, String> byCategory,
    required String total,
  }) = _PnlExpenses;

  factory PnlExpenses.fromJson(Map<String, dynamic> json) =>
      _$PnlExpensesFromJson(json);
}

@freezed
abstract class PnlReport with _$PnlReport {
  const factory PnlReport({
    required PnlPeriod period,
    required PnlBilled billed,
    required PnlCollected collected,
    required PnlExpenses expenses,
    @JsonKey(name: 'net_billed') required String netBilled,
    @JsonKey(name: 'net_collected') required String netCollected,
    @JsonKey(name: 'collection_gap') required String collectionGap,
  }) = _PnlReport;

  factory PnlReport.fromJson(Map<String, dynamic> json) =>
      _$PnlReportFromJson(json);
}

@freezed
abstract class OccupancyReport with _$OccupancyReport {
  const factory OccupancyReport({
    @JsonKey(name: 'total_rooms') required int totalRooms,
    required int occupied,
    required int vacant,
    @JsonKey(name: 'occupancy_rate') required String occupancyRate,
  }) = _OccupancyReport;

  factory OccupancyReport.fromJson(Map<String, dynamic> json) =>
      _$OccupancyReportFromJson(json);
}

@freezed
abstract class AgingBucket with _$AgingBucket {
  const factory AgingBucket({
    required int count,
    required String total,
  }) = _AgingBucket;

  factory AgingBucket.fromJson(Map<String, dynamic> json) =>
      _$AgingBucketFromJson(json);
}

@freezed
abstract class DuesBuckets with _$DuesBuckets {
  const factory DuesBuckets({
    @JsonKey(name: '0_30') required AgingBucket bucket0_30,
    @JsonKey(name: '31_60') required AgingBucket bucket31_60,
    @JsonKey(name: '61_90') required AgingBucket bucket61_90,
    @JsonKey(name: '90_plus') required AgingBucket bucket90Plus,
  }) = _DuesBuckets;

  factory DuesBuckets.fromJson(Map<String, dynamic> json) =>
      _$DuesBucketsFromJson(json);
}

@freezed
abstract class DuesAgingReport with _$DuesAgingReport {
  const factory DuesAgingReport({
    required DuesBuckets buckets,
    @JsonKey(name: 'total_outstanding') required String totalOutstanding,
  }) = _DuesAgingReport;

  factory DuesAgingReport.fromJson(Map<String, dynamic> json) =>
      _$DuesAgingReportFromJson(json);
}
