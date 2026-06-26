// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentRenter {

 String get id;@JsonKey(name: 'full_name') String get fullName; String get mobile;@JsonKey(name: 'move_in_date') String get moveInDate;
/// Create a copy of CurrentRenter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentRenterCopyWith<CurrentRenter> get copyWith => _$CurrentRenterCopyWithImpl<CurrentRenter>(this as CurrentRenter, _$identity);

  /// Serializes this CurrentRenter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentRenter&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.moveInDate, moveInDate) || other.moveInDate == moveInDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,mobile,moveInDate);

@override
String toString() {
  return 'CurrentRenter(id: $id, fullName: $fullName, mobile: $mobile, moveInDate: $moveInDate)';
}


}

/// @nodoc
abstract mixin class $CurrentRenterCopyWith<$Res>  {
  factory $CurrentRenterCopyWith(CurrentRenter value, $Res Function(CurrentRenter) _then) = _$CurrentRenterCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'full_name') String fullName, String mobile,@JsonKey(name: 'move_in_date') String moveInDate
});




}
/// @nodoc
class _$CurrentRenterCopyWithImpl<$Res>
    implements $CurrentRenterCopyWith<$Res> {
  _$CurrentRenterCopyWithImpl(this._self, this._then);

  final CurrentRenter _self;
  final $Res Function(CurrentRenter) _then;

/// Create a copy of CurrentRenter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? mobile = null,Object? moveInDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,moveInDate: null == moveInDate ? _self.moveInDate : moveInDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentRenter].
extension CurrentRenterPatterns on CurrentRenter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentRenter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentRenter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentRenter value)  $default,){
final _that = this;
switch (_that) {
case _CurrentRenter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentRenter value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentRenter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'full_name')  String fullName,  String mobile, @JsonKey(name: 'move_in_date')  String moveInDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentRenter() when $default != null:
return $default(_that.id,_that.fullName,_that.mobile,_that.moveInDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'full_name')  String fullName,  String mobile, @JsonKey(name: 'move_in_date')  String moveInDate)  $default,) {final _that = this;
switch (_that) {
case _CurrentRenter():
return $default(_that.id,_that.fullName,_that.mobile,_that.moveInDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'full_name')  String fullName,  String mobile, @JsonKey(name: 'move_in_date')  String moveInDate)?  $default,) {final _that = this;
switch (_that) {
case _CurrentRenter() when $default != null:
return $default(_that.id,_that.fullName,_that.mobile,_that.moveInDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentRenter implements CurrentRenter {
  const _CurrentRenter({required this.id, @JsonKey(name: 'full_name') required this.fullName, required this.mobile, @JsonKey(name: 'move_in_date') required this.moveInDate});
  factory _CurrentRenter.fromJson(Map<String, dynamic> json) => _$CurrentRenterFromJson(json);

@override final  String id;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String mobile;
@override@JsonKey(name: 'move_in_date') final  String moveInDate;

/// Create a copy of CurrentRenter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentRenterCopyWith<_CurrentRenter> get copyWith => __$CurrentRenterCopyWithImpl<_CurrentRenter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentRenterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentRenter&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.moveInDate, moveInDate) || other.moveInDate == moveInDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,mobile,moveInDate);

@override
String toString() {
  return 'CurrentRenter(id: $id, fullName: $fullName, mobile: $mobile, moveInDate: $moveInDate)';
}


}

/// @nodoc
abstract mixin class _$CurrentRenterCopyWith<$Res> implements $CurrentRenterCopyWith<$Res> {
  factory _$CurrentRenterCopyWith(_CurrentRenter value, $Res Function(_CurrentRenter) _then) = __$CurrentRenterCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'full_name') String fullName, String mobile,@JsonKey(name: 'move_in_date') String moveInDate
});




}
/// @nodoc
class __$CurrentRenterCopyWithImpl<$Res>
    implements _$CurrentRenterCopyWith<$Res> {
  __$CurrentRenterCopyWithImpl(this._self, this._then);

  final _CurrentRenter _self;
  final $Res Function(_CurrentRenter) _then;

/// Create a copy of CurrentRenter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? mobile = null,Object? moveInDate = null,}) {
  return _then(_CurrentRenter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,moveInDate: null == moveInDate ? _self.moveInDate : moveInDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Room {

 String get id;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'room_number') String get roomNumber; int? get floor;@JsonKey(name: 'base_rent') String get baseRent;@JsonKey(name: 'meter_attached') bool get meterAttached;@JsonKey(name: 'meter_number') String? get meterNumber; String get status; String? get notes;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'current_renter') CurrentRenter? get currentRenter;
/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomCopyWith<Room> get copyWith => _$RoomCopyWithImpl<Room>(this as Room, _$identity);

  /// Serializes this Room to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Room&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.baseRent, baseRent) || other.baseRent == baseRent)&&(identical(other.meterAttached, meterAttached) || other.meterAttached == meterAttached)&&(identical(other.meterNumber, meterNumber) || other.meterNumber == meterNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.currentRenter, currentRenter) || other.currentRenter == currentRenter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,roomNumber,floor,baseRent,meterAttached,meterNumber,status,notes,createdAt,updatedAt,currentRenter);

@override
String toString() {
  return 'Room(id: $id, houseId: $houseId, roomNumber: $roomNumber, floor: $floor, baseRent: $baseRent, meterAttached: $meterAttached, meterNumber: $meterNumber, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, currentRenter: $currentRenter)';
}


}

