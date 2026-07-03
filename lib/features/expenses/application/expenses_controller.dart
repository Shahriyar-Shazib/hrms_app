import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/expenses_repository.dart';
import '../data/models/expense.dart';

typedef ExpensesQuery = ({String houseId, int year, int month});

final expensesProvider = FutureProvider.autoDispose
    .family<List<Expense>, ExpensesQuery>((ref, query) async {
  return ref.read(expensesRepositoryProvider).getByHouse(
        query.houseId,
        year: query.year,
        month: query.month,
      );
});
