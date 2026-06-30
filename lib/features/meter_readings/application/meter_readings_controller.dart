import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/meter_readings_repository.dart';
import '../data/models/meter_reading.dart';

final meterReadingsProvider = FutureProvider.autoDispose
    .family<List<MeterReading>, (String, String)>((ref, params) {
  final (houseId, roomId) = params;
  return ref.read(meterReadingsRepositoryProvider).getByRoom(houseId, roomId);
});
