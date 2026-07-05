// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PnlPeriod _$PnlPeriodFromJson(Map<String, dynamic> json) => _PnlPeriod(
  year: (json['year'] as num).toInt(),
  month: (json['month'] as num).toInt(),
);

Map<String, dynamic> _$PnlPeriodToJson(_PnlPeriod instance) =>
    <String, dynamic>{'year': instance.year, 'month': instance.month};

_PnlBilled _$PnlBilledFromJson(Map<String, dynamic> json) => _PnlBilled(
  invoicesTotal: json['invoices_total'] as String,
  rent: json['rent'] as String,
  electricity: json['electricity'] as String,
  bills: json['bills'] as String,
  manualDues: json['manual_dues'] as String,
  total: json['total'] as String,
);

Map<String, dynamic> _$PnlBilledToJson(_PnlBilled instance) =>
    <String, dynamic>{
      'invoices_total': instance.invoicesTotal,
      'rent': instance.rent,
      'electricity': instance.electricity,
      'bills': instance.bills,
      'manual_dues': instance.manualDues,
      'total': instance.total,
    };

_PnlCollected _$PnlCollectedFromJson(Map<String, dynamic> json) =>
    _PnlCollected(total: json['total'] as String);

Map<String, dynamic> _$PnlCollectedToJson(_PnlCollected instance) =>
    <String, dynamic>{'total': instance.total};

_PnlExpenses _$PnlExpensesFromJson(Map<String, dynamic> json) => _PnlExpenses(
  byCategory: Map<String, String>.from(json['by_category'] as Map),
  total: json['total'] as String,
);

Map<String, dynamic> _$PnlExpensesToJson(_PnlExpenses instance) =>
    <String, dynamic>{
      'by_category': instance.byCategory,
      'total': instance.total,
    };

_PnlReport _$PnlReportFromJson(Map<String, dynamic> json) => _PnlReport(
  period: PnlPeriod.fromJson(json['period'] as Map<String, dynamic>),
  billed: PnlBilled.fromJson(json['billed'] as Map<String, dynamic>),
  collected: PnlCollected.fromJson(json['collected'] as Map<String, dynamic>),
  expenses: PnlExpenses.fromJson(json['expenses'] as Map<String, dynamic>),
  netBilled: json['net_billed'] as String,
  netCollected: json['net_collected'] as String,
  collectionGap: json['collection_gap'] as String,
);

Map<String, dynamic> _$PnlReportToJson(_PnlReport instance) =>
    <String, dynamic>{
      'period': instance.period,
      'billed': instance.billed,
      'collected': instance.collected,
      'expenses': instance.expenses,
      'net_billed': instance.netBilled,
      'net_collected': instance.netCollected,
      'collection_gap': instance.collectionGap,
    };

_OccupancyReport _$OccupancyReportFromJson(Map<String, dynamic> json) =>
    _OccupancyReport(
      totalRooms: (json['total_rooms'] as num).toInt(),
      occupied: (json['occupied'] as num).toInt(),
      vacant: (json['vacant'] as num).toInt(),
      occupancyRate: json['occupancy_rate'] as String,
    );

Map<String, dynamic> _$OccupancyReportToJson(_OccupancyReport instance) =>
    <String, dynamic>{
      'total_rooms': instance.totalRooms,
      'occupied': instance.occupied,
      'vacant': instance.vacant,
      'occupancy_rate': instance.occupancyRate,
    };

_AgingBucket _$AgingBucketFromJson(Map<String, dynamic> json) => _AgingBucket(
  count: (json['count'] as num).toInt(),
  total: json['total'] as String,
);

Map<String, dynamic> _$AgingBucketToJson(_AgingBucket instance) =>
    <String, dynamic>{'count': instance.count, 'total': instance.total};

_DuesBuckets _$DuesBucketsFromJson(Map<String, dynamic> json) => _DuesBuckets(
  bucket0_30: AgingBucket.fromJson(json['0_30'] as Map<String, dynamic>),
  bucket31_60: AgingBucket.fromJson(json['31_60'] as Map<String, dynamic>),
  bucket61_90: AgingBucket.fromJson(json['61_90'] as Map<String, dynamic>),
  bucket90Plus: AgingBucket.fromJson(json['90_plus'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DuesBucketsToJson(_DuesBuckets instance) =>
    <String, dynamic>{
      '0_30': instance.bucket0_30,
      '31_60': instance.bucket31_60,
      '61_90': instance.bucket61_90,
      '90_plus': instance.bucket90Plus,
    };

_DuesAgingReport _$DuesAgingReportFromJson(Map<String, dynamic> json) =>
    _DuesAgingReport(
      buckets: DuesBuckets.fromJson(json['buckets'] as Map<String, dynamic>),
      totalOutstanding: json['total_outstanding'] as String,
    );

Map<String, dynamic> _$DuesAgingReportToJson(_DuesAgingReport instance) =>
    <String, dynamic>{
      'buckets': instance.buckets,
      'total_outstanding': instance.totalOutstanding,
    };
