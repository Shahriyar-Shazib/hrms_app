import 'package:freezed_annotation/freezed_annotation.dart';

part 'renter.freezed.dart';
part 'renter.g.dart';

@freezed
abstract class CurrentAssignment with _$CurrentAssignment {
  const factory CurrentAssignment({
    @JsonKey(name: 'room_id') required String roomId,
    @JsonKey(name: 'room_number') required String roomNumber,
    @JsonKey(name: 'move_in_date') required String moveInDate,
  }) = _CurrentAssignment;

  factory CurrentAssignment.fromJson(Map<String, dynamic> json) =>
      _$CurrentAssignmentFromJson(json);
}

@freezed
abstract class Renter with _$Renter {
  const factory Renter({
    required String id,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'full_name') required String fullName,
    required String mobile,
    @JsonKey(name: 'nid_number') String? nidNumber,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'nid_photo_url') String? nidPhotoUrl,
    @JsonKey(name: 'present_address') String? presentAddress,
    @JsonKey(name: 'permanent_address') String? permanentAddress,
    String? occupation,
    String? organization,
    @JsonKey(name: 'emergency_contact_name') String? emergencyContactName,
    @JsonKey(name: 'emergency_contact_mobile') String? emergencyContactMobile,
    @JsonKey(name: 'advance_amount') String? advanceAmount,
    required String status,
    @JsonKey(name: 'created_by') required String createdBy,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'current_assignment') CurrentAssignment? currentAssignment,
  }) = _Renter;

  factory Renter.fromJson(Map<String, dynamic> json) => _$RenterFromJson(json);
}
