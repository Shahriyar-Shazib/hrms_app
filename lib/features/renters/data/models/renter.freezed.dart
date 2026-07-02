// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'renter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentAssignment {

@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'room_number') String get roomNumber;@JsonKey(name: 'move_in_date') String get moveInDate;
/// Create a copy of CurrentAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentAssignmentCopyWith<CurrentAssignment> get copyWith => _$CurrentAssignmentCopyWithImpl<CurrentAssignment>(this as CurrentAssignment, _$identity);

  /// Serializes this CurrentAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentAssignment&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.moveInDate, moveInDate) || other.moveInDate == moveInDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,roomNumber,moveInDate);

@override
String toString() {
  return 'CurrentAssignment(roomId: $roomId, roomNumber: $roomNumber, moveInDate: $moveInDate)';
}


}

/// @nodoc
abstract mixin class $CurrentAssignmentCopyWith<$Res>  {
  factory $CurrentAssignmentCopyWith(CurrentAssignment value, $Res Function(CurrentAssignment) _then) = _$CurrentAssignmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'room_number') String roomNumber,@JsonKey(name: 'move_in_date') String moveInDate
});




}
/// @nodoc
class _$CurrentAssignmentCopyWithImpl<$Res>
    implements $CurrentAssignmentCopyWith<$Res> {
  _$CurrentAssignmentCopyWithImpl(this._self, this._then);

  final CurrentAssignment _self;
  final $Res Function(CurrentAssignment) _then;

/// Create a copy of CurrentAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? roomNumber = null,Object? moveInDate = null,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,moveInDate: null == moveInDate ? _self.moveInDate : moveInDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentAssignment].
extension CurrentAssignmentPatterns on CurrentAssignment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentAssignment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentAssignment value)  $default,){
final _that = this;
switch (_that) {
case _CurrentAssignment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentAssignment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber, @JsonKey(name: 'move_in_date')  String moveInDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentAssignment() when $default != null:
return $default(_that.roomId,_that.roomNumber,_that.moveInDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber, @JsonKey(name: 'move_in_date')  String moveInDate)  $default,) {final _that = this;
switch (_that) {
case _CurrentAssignment():
return $default(_that.roomId,_that.roomNumber,_that.moveInDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber, @JsonKey(name: 'move_in_date')  String moveInDate)?  $default,) {final _that = this;
switch (_that) {
case _CurrentAssignment() when $default != null:
return $default(_that.roomId,_that.roomNumber,_that.moveInDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentAssignment implements CurrentAssignment {
  const _CurrentAssignment({@JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'room_number') required this.roomNumber, @JsonKey(name: 'move_in_date') required this.moveInDate});
  factory _CurrentAssignment.fromJson(Map<String, dynamic> json) => _$CurrentAssignmentFromJson(json);

@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'room_number') final  String roomNumber;
@override@JsonKey(name: 'move_in_date') final  String moveInDate;

/// Create a copy of CurrentAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentAssignmentCopyWith<_CurrentAssignment> get copyWith => __$CurrentAssignmentCopyWithImpl<_CurrentAssignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentAssignmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentAssignment&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.moveInDate, moveInDate) || other.moveInDate == moveInDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,roomNumber,moveInDate);

@override
String toString() {
  return 'CurrentAssignment(roomId: $roomId, roomNumber: $roomNumber, moveInDate: $moveInDate)';
}


}

/// @nodoc
abstract mixin class _$CurrentAssignmentCopyWith<$Res> implements $CurrentAssignmentCopyWith<$Res> {
  factory _$CurrentAssignmentCopyWith(_CurrentAssignment value, $Res Function(_CurrentAssignment) _then) = __$CurrentAssignmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'room_number') String roomNumber,@JsonKey(name: 'move_in_date') String moveInDate
});




}
/// @nodoc
class __$CurrentAssignmentCopyWithImpl<$Res>
    implements _$CurrentAssignmentCopyWith<$Res> {
  __$CurrentAssignmentCopyWithImpl(this._self, this._then);

  final _CurrentAssignment _self;
  final $Res Function(_CurrentAssignment) _then;

/// Create a copy of CurrentAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? roomNumber = null,Object? moveInDate = null,}) {
  return _then(_CurrentAssignment(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,moveInDate: null == moveInDate ? _self.moveInDate : moveInDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Renter {

 String get id;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'full_name') String get fullName; String get mobile;@JsonKey(name: 'nid_number') String? get nidNumber;@JsonKey(name: 'photo_url') String? get photoUrl;@JsonKey(name: 'nid_photo_url') String? get nidPhotoUrl;@JsonKey(name: 'present_address') String? get presentAddress;@JsonKey(name: 'permanent_address') String? get permanentAddress; String? get occupation; String? get organization;@JsonKey(name: 'emergency_contact_name') String? get emergencyContactName;@JsonKey(name: 'emergency_contact_mobile') String? get emergencyContactMobile;@JsonKey(name: 'advance_amount') String? get advanceAmount; String get status;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'current_assignment') CurrentAssignment? get currentAssignment;
/// Create a copy of Renter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenterCopyWith<Renter> get copyWith => _$RenterCopyWithImpl<Renter>(this as Renter, _$identity);

  /// Serializes this Renter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Renter&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.nidNumber, nidNumber) || other.nidNumber == nidNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.nidPhotoUrl, nidPhotoUrl) || other.nidPhotoUrl == nidPhotoUrl)&&(identical(other.presentAddress, presentAddress) || other.presentAddress == presentAddress)&&(identical(other.permanentAddress, permanentAddress) || other.permanentAddress == permanentAddress)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactMobile, emergencyContactMobile) || other.emergencyContactMobile == emergencyContactMobile)&&(identical(other.advanceAmount, advanceAmount) || other.advanceAmount == advanceAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.currentAssignment, currentAssignment) || other.currentAssignment == currentAssignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseId,fullName,mobile,nidNumber,photoUrl,nidPhotoUrl,presentAddress,permanentAddress,occupation,organization,emergencyContactName,emergencyContactMobile,advanceAmount,status,createdBy,createdAt,updatedAt,currentAssignment]);

@override
String toString() {
  return 'Renter(id: $id, houseId: $houseId, fullName: $fullName, mobile: $mobile, nidNumber: $nidNumber, photoUrl: $photoUrl, nidPhotoUrl: $nidPhotoUrl, presentAddress: $presentAddress, permanentAddress: $permanentAddress, occupation: $occupation, organization: $organization, emergencyContactName: $emergencyContactName, emergencyContactMobile: $emergencyContactMobile, advanceAmount: $advanceAmount, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, currentAssignment: $currentAssignment)';
}


}

/// @nodoc
abstract mixin class $RenterCopyWith<$Res>  {
  factory $RenterCopyWith(Renter value, $Res Function(Renter) _then) = _$RenterCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'full_name') String fullName, String mobile,@JsonKey(name: 'nid_number') String? nidNumber,@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'nid_photo_url') String? nidPhotoUrl,@JsonKey(name: 'present_address') String? presentAddress,@JsonKey(name: 'permanent_address') String? permanentAddress, String? occupation, String? organization,@JsonKey(name: 'emergency_contact_name') String? emergencyContactName,@JsonKey(name: 'emergency_contact_mobile') String? emergencyContactMobile,@JsonKey(name: 'advance_amount') String? advanceAmount, String status,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'current_assignment') CurrentAssignment? currentAssignment
});


