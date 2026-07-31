import 'package:freezed_annotation/freezed_annotation.dart';

part 'renter_profile.freezed.dart';
part 'renter_profile.g.dart';

/// A renter's link to a house, as seen by the RENTER themself via
/// GET /me/renter-profiles. Normally exactly one entry; more than one only if
/// the same person has rented across multiple houses/times.
@freezed
abstract class RenterProfile with _$RenterProfile {
  const factory RenterProfile({
    required String id,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'house_name') required String houseName,
    @JsonKey(name: 'full_name') required String fullName,
    required String mobile,
    required String status,
    @JsonKey(name: 'current_room_numbers')
    @Default(<String>[])
    List<String> currentRoomNumbers,
  }) = _RenterProfile;

  factory RenterProfile.fromJson(Map<String, dynamic> json) =>
      _$RenterProfileFromJson(json);
}