/// @nodoc
abstract mixin class $RoomCopyWith<$Res>  {
  factory $RoomCopyWith(Room value, $Res Function(Room) _then) = _$RoomCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'room_number') String roomNumber, int? floor,@JsonKey(name: 'base_rent') String baseRent,@JsonKey(name: 'meter_attached') bool meterAttached,@JsonKey(name: 'meter_number') String? meterNumber, String status, String? notes,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'current_renter') CurrentRenter? currentRenter
});


$CurrentRenterCopyWith<$Res>? get currentRenter;

}
/// @nodoc
class _$RoomCopyWithImpl<$Res>
    implements $RoomCopyWith<$Res> {
  _$RoomCopyWithImpl(this._self, this._then);

  final Room _self;
  final $Res Function(Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? roomNumber = null,Object? floor = freezed,Object? baseRent = null,Object? meterAttached = null,Object? meterNumber = freezed,Object? status = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? currentRenter = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,baseRent: null == baseRent ? _self.baseRent : baseRent // ignore: cast_nullable_to_non_nullable
as String,meterAttached: null == meterAttached ? _self.meterAttached : meterAttached // ignore: cast_nullable_to_non_nullable
as bool,meterNumber: freezed == meterNumber ? _self.meterNumber : meterNumber // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,currentRenter: freezed == currentRenter ? _self.currentRenter : currentRenter // ignore: cast_nullable_to_non_nullable
as CurrentRenter?,
  ));
}
/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentRenterCopyWith<$Res>? get currentRenter {
    if (_self.currentRenter == null) {
    return null;
  }

  return $CurrentRenterCopyWith<$Res>(_self.currentRenter!, (value) {
    return _then(_self.copyWith(currentRenter: value));
  });
}
}