$CurrentAssignmentCopyWith<$Res>? get currentAssignment;

}
/// @nodoc
class _$RenterCopyWithImpl<$Res>
    implements $RenterCopyWith<$Res> {
  _$RenterCopyWithImpl(this._self, this._then);

  final Renter _self;
  final $Res Function(Renter) _then;

/// Create a copy of Renter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? fullName = null,Object? mobile = null,Object? nidNumber = freezed,Object? photoUrl = freezed,Object? nidPhotoUrl = freezed,Object? presentAddress = freezed,Object? permanentAddress = freezed,Object? occupation = freezed,Object? organization = freezed,Object? emergencyContactName = freezed,Object? emergencyContactMobile = freezed,Object? advanceAmount = freezed,Object? status = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,Object? currentAssignment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,nidNumber: freezed == nidNumber ? _self.nidNumber : nidNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,nidPhotoUrl: freezed == nidPhotoUrl ? _self.nidPhotoUrl : nidPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,presentAddress: freezed == presentAddress ? _self.presentAddress : presentAddress // ignore: cast_nullable_to_non_nullable
as String?,permanentAddress: freezed == permanentAddress ? _self.permanentAddress : permanentAddress // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactName: freezed == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactMobile: freezed == emergencyContactMobile ? _self.emergencyContactMobile : emergencyContactMobile // ignore: cast_nullable_to_non_nullable
as String?,advanceAmount: freezed == advanceAmount ? _self.advanceAmount : advanceAmount // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,currentAssignment: freezed == currentAssignment ? _self.currentAssignment : currentAssignment // ignore: cast_nullable_to_non_nullable
as CurrentAssignment?,
  ));
}
/// Create a copy of Renter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentAssignmentCopyWith<$Res>? get currentAssignment {
    if (_self.currentAssignment == null) {
    return null;
  }

  return $CurrentAssignmentCopyWith<$Res>(_self.currentAssignment!, (value) {
    return _then(_self.copyWith(currentAssignment: value));
  });
}
}


