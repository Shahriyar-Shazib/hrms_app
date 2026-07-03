// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Expense _$ExpenseFromJson(Map<String, dynamic> json) => _Expense(
  id: json['id'] as String,
  houseId: json['house_id'] as String,
  category: json['category'] as String,
  label: json['label'] as String,
  amount: json['amount'] as String,
  expenseDate: json['expense_date'] as String,
  paidTo: json['paid_to'] as String?,
  attachmentUrl: json['attachment_url'] as String?,
  notes: json['notes'] as String?,
  loggedBy: json['logged_by'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$ExpenseToJson(_Expense instance) => <String, dynamic>{
  'id': instance.id,
  'house_id': instance.houseId,
  'category': instance.category,
  'label': instance.label,
  'amount': instance.amount,
  'expense_date': instance.expenseDate,
  'paid_to': instance.paidTo,
  'attachment_url': instance.attachmentUrl,
  'notes': instance.notes,
  'logged_by': instance.loggedBy,
  'created_at': instance.createdAt,
};
