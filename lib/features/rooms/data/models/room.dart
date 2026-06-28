import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
abstract class CurrentRenter with _$CurrentRenter {
  const factory CurrentRenter({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    required String mobile,
    @JsonKey(name: 'move_in_date') required String moveInDate,
  }) = _CurrentRenter;

  factory CurrentRenter.fromJson(Map<String, dynamic> json) =>
      _$CurrentRenterFromJson(json);
}

@freezed
abstract class Room with _$Room {
  const factory Room({
    required String id,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'room_number') required String roomNumber,
    String? floor,
    @JsonKey(name: 'base_rent') required String baseRent,
    @JsonKey(name: 'meter_attached') required bool meterAttached,
    @JsonKey(name: 'meter_number') String? meterNumber,
    required String status,
    String? notes,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'current_renter') CurrentRenter? currentRenter,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