/// Adds pattern-matching-related methods to [Renter].
extension RenterPatterns on Renter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Renter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Renter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Renter value)  $default,){
final _that = this;
switch (_that) {
case _Renter():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Renter value)?  $default,){
final _that = this;
switch (_that) {
case _Renter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'full_name')  String fullName,  String mobile, @JsonKey(name: 'nid_number')  String? nidNumber, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'nid_photo_url')  String? nidPhotoUrl, @JsonKey(name: 'present_address')  String? presentAddress, @JsonKey(name: 'permanent_address')  String? permanentAddress,  String? occupation,  String? organization, @JsonKey(name: 'emergency_contact_name')  String? emergencyContactName, @JsonKey(name: 'emergency_contact_mobile')  String? emergencyContactMobile, @JsonKey(name: 'advance_amount')  String? advanceAmount,  String status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'current_assignment')  CurrentAssignment? currentAssignment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Renter() when $default != null:
return $default(_that.id,_that.houseId,_that.fullName,_that.mobile,_that.nidNumber,_that.photoUrl,_that.nidPhotoUrl,_that.presentAddress,_that.permanentAddress,_that.occupation,_that.organization,_that.emergencyContactName,_that.emergencyContactMobile,_that.advanceAmount,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt,_that.currentAssignment);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'full_name')  String fullName,  String mobile, @JsonKey(name: 'nid_number')  String? nidNumber, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'nid_photo_url')  String? nidPhotoUrl, @JsonKey(name: 'present_address')  String? presentAddress, @JsonKey(name: 'permanent_address')  String? permanentAddress,  String? occupation,  String? organization, @JsonKey(name: 'emergency_contact_name')  String? emergencyContactName, @JsonKey(name: 'emergency_contact_mobile')  String? emergencyContactMobile, @JsonKey(name: 'advance_amount')  String? advanceAmount,  String status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'current_assignment')  CurrentAssignment? currentAssignment)  $default,) {final _that = this;
switch (_that) {
case _Renter():
return $default(_that.id,_that.houseId,_that.fullName,_that.mobile,_that.nidNumber,_that.photoUrl,_that.nidPhotoUrl,_that.presentAddress,_that.permanentAddress,_that.occupation,_that.organization,_that.emergencyContactName,_that.emergencyContactMobile,_that.advanceAmount,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt,_that.currentAssignment);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'full_name')  String fullName,  String mobile, @JsonKey(name: 'nid_number')  String? nidNumber, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'nid_photo_url')  String? nidPhotoUrl, @JsonKey(name: 'present_address')  String? presentAddress, @JsonKey(name: 'permanent_address')  String? permanentAddress,  String? occupation,  String? organization, @JsonKey(name: 'emergency_contact_name')  String? emergencyContactName, @JsonKey(name: 'emergency_contact_mobile')  String? emergencyContactMobile, @JsonKey(name: 'advance_amount')  String? advanceAmount,  String status, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'current_assignment')  CurrentAssignment? currentAssignment)?  $default,) {final _that = this;
switch (_that) {
case _Renter() when $default != null:
return $default(_that.id,_that.houseId,_that.fullName,_that.mobile,_that.nidNumber,_that.photoUrl,_that.nidPhotoUrl,_that.presentAddress,_that.permanentAddress,_that.occupation,_that.organization,_that.emergencyContactName,_that.emergencyContactMobile,_that.advanceAmount,_that.status,_that.createdBy,_that.createdAt,_that.updatedAt,_that.currentAssignment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Renter implements Renter {
  const _Renter({required this.id, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'full_name') required this.fullName, required this.mobile, @JsonKey(name: 'nid_number') this.nidNumber, @JsonKey(name: 'photo_url') this.photoUrl, @JsonKey(name: 'nid_photo_url') this.nidPhotoUrl, @JsonKey(name: 'present_address') this.presentAddress, @JsonKey(name: 'permanent_address') this.permanentAddress, this.occupation, this.organization, @JsonKey(name: 'emergency_contact_name') this.emergencyContactName, @JsonKey(name: 'emergency_contact_mobile') this.emergencyContactMobile, @JsonKey(name: 'advance_amount') this.advanceAmount, required this.status, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'current_assignment') this.currentAssignment});
  factory _Renter.fromJson(Map<String, dynamic> json) => _$RenterFromJson(json);

@override final  String id;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String mobile;
@override@JsonKey(name: 'nid_number') final  String? nidNumber;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override@JsonKey(name: 'nid_photo_url') final  String? nidPhotoUrl;
@override@JsonKey(name: 'present_address') final  String? presentAddress;
@override@JsonKey(name: 'permanent_address') final  String? permanentAddress;
@override final  String? occupation;
@override final  String? organization;
@override@JsonKey(name: 'emergency_contact_name') final  String? emergencyContactName;
@override@JsonKey(name: 'emergency_contact_mobile') final  String? emergencyContactMobile;
@override@JsonKey(name: 'advance_amount') final  String? advanceAmount;
@override final  String status;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'current_assignment') final  CurrentAssignment? currentAssignment;

/// Create a copy of Renter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenterCopyWith<_Renter> get copyWith => __$RenterCopyWithImpl<_Renter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Renter&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.nidNumber, nidNumber) || other.nidNumber == nidNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.nidPhotoUrl, nidPhotoUrl) || other.nidPhotoUrl == nidPhotoUrl)&&(identical(other.presentAddress, presentAddress) || other.presentAddress == presentAddress)&&(identical(other.permanentAddress, permanentAddress) || other.permanentAddress == permanentAddress)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactMobile, emergencyContactMobile) || other.emergencyContactMobile == emergencyContactMobile)&&(identical(other.advanceAmount, advanceAmount) || other.advanceAmount == advanceAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.currentAssignment, currentAssignment) || other.currentAssignment == currentAssignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,houseId,fullName,mobile,nidNumber,photoUrl,nidPhotoUrl,presentAddress,permanentAddress,occupation,organization,emergencyContactName,emergencyContactMobile,advanceAmount,status,createdBy,createdAt,updatedAt,currentAssignment]);

@override
String toString() {
  return 'Renter(id: $id, houseId: $houseId, fullName: $fullName, mobile: $mobile, nidNumber: $nidNumber, photoUrl: $photoUrl, nidPhotoUrl: $nidPhotoUrl, presentAddress: $presentAddress, permanentAddress: $permanentAddress, occupation: $occupation, organization: $organization, emergencyContactName: $emergencyContactName, emergencyContactMobile: $emergencyContactMobile, advanceAmount: $advanceAmount, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, currentAssignment: $currentAssignment)';
}


}