/// Adds pattern-matching-related methods to [Room].
extension RoomPatterns on Room {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Room value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Room() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Room value)  $default,){
final _that = this;
switch (_that) {
case _Room():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Room value)?  $default,){
final _that = this;
switch (_that) {
case _Room() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_number')  String roomNumber,  int? floor, @JsonKey(name: 'base_rent')  String baseRent, @JsonKey(name: 'meter_attached')  bool meterAttached, @JsonKey(name: 'meter_number')  String? meterNumber,  String status,  String? notes, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'current_renter')  CurrentRenter? currentRenter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that.id,_that.houseId,_that.roomNumber,_that.floor,_that.baseRent,_that.meterAttached,_that.meterNumber,_that.status,_that.notes,_that.createdAt,_that.updatedAt,_that.currentRenter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_number')  String roomNumber,  int? floor, @JsonKey(name: 'base_rent')  String baseRent, @JsonKey(name: 'meter_attached')  bool meterAttached, @JsonKey(name: 'meter_number')  String? meterNumber,  String status,  String? notes, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'current_renter')  CurrentRenter? currentRenter)  $default,) {final _that = this;
switch (_that) {
case _Room():
return $default(_that.id,_that.houseId,_that.roomNumber,_that.floor,_that.baseRent,_that.meterAttached,_that.meterNumber,_that.status,_that.notes,_that.createdAt,_that.updatedAt,_that.currentRenter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_number')  String roomNumber,  int? floor, @JsonKey(name: 'base_rent')  String baseRent, @JsonKey(name: 'meter_attached')  bool meterAttached, @JsonKey(name: 'meter_number')  String? meterNumber,  String status,  String? notes, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'current_renter')  CurrentRenter? currentRenter)?  $default,) {final _that = this;
switch (_that) {
case _Room() when $default != null:
return $default(_that.id,_that.houseId,_that.roomNumber,_that.floor,_that.baseRent,_that.meterAttached,_that.meterNumber,_that.status,_that.notes,_that.createdAt,_that.updatedAt,_that.currentRenter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Room implements Room {
  const _Room({required this.id, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'room_number') required this.roomNumber, this.floor, @JsonKey(name: 'base_rent') required this.baseRent, @JsonKey(name: 'meter_attached') required this.meterAttached, @JsonKey(name: 'meter_number') this.meterNumber, required this.status, this.notes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'current_renter') this.currentRenter});
  factory _Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

@override final  String id;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'room_number') final  String roomNumber;
@override final  int? floor;
@override@JsonKey(name: 'base_rent') final  String baseRent;
@override@JsonKey(name: 'meter_attached') final  bool meterAttached;
@override@JsonKey(name: 'meter_number') final  String? meterNumber;
@override final  String status;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'current_renter') final  CurrentRenter? currentRenter;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomCopyWith<_Room> get copyWith => __$RoomCopyWithImpl<_Room>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Room&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.baseRent, baseRent) || other.baseRent == baseRent)&&(identical(other.meterAttached, meterAttached) || other.meterAttached == meterAttached)&&(identical(other.meterNumber, meterNumber) || other.meterNumber == meterNumber)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.currentRenter, currentRenter) || other.currentRenter == currentRenter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,roomNumber,floor,baseRent,meterAttached,meterNumber,status,notes,createdAt,updatedAt,currentRenter);

@override
String toString() {
  return 'Room(id: $id, houseId: $houseId, roomNumber: $roomNumber, floor: $floor, baseRent: $baseRent, meterAttached: $meterAttached, meterNumber: $meterNumber, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, currentRenter: $currentRenter)';
}


}

/// @nodoc
abstract mixin class _$RoomCopyWith<$Res> implements $RoomCopyWith<$Res> {
  factory _$RoomCopyWith(_Room value, $Res Function(_Room) _then) = __$RoomCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'room_number') String roomNumber, int? floor,@JsonKey(name: 'base_rent') String baseRent,@JsonKey(name: 'meter_attached') bool meterAttached,@JsonKey(name: 'meter_number') String? meterNumber, String status, String? notes,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'current_renter') CurrentRenter? currentRenter
});


@override $CurrentRenterCopyWith<$Res>? get currentRenter;

}
/// @nodoc
class __$RoomCopyWithImpl<$Res>
    implements _$RoomCopyWith<$Res> {
  __$RoomCopyWithImpl(this._self, this._then);

  final _Room _self;
  final $Res Function(_Room) _then;

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? roomNumber = null,Object? floor = freezed,Object? baseRent = null,Object? meterAttached = null,Object? meterNumber = freezed,Object? status = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? currentRenter = freezed,}) {
  return _then(_Room(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,baseRent: null == baseRent ? _self.baseRent : baseRent // ignore: cast_nullable_to_non_nullable
as String,meterAttached: null == meterAttached ? _self.meterAttached : meterAttached // ignore: cast_nullable_to_non_nullable
as bool,meterNumber: freezed == meterNumber ? _self.meterNumber : meterNumber // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,currentRenter: freezed == currentRenter ? _self.currentRenter : currentRenter // ignore: cast_nullable_to_non_nullable
as CurrentRenter?,
  ));
}

/// Create a copy of Room
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentRenterCopyWith<$Res>? get currentRenter {
    if (_self.currentRenter == null) {
    return null;
  }

  return $CurrentRenterCopyWith<$Res>(_self.currentRenter!, (value) {
    return _then(_self.copyWith(currentRenter: value));
  });
}
}

// dart format on
