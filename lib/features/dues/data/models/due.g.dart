// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'due.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Due _$DueFromJson(Map<String, dynamic> json) => _Due(
  id: json['id'] as String,
  renterId: json['renter_id'] as String,
  houseId: json['house_id'] as String,
  roomIdAtCreation: json['room_id_at_creation'] as String?,
  head: json['head'] as String,
  headLabel: json['head_label'] as String,
  amount: json['amount'] as String,
  paidAmount: json['paid_amount'] as String,
  outstanding: json['outstanding'] as String,
  dueDate: json['due_date'] as String,
  source: json['source'] as String,
  reason: json['reason'] as String?,
  status: json['status'] as String,
  linkedInvoiceId: json['linked_invoice_id'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdBy: json['created_by'] as String,
  paidAt: json['paid_at'] as String?,
  waivedBy: json['waived_by'] as String?,
  waiveReason: json['waive_reason'] as String?,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$DueToJson(_Due instance) => <String, dynamic>{
  'id': instance.id,
  'renter_id': instance.renterId,
  'house_id': instance.houseId,
  'room_id_at_creation': instance.roomIdAtCreation,
  'head': instance.head,
  'head_label': instance.headLabel,
  'amount': instance.amount,
  'paid_amount': instance.paidAmount,
  'outstanding': instance.outstanding,
  'due_date': instance.dueDate,
  'source': instance.source,
  'reason': instance.reason,
  'status': instance.status,
  'linked_invoice_id': instance.linkedInvoiceId,
  'metadata': instance.metadata,
  'created_by': instance.createdBy,
  'paid_at': instance.paidAt,
  'waived_by': instance.waivedBy,
  'waive_reason': instance.waiveReason,
  'created_at': instance.createdAt,
};
