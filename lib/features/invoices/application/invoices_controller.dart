import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/invoices_repository.dart';
import '../data/models/invoice.dart';

typedef InvoicesQuery = ({String houseId, int year, int month});

final invoicesProvider = FutureProvider.autoDispose
    .family<List<Invoice>, InvoicesQuery>((ref, query) async {
  return ref.read(invoicesRepositoryProvider).getByHouse(
        query.houseId,
        year: query.year,
        month: query.month,
      );
});

final invoiceDetailProvider = FutureProvider.autoDispose
    .family<Invoice, (String, String)>((ref, params) async {
  final (houseId, invoiceId) = params;
  return ref.read(invoicesRepositoryProvider).getOne(houseId, invoiceId);
});
