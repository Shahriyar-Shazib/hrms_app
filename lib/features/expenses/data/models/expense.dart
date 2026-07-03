import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
abstract class Expense with _$Expense {
  const factory Expense({
    required String id,
    @JsonKey(name: 'house_id') required String houseId,
    required String category,
    required String label,
    required String amount,
    @JsonKey(name: 'expense_date') required String expenseDate,
    @JsonKey(name: 'paid_to') String? paidTo,
    @JsonKey(name: 'attachment_url') String? attachmentUrl,
    String? notes,
    @JsonKey(name: 'logged_by') required String loggedBy,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}
