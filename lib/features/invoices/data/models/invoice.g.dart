// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Invoice _$InvoiceFromJson(Map<String, dynamic> json) => _Invoice(
  id: json['id'] as String,
  houseId: json['house_id'] as String,
  roomId: json['room_id'] as String,
  renterId: json['renter_id'] as String,
  billingPeriodYear: (json['billing_period_year'] as num).toInt(),
  billingPeriodMonth: (json['billing_period_month'] as num).toInt(),
  baseRent: json['base_rent'] as String,
  electricityAmount: json['electricity_amount'] as String,
  totalAmount: json['total_amount'] as String,
  paidAmount: json['paid_amount'] as String,
  status: json['status'] as String,
  issuedAt: json['issued_at'] as String,
  dueDate: json['due_date'] as String,
  createdAt: json['created_at'] as String,
  lineItems: (json['line_items'] as List<dynamic>?)
      ?.map((e) => LineItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InvoiceToJson(_Invoice instance) => <String, dynamic>{
  'id': instance.id,
  'house_id': instance.houseId,
  'room_id': instance.roomId,
  'renter_id': instance.renterId,
  'billing_period_year': instance.billingPeriodYear,
  'billing_period_month': instance.billingPeriodMonth,
  'base_rent': instance.baseRent,
  'electricity_amount': instance.electricityAmount,
  'total_amount': instance.totalAmount,
  'paid_amount': instance.paidAmount,
  'status': instance.status,
  'issued_at': instance.issuedAt,
  'due_date': instance.dueDate,
  'created_at': instance.createdAt,
  'line_items': instance.lineItems,
};

_GenerateWarning _$GenerateWarningFromJson(Map<String, dynamic> json) =>
    _GenerateWarning(
      type: json['type'] as String,
      roomId: json['room_id'] as String,
      roomNumber: json['room_number'] as String,
    );

Map<String, dynamic> _$GenerateWarningToJson(_GenerateWarning instance) =>
    <String, dynamic>{
      'type': instance.type,
      'room_id': instance.roomId,
      'room_number': instance.roomNumber,
    };

_GenerateResult _$GenerateResultFromJson(Map<String, dynamic> json) =>
    _GenerateResult(
      alreadyGenerated: json['already_generated'] as bool,
      invoices:
          (json['invoices'] as List<dynamic>?)
              ?.map((e) => Invoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Invoice>[],
      warnings:
          (json['warnings'] as List<dynamic>?)
              ?.map((e) => GenerateWarning.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GenerateWarning>[],
      skipped:
          (json['skipped'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const <Map<String, dynamic>>[],
      closedInvoices:
          (json['closed_invoices'] as List<dynamic>?)
              ?.map((e) => Invoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Invoice>[],
      duesCreated:
          (json['dues_created'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const <Map<String, dynamic>>[],
    );

Map<String, dynamic> _$GenerateResultToJson(_GenerateResult instance) =>
    <String, dynamic>{
      'already_generated': instance.alreadyGenerated,
      'invoices': instance.invoices,
      'warnings': instance.warnings,
      'skipped': instance.skipped,
      'closed_invoices': instance.closedInvoices,
      'dues_created': instance.duesCreated,
    };
