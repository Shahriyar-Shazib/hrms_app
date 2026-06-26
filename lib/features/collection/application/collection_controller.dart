import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/collection_repository.dart';
import '../data/models/collection.dart';

/// Loads the collection preview (outstanding amounts) for a renter.
/// Online-only: errors surface as AsyncValue.error.
final previewProvider = FutureProvider.autoDispose
    .family<CollectionPreview, (String, String)>((ref, params) async {
  final (houseId, renterId) = params;
  return ref.read(collectionRepositoryProvider).getPreview(houseId, renterId);
});
