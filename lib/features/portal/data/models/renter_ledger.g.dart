// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter_ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LedgerPeriod _$LedgerPeriodFromJson(Map<String, dynamic> json) =>
    _LedgerPeriod(
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
    );

Map<String, dynamic> _$LedgerPeriodToJson(_LedgerPeriod instance) =>
    <String, dynamic>{'year': instance.year, 'month': instance.month};

_LedgerInvoice _$LedgerInvoiceFromJson(Map<String, dynamic> json) =>
    _LedgerInvoice(
      id: json['id'] as String,
      period: LedgerPeriod.fromJson(json['period'] as Map<String, dynamic>),
      totalAmount: json['total_amount'] as String,
      paidAmount: json['paid_amount'] as String,
      status: json['status'] as String,
      issuedAt: json['issued_at'] as String,
    );

Map<String, dynamic> _$LedgerInvoiceToJson(_LedgerInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'period': instance.period,
      'total_amount': instance.totalAmount,
      'paid_amount': instance.paidAmount,
      'status': instance.status,
      'issued_at': instance.issuedAt,
    };

_LedgerDue _$LedgerDueFromJson(Map<String, dynamic> json) => _LedgerDue(
  id: json['id'] as String,
  head: json['head'] as String,
  headLabel: json['head_label'] as String,
  amount: json['amount'] as String,
  paidAmount: json['paid_amount'] as String,
  status: json['status'] as String,
  source: json['source'] as String,
  dueDate: json['due_date'] as String,
  waivedBy: json['waived_by'] as String?,
  waiveReason: json['waive_reason'] as String?,
);

Map<String, dynamic> _$LedgerDueToJson(_LedgerDue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'head': instance.head,
      'head_label': instance.headLabel,
      'amount': instance.amount,
      'paid_amount': instance.paidAmount,
      'status': instance.status,
      'source': instance.source,
      'due_date': instance.dueDate,
      'waived_by': instance.waivedBy,
      'waive_reason': instance.waiveReason,
    };

_LedgerPaymentApplication _$LedgerPaymentApplicationFromJson(
  Map<String, dynamic> json,
) => _LedgerPaymentApplication(
  targetType: json['target_type'] as String,
  targetId: json['target_id'] as String,
  appliedAmount: json['applied_amount'] as String,
);

Map<String, dynamic> _$LedgerPaymentApplicationToJson(
  _LedgerPaymentApplication instance,
) => <String, dynamic>{
  'target_type': instance.targetType,
  'target_id': instance.targetId,
  'applied_amount': instance.appliedAmount,
};

_LedgerPayment _$LedgerPaymentFromJson(Map<String, dynamic> json) =>
    _LedgerPayment(
      id: json['id'] as String,
      amount: json['amount'] as String,
      paymentMethod: json['payment_method'] as String,
      paidAt: json['paid_at'] as String,
      applications:
          (json['applications'] as List<dynamic>?)
              ?.map(
                (e) => LedgerPaymentApplication.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const <LedgerPaymentApplication>[],
    );

Map<String, dynamic> _$LedgerPaymentToJson(_LedgerPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
      'paid_at': instance.paidAt,
      'applications': instance.applications,
    };

_LedgerSummary _$LedgerSummaryFromJson(Map<String, dynamic> json) =>
    _LedgerSummary(
      totalBilled: json['total_billed'] as String,
      totalPaid: json['total_paid'] as String,
      totalOutstanding: json['total_outstanding'] as String,
      totalWaived: json['total_waived'] as String,
    );

Map<String, dynamic> _$LedgerSummaryToJson(_LedgerSummary instance) =>
    <String, dynamic>{
      'total_billed': instance.totalBilled,
      'total_paid': instance.totalPaid,
      'total_outstanding': instance.totalOutstanding,
      'total_waived': instance.totalWaived,
    };

_RenterLedger _$RenterLedgerFromJson(Map<String, dynamic> json) =>
    _RenterLedger(
      invoices:
          (json['invoices'] as List<dynamic>?)
              ?.map((e) => LedgerInvoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LedgerInvoice>[],
      dues:
          (json['dues'] as List<dynamic>?)
              ?.map((e) => LedgerDue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LedgerDue>[],
      payments:
          (json['payments'] as List<dynamic>?)
              ?.map((e) => LedgerPayment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LedgerPayment>[],
      summary: LedgerSummary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RenterLedgerToJson(_RenterLedger instance) =>
    <String, dynamic>{
      'invoices': instance.invoices,
      'dues': instance.dues,
      'payments': instance.payments,
      'summary': instance.summary,
    };
