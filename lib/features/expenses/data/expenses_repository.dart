import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_envelope.dart';
import '../../../core/api/dio_client.dart';
import 'models/expense.dart';

/// Expenses — per-house, online-first (no drift cache).
class ExpensesRepository {
  const ExpensesRepository(this._dio);

  final Dio _dio;

  Future<List<Expense>> getByHouse(
    String houseId, {
    int? year,
    int? month,
  }) async {
    try {
      final res = await _dio.get(
        '/houses/$houseId/expenses',
        queryParameters: <String, dynamic>{
          if (year != null) 'year': year,
          if (month != null) 'month': month,
        },
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return (data as List)
          .map((j) => Expense.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Expense> createExpense(
    String houseId, {
    required String category,
    required String label,
    required String amount,
    required String expenseDate,
    String? paidTo,
    String? notes,
  }) async {
    try {
      final res = await _dio.post(
        '/houses/$houseId/expenses',
        data: <String, dynamic>{
          'category': category,
          'label': label,
          'amount': amount,
          'expense_date': expenseDate,
          if (paidTo != null && paidTo.isNotEmpty) 'paid_to': paidTo,
          if (notes != null && notes.isNotEmpty) 'notes': notes,
        },
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return Expense.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<Expense> updateExpense(
    String houseId,
    String expenseId, {
    required String category,
    required String label,
    required String amount,
    required String expenseDate,
    String? paidTo,
    String? notes,
  }) async {
    try {
      final res = await _dio.put(
        '/houses/$houseId/expenses/$expenseId',
        data: <String, dynamic>{
          'category': category,
          'label': label,
          'amount': amount,
          'expense_date': expenseDate,
          if (paidTo != null && paidTo.isNotEmpty) 'paid_to': paidTo,
          if (notes != null && notes.isNotEmpty) 'notes': notes,
        },
      );
      final data = unwrapData(res.data as Map<String, dynamic>);
      return Expense.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }

  Future<void> deleteExpense(String houseId, String expenseId) async {
    try {
      await _dio.delete('/houses/$houseId/expenses/$expenseId');
    } on DioException catch (e) {
      throw dioErrorToApiException(e);
    }
  }
}

final expensesRepositoryProvider = Provider<ExpensesRepository>((ref) {
  return ExpensesRepository(ref.read(dioProvider));
});
