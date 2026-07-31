// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'renter_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenterProfile {

 String get id;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'house_name') String get houseName;@JsonKey(name: 'full_name') String get fullName; String get mobile; String get status;@JsonKey(name: 'current_room_numbers') List<String> get currentRoomNumbers;
/// Create a copy of RenterProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenterProfileCopyWith<RenterProfile> get copyWith => _$RenterProfileCopyWithImpl<RenterProfile>(this as RenterProfile, _$identity);

  /// Serializes this RenterProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenterProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.currentRoomNumbers, currentRoomNumbers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,houseName,fullName,mobile,status,const DeepCollectionEquality().hash(currentRoomNumbers));

@override
String toString() {
  return 'RenterProfile(id: $id, houseId: $houseId, houseName: $houseName, fullName: $fullName, mobile: $mobile, status: $status, currentRoomNumbers: $currentRoomNumbers)';
}


}

/// @nodoc
abstract mixin class $RenterProfileCopyWith<$Res>  {
  factory $RenterProfileCopyWith(RenterProfile value, $Res Function(RenterProfile) _then) = _$RenterProfileCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'house_name') String houseName,@JsonKey(name: 'full_name') String fullName, String mobile, String status,@JsonKey(name: 'current_room_numbers') List<String> currentRoomNumbers
});




}
/// @nodoc
class _$RenterProfileCopyWithImpl<$Res>
    implements $RenterProfileCopyWith<$Res> {
  _$RenterProfileCopyWithImpl(this._self, this._then);

  final RenterProfile _self;
  final $Res Function(RenterProfile) _then;

/// Create a copy of RenterProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? houseName = null,Object? fullName = null,Object? mobile = null,Object? status = null,Object? currentRoomNumbers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,houseName: null == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentRoomNumbers: null == currentRoomNumbers ? _self.currentRoomNumbers : currentRoomNumbers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RenterProfile].
extension RenterProfilePatterns on RenterProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenterProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenterProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenterProfile value)  $default,){
final _that = this;
switch (_that) {
case _RenterProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenterProfile value)?  $default,){
final _that = this;
switch (_that) {
case _RenterProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'house_name')  String houseName, @JsonKey(name: 'full_name')  String fullName,  String mobile,  String status, @JsonKey(name: 'current_room_numbers')  List<String> currentRoomNumbers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenterProfile() when $default != null:
return $default(_that.id,_that.houseId,_that.houseName,_that.fullName,_that.mobile,_that.status,_that.currentRoomNumbers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'house_name')  String houseName, @JsonKey(name: 'full_name')  String fullName,  String mobile,  String status, @JsonKey(name: 'current_room_numbers')  List<String> currentRoomNumbers)  $default,) {final _that = this;
switch (_that) {
case _RenterProfile():
return $default(_that.id,_that.houseId,_that.houseName,_that.fullName,_that.mobile,_that.status,_that.currentRoomNumbers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'house_name')  String houseName, @JsonKey(name: 'full_name')  String fullName,  String mobile,  String status, @JsonKey(name: 'current_room_numbers')  List<String> currentRoomNumbers)?  $default,) {final _that = this;
switch (_that) {
case _RenterProfile() when $default != null:
return $default(_that.id,_that.houseId,_that.houseName,_that.fullName,_that.mobile,_that.status,_that.currentRoomNumbers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenterProfile implements RenterProfile {
  const _RenterProfile({required this.id, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'house_name') required this.houseName, @JsonKey(name: 'full_name') required this.fullName, required this.mobile, required this.status, @JsonKey(name: 'current_room_numbers') final  List<String> currentRoomNumbers = const <String>[]}): _currentRoomNumbers = currentRoomNumbers;
  factory _RenterProfile.fromJson(Map<String, dynamic> json) => _$RenterProfileFromJson(json);

@override final  String id;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'house_name') final  String houseName;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String mobile;
@override final  String status;
 final  List<String> _currentRoomNumbers;
@override@JsonKey(name: 'current_room_numbers') List<String> get currentRoomNumbers {
  if (_currentRoomNumbers is EqualUnmodifiableListView) return _currentRoomNumbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentRoomNumbers);
}


/// Create a copy of RenterProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenterProfileCopyWith<_RenterProfile> get copyWith => __$RenterProfileCopyWithImpl<_RenterProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenterProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenterProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.houseName, houseName) || other.houseName == houseName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._currentRoomNumbers, _currentRoomNumbers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,houseName,fullName,mobile,status,const DeepCollectionEquality().hash(_currentRoomNumbers));

@override
String toString() {
  return 'RenterProfile(id: $id, houseId: $houseId, houseName: $houseName, fullName: $fullName, mobile: $mobile, status: $status, currentRoomNumbers: $currentRoomNumbers)';
}


}

/// @nodoc
abstract mixin class _$RenterProfileCopyWith<$Res> implements $RenterProfileCopyWith<$Res> {
  factory _$RenterProfileCopyWith(_RenterProfile value, $Res Function(_RenterProfile) _then) = __$RenterProfileCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'house_name') String houseName,@JsonKey(name: 'full_name') String fullName, String mobile, String status,@JsonKey(name: 'current_room_numbers') List<String> currentRoomNumbers
});




}
/// @nodoc
class __$RenterProfileCopyWithImpl<$Res>
    implements _$RenterProfileCopyWith<$Res> {
  __$RenterProfileCopyWithImpl(this._self, this._then);

  final _RenterProfile _self;
  final $Res Function(_RenterProfile) _then;

/// Create a copy of RenterProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? houseName = null,Object? fullName = null,Object? mobile = null,Object? status = null,Object? currentRoomNumbers = null,}) {
  return _then(_RenterProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,houseName: null == houseName ? _self.houseName : houseName // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentRoomNumbers: null == currentRoomNumbers ? _self._currentRoomNumbers : currentRoomNumbers // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
