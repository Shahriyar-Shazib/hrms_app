// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LineItem _$LineItemFromJson(Map<String, dynamic> json) => _LineItem(
  id: json['id'] as String,
  head: json['head'] as String,
  label: json['label'] as String,
  amount: json['amount'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$LineItemToJson(_LineItem instance) => <String, dynamic>{
  'id': instance.id,
  'head': instance.head,
  'label': instance.label,
  'amount': instance.amount,
  'metadata': instance.metadata,
};

_ElectricityWarning _$ElectricityWarningFromJson(Map<String, dynamic> json) =>
    _ElectricityWarning(
      roomId: json['room_id'] as String,
      roomNumber: json['room_number'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ElectricityWarningToJson(_ElectricityWarning instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'room_number': instance.roomNumber,
      'message': instance.message,
    };

_PreviewInvoice _$PreviewInvoiceFromJson(Map<String, dynamic> json) =>
    _PreviewInvoice(
      id: json['id'] as String,
      billingPeriodYear: (json['billing_period_year'] as num).toInt(),
      billingPeriodMonth: (json['billing_period_month'] as num).toInt(),
      totalAmount: json['total_amount'] as String,
      paidAmount: json['paid_amount'] as String,
      status: json['status'] as String,
      issuedAt: json['issued_at'] as String,
      dueDate: json['due_date'] as String,
      outstanding: json['outstanding'] as String?,
      lineItems:
          (json['line_items'] as List<dynamic>?)
              ?.map((e) => LineItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LineItem>[],
    );

Map<String, dynamic> _$PreviewInvoiceToJson(_PreviewInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billing_period_year': instance.billingPeriodYear,
      'billing_period_month': instance.billingPeriodMonth,
      'total_amount': instance.totalAmount,
      'paid_amount': instance.paidAmount,
      'status': instance.status,
      'issued_at': instance.issuedAt,
      'due_date': instance.dueDate,
      'outstanding': instance.outstanding,
      'line_items': instance.lineItems,
    };

_PreviewDue _$PreviewDueFromJson(Map<String, dynamic> json) => _PreviewDue(
  id: json['id'] as String,
  head: json['head'] as String,
  headLabel: json['head_label'] as String,
  amount: json['amount'] as String,
  paidAmount: json['paid_amount'] as String,
  outstanding: json['outstanding'] as String,
  dueDate: json['due_date'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$PreviewDueToJson(_PreviewDue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'head': instance.head,
      'head_label': instance.headLabel,
      'amount': instance.amount,
      'paid_amount': instance.paidAmount,
      'outstanding': instance.outstanding,
      'due_date': instance.dueDate,
      'status': instance.status,
    };

_CollectionPreview _$CollectionPreviewFromJson(Map<String, dynamic> json) =>
    _CollectionPreview(
      currentInvoice: json['current_invoice'] == null
          ? null
          : PreviewInvoice.fromJson(
              json['current_invoice'] as Map<String, dynamic>,
            ),
      openDues: (json['open_dues'] as List<dynamic>)
          .map((e) => PreviewDue.fromJson(e as Map<String, dynamic>))
          .toList(),
      grandTotalOutstanding: json['grand_total_outstanding'] as String,
      electricityWarning: json['electricity_warning'] == null
          ? null
          : ElectricityWarning.fromJson(
              json['electricity_warning'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CollectionPreviewToJson(_CollectionPreview instance) =>
    <String, dynamic>{
      'current_invoice': instance.currentInvoice,
      'open_dues': instance.openDues,
      'grand_total_outstanding': instance.grandTotalOutstanding,
      'electricity_warning': instance.electricityWarning,
    };

_PaymentApplication _$PaymentApplicationFromJson(Map<String, dynamic> json) =>
    _PaymentApplication(
      targetType: json['target_type'] as String,
      targetId: json['target_id'] as String,
      appliedAmount: json['applied_amount'] as String,
    );

Map<String, dynamic> _$PaymentApplicationToJson(_PaymentApplication instance) =>
    <String, dynamic>{
      'target_type': instance.targetType,
      'target_id': instance.targetId,
      'applied_amount': instance.appliedAmount,
    };

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: json['id'] as String,
  amount: json['amount'] as String,
  paymentMethod: json['payment_method'] as String,
  reference: json['reference'] as String?,
  paidAt: json['paid_at'] as String,
  applications: (json['applications'] as List<dynamic>)
      .map((e) => PaymentApplication.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'payment_method': instance.paymentMethod,
  'reference': instance.reference,
  'paid_at': instance.paidAt,
  'applications': instance.applications,
};

_CollectResult _$CollectResultFromJson(Map<String, dynamic> json) =>
    _CollectResult(
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      invoice: json['invoice'] == null
          ? null
          : PreviewInvoice.fromJson(json['invoice'] as Map<String, dynamic>),
      openDues: (json['open_dues'] as List<dynamic>)
          .map((e) => PreviewDue.fromJson(e as Map<String, dynamic>))
          .toList(),
      grandTotalOutstanding: json['grand_total_outstanding'] as String,
    );

Map<String, dynamic> _$CollectResultToJson(_CollectResult instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'invoice': instance.invoice,
      'open_dues': instance.openDues,
      'grand_total_outstanding': instance.grandTotalOutstanding,
    };