/// @nodoc
abstract mixin class _$RenterCopyWith<$Res> implements $RenterCopyWith<$Res> {
  factory _$RenterCopyWith(_Renter value, $Res Function(_Renter) _then) = __$RenterCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'full_name') String fullName, String mobile,@JsonKey(name: 'nid_number') String? nidNumber,@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'nid_photo_url') String? nidPhotoUrl,@JsonKey(name: 'present_address') String? presentAddress,@JsonKey(name: 'permanent_address') String? permanentAddress, String? occupation, String? organization,@JsonKey(name: 'emergency_contact_name') String? emergencyContactName,@JsonKey(name: 'emergency_contact_mobile') String? emergencyContactMobile,@JsonKey(name: 'advance_amount') String? advanceAmount, String status,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'current_assignment') CurrentAssignment? currentAssignment
});


@override $CurrentAssignmentCopyWith<$Res>? get currentAssignment;

}
/// @nodoc
class __$RenterCopyWithImpl<$Res>
    implements _$RenterCopyWith<$Res> {
  __$RenterCopyWithImpl(this._self, this._then);

  final _Renter _self;
  final $Res Function(_Renter) _then;

/// Create a copy of Renter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? fullName = null,Object? mobile = null,Object? nidNumber = freezed,Object? photoUrl = freezed,Object? nidPhotoUrl = freezed,Object? presentAddress = freezed,Object? permanentAddress = freezed,Object? occupation = freezed,Object? organization = freezed,Object? emergencyContactName = freezed,Object? emergencyContactMobile = freezed,Object? advanceAmount = freezed,Object? status = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = null,Object? currentAssignment = freezed,}) {
  return _then(_Renter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,nidNumber: freezed == nidNumber ? _self.nidNumber : nidNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,nidPhotoUrl: freezed == nidPhotoUrl ? _self.nidPhotoUrl : nidPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,presentAddress: freezed == presentAddress ? _self.presentAddress : presentAddress // ignore: cast_nullable_to_non_nullable
as String?,permanentAddress: freezed == permanentAddress ? _self.permanentAddress : permanentAddress // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactName: freezed == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactMobile: freezed == emergencyContactMobile ? _self.emergencyContactMobile : emergencyContactMobile // ignore: cast_nullable_to_non_nullable
as String?,advanceAmount: freezed == advanceAmount ? _self.advanceAmount : advanceAmount // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,currentAssignment: freezed == currentAssignment ? _self.currentAssignment : currentAssignment // ignore: cast_nullable_to_non_nullable
as CurrentAssignment?,
  ));
}

/// Create a copy of Renter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentAssignmentCopyWith<$Res>? get currentAssignment {
    if (_self.currentAssignment == null) {
    return null;
  }

  return $CurrentAssignmentCopyWith<$Res>(_self.currentAssignment!, (value) {
    return _then(_self.copyWith(currentAssignment: value));
  });
}
}

// dart format on
