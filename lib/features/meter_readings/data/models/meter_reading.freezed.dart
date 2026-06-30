// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meter_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeterReading {

 String get id;@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'previous_reading') String get previousReading;@JsonKey(name: 'current_reading') String get currentReading;@JsonKey(name: 'units_consumed') String get unitsConsumed;@JsonKey(name: 'reading_date') String get readingDate;@JsonKey(name: 'billing_period_year') int get billingPeriodYear;@JsonKey(name: 'billing_period_month') int get billingPeriodMonth;@JsonKey(name: 'rate_snapshot') String get rateSnapshot;@JsonKey(name: 'computed_amount') String get computedAmount;@JsonKey(name: 'reading_type') String get readingType;@JsonKey(name: 'adjusts_reading_id') String? get adjustsReadingId;@JsonKey(name: 'recorded_by') String get recordedBy;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of MeterReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeterReadingCopyWith<MeterReading> get copyWith => _$MeterReadingCopyWithImpl<MeterReading>(this as MeterReading, _$identity);

  /// Serializes this MeterReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeterReading&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.unitsConsumed, unitsConsumed) || other.unitsConsumed == unitsConsumed)&&(identical(other.readingDate, readingDate) || other.readingDate == readingDate)&&(identical(other.billingPeriodYear, billingPeriodYear) || other.billingPeriodYear == billingPeriodYear)&&(identical(other.billingPeriodMonth, billingPeriodMonth) || other.billingPeriodMonth == billingPeriodMonth)&&(identical(other.rateSnapshot, rateSnapshot) || other.rateSnapshot == rateSnapshot)&&(identical(other.computedAmount, computedAmount) || other.computedAmount == computedAmount)&&(identical(other.readingType, readingType) || other.readingType == readingType)&&(identical(other.adjustsReadingId, adjustsReadingId) || other.adjustsReadingId == adjustsReadingId)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomId,houseId,previousReading,currentReading,unitsConsumed,readingDate,billingPeriodYear,billingPeriodMonth,rateSnapshot,computedAmount,readingType,adjustsReadingId,recordedBy,createdAt);

@override
String toString() {
  return 'MeterReading(id: $id, roomId: $roomId, houseId: $houseId, previousReading: $previousReading, currentReading: $currentReading, unitsConsumed: $unitsConsumed, readingDate: $readingDate, billingPeriodYear: $billingPeriodYear, billingPeriodMonth: $billingPeriodMonth, rateSnapshot: $rateSnapshot, computedAmount: $computedAmount, readingType: $readingType, adjustsReadingId: $adjustsReadingId, recordedBy: $recordedBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MeterReadingCopyWith<$Res>  {
  factory $MeterReadingCopyWith(MeterReading value, $Res Function(MeterReading) _then) = _$MeterReadingCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'previous_reading') String previousReading,@JsonKey(name: 'current_reading') String currentReading,@JsonKey(name: 'units_consumed') String unitsConsumed,@JsonKey(name: 'reading_date') String readingDate,@JsonKey(name: 'billing_period_year') int billingPeriodYear,@JsonKey(name: 'billing_period_month') int billingPeriodMonth,@JsonKey(name: 'rate_snapshot') String rateSnapshot,@JsonKey(name: 'computed_amount') String computedAmount,@JsonKey(name: 'reading_type') String readingType,@JsonKey(name: 'adjusts_reading_id') String? adjustsReadingId,@JsonKey(name: 'recorded_by') String recordedBy,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$MeterReadingCopyWithImpl<$Res>
    implements $MeterReadingCopyWith<$Res> {
  _$MeterReadingCopyWithImpl(this._self, this._then);

  final MeterReading _self;
  final $Res Function(MeterReading) _then;

/// Create a copy of MeterReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomId = null,Object? houseId = null,Object? previousReading = null,Object? currentReading = null,Object? unitsConsumed = null,Object? readingDate = null,Object? billingPeriodYear = null,Object? billingPeriodMonth = null,Object? rateSnapshot = null,Object? computedAmount = null,Object? readingType = null,Object? adjustsReadingId = freezed,Object? recordedBy = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as String,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as String,unitsConsumed: null == unitsConsumed ? _self.unitsConsumed : unitsConsumed // ignore: cast_nullable_to_non_nullable
as String,readingDate: null == readingDate ? _self.readingDate : readingDate // ignore: cast_nullable_to_non_nullable
as String,billingPeriodYear: null == billingPeriodYear ? _self.billingPeriodYear : billingPeriodYear // ignore: cast_nullable_to_non_nullable
as int,billingPeriodMonth: null == billingPeriodMonth ? _self.billingPeriodMonth : billingPeriodMonth // ignore: cast_nullable_to_non_nullable
as int,rateSnapshot: null == rateSnapshot ? _self.rateSnapshot : rateSnapshot // ignore: cast_nullable_to_non_nullable
as String,computedAmount: null == computedAmount ? _self.computedAmount : computedAmount // ignore: cast_nullable_to_non_nullable
as String,readingType: null == readingType ? _self.readingType : readingType // ignore: cast_nullable_to_non_nullable
as String,adjustsReadingId: freezed == adjustsReadingId ? _self.adjustsReadingId : adjustsReadingId // ignore: cast_nullable_to_non_nullable
as String?,recordedBy: null == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MeterReading].
extension MeterReadingPatterns on MeterReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeterReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeterReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeterReading value)  $default,){
final _that = this;
switch (_that) {
case _MeterReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeterReading value)?  $default,){
final _that = this;
switch (_that) {
case _MeterReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'previous_reading')  String previousReading, @JsonKey(name: 'current_reading')  String currentReading, @JsonKey(name: 'units_consumed')  String unitsConsumed, @JsonKey(name: 'reading_date')  String readingDate, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'rate_snapshot')  String rateSnapshot, @JsonKey(name: 'computed_amount')  String computedAmount, @JsonKey(name: 'reading_type')  String readingType, @JsonKey(name: 'adjusts_reading_id')  String? adjustsReadingId, @JsonKey(name: 'recorded_by')  String recordedBy, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeterReading() when $default != null:
return $default(_that.id,_that.roomId,_that.houseId,_that.previousReading,_that.currentReading,_that.unitsConsumed,_that.readingDate,_that.billingPeriodYear,_that.billingPeriodMonth,_that.rateSnapshot,_that.computedAmount,_that.readingType,_that.adjustsReadingId,_that.recordedBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'previous_reading')  String previousReading, @JsonKey(name: 'current_reading')  String currentReading, @JsonKey(name: 'units_consumed')  String unitsConsumed, @JsonKey(name: 'reading_date')  String readingDate, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'rate_snapshot')  String rateSnapshot, @JsonKey(name: 'computed_amount')  String computedAmount, @JsonKey(name: 'reading_type')  String readingType, @JsonKey(name: 'adjusts_reading_id')  String? adjustsReadingId, @JsonKey(name: 'recorded_by')  String recordedBy, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _MeterReading():
return $default(_that.id,_that.roomId,_that.houseId,_that.previousReading,_that.currentReading,_that.unitsConsumed,_that.readingDate,_that.billingPeriodYear,_that.billingPeriodMonth,_that.rateSnapshot,_that.computedAmount,_that.readingType,_that.adjustsReadingId,_that.recordedBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'previous_reading')  String previousReading, @JsonKey(name: 'current_reading')  String currentReading, @JsonKey(name: 'units_consumed')  String unitsConsumed, @JsonKey(name: 'reading_date')  String readingDate, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'rate_snapshot')  String rateSnapshot, @JsonKey(name: 'computed_amount')  String computedAmount, @JsonKey(name: 'reading_type')  String readingType, @JsonKey(name: 'adjusts_reading_id')  String? adjustsReadingId, @JsonKey(name: 'recorded_by')  String recordedBy, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MeterReading() when $default != null:
return $default(_that.id,_that.roomId,_that.houseId,_that.previousReading,_that.currentReading,_that.unitsConsumed,_that.readingDate,_that.billingPeriodYear,_that.billingPeriodMonth,_that.rateSnapshot,_that.computedAmount,_that.readingType,_that.adjustsReadingId,_that.recordedBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MeterReading implements MeterReading {
  const _MeterReading({required this.id, @JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'previous_reading') required this.previousReading, @JsonKey(name: 'current_reading') required this.currentReading, @JsonKey(name: 'units_consumed') required this.unitsConsumed, @JsonKey(name: 'reading_date') required this.readingDate, @JsonKey(name: 'billing_period_year') required this.billingPeriodYear, @JsonKey(name: 'billing_period_month') required this.billingPeriodMonth, @JsonKey(name: 'rate_snapshot') required this.rateSnapshot, @JsonKey(name: 'computed_amount') required this.computedAmount, @JsonKey(name: 'reading_type') required this.readingType, @JsonKey(name: 'adjusts_reading_id') this.adjustsReadingId, @JsonKey(name: 'recorded_by') required this.recordedBy, @JsonKey(name: 'created_at') required this.createdAt});
  factory _MeterReading.fromJson(Map<String, dynamic> json) => _$MeterReadingFromJson(json);

@override final  String id;
@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'previous_reading') final  String previousReading;
@override@JsonKey(name: 'current_reading') final  String currentReading;
@override@JsonKey(name: 'units_consumed') final  String unitsConsumed;
@override@JsonKey(name: 'reading_date') final  String readingDate;
@override@JsonKey(name: 'billing_period_year') final  int billingPeriodYear;
@override@JsonKey(name: 'billing_period_month') final  int billingPeriodMonth;
@override@JsonKey(name: 'rate_snapshot') final  String rateSnapshot;
@override@JsonKey(name: 'computed_amount') final  String computedAmount;
@override@JsonKey(name: 'reading_type') final  String readingType;
@override@JsonKey(name: 'adjusts_reading_id') final  String? adjustsReadingId;
@override@JsonKey(name: 'recorded_by') final  String recordedBy;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of MeterReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeterReadingCopyWith<_MeterReading> get copyWith => __$MeterReadingCopyWithImpl<_MeterReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeterReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeterReading&&(identical(other.id, id) || other.id == id)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.previousReading, previousReading) || other.previousReading == previousReading)&&(identical(other.currentReading, currentReading) || other.currentReading == currentReading)&&(identical(other.unitsConsumed, unitsConsumed) || other.unitsConsumed == unitsConsumed)&&(identical(other.readingDate, readingDate) || other.readingDate == readingDate)&&(identical(other.billingPeriodYear, billingPeriodYear) || other.billingPeriodYear == billingPeriodYear)&&(identical(other.billingPeriodMonth, billingPeriodMonth) || other.billingPeriodMonth == billingPeriodMonth)&&(identical(other.rateSnapshot, rateSnapshot) || other.rateSnapshot == rateSnapshot)&&(identical(other.computedAmount, computedAmount) || other.computedAmount == computedAmount)&&(identical(other.readingType, readingType) || other.readingType == readingType)&&(identical(other.adjustsReadingId, adjustsReadingId) || other.adjustsReadingId == adjustsReadingId)&&(identical(other.recordedBy, recordedBy) || other.recordedBy == recordedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomId,houseId,previousReading,currentReading,unitsConsumed,readingDate,billingPeriodYear,billingPeriodMonth,rateSnapshot,computedAmount,readingType,adjustsReadingId,recordedBy,createdAt);

@override
String toString() {
  return 'MeterReading(id: $id, roomId: $roomId, houseId: $houseId, previousReading: $previousReading, currentReading: $currentReading, unitsConsumed: $unitsConsumed, readingDate: $readingDate, billingPeriodYear: $billingPeriodYear, billingPeriodMonth: $billingPeriodMonth, rateSnapshot: $rateSnapshot, computedAmount: $computedAmount, readingType: $readingType, adjustsReadingId: $adjustsReadingId, recordedBy: $recordedBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MeterReadingCopyWith<$Res> implements $MeterReadingCopyWith<$Res> {
  factory _$MeterReadingCopyWith(_MeterReading value, $Res Function(_MeterReading) _then) = __$MeterReadingCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'previous_reading') String previousReading,@JsonKey(name: 'current_reading') String currentReading,@JsonKey(name: 'units_consumed') String unitsConsumed,@JsonKey(name: 'reading_date') String readingDate,@JsonKey(name: 'billing_period_year') int billingPeriodYear,@JsonKey(name: 'billing_period_month') int billingPeriodMonth,@JsonKey(name: 'rate_snapshot') String rateSnapshot,@JsonKey(name: 'computed_amount') String computedAmount,@JsonKey(name: 'reading_type') String readingType,@JsonKey(name: 'adjusts_reading_id') String? adjustsReadingId,@JsonKey(name: 'recorded_by') String recordedBy,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$MeterReadingCopyWithImpl<$Res>
    implements _$MeterReadingCopyWith<$Res> {
  __$MeterReadingCopyWithImpl(this._self, this._then);

  final _MeterReading _self;
  final $Res Function(_MeterReading) _then;

/// Create a copy of MeterReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomId = null,Object? houseId = null,Object? previousReading = null,Object? currentReading = null,Object? unitsConsumed = null,Object? readingDate = null,Object? billingPeriodYear = null,Object? billingPeriodMonth = null,Object? rateSnapshot = null,Object? computedAmount = null,Object? readingType = null,Object? adjustsReadingId = freezed,Object? recordedBy = null,Object? createdAt = null,}) {
  return _then(_MeterReading(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,previousReading: null == previousReading ? _self.previousReading : previousReading // ignore: cast_nullable_to_non_nullable
as String,currentReading: null == currentReading ? _self.currentReading : currentReading // ignore: cast_nullable_to_non_nullable
as String,unitsConsumed: null == unitsConsumed ? _self.unitsConsumed : unitsConsumed // ignore: cast_nullable_to_non_nullable
as String,readingDate: null == readingDate ? _self.readingDate : readingDate // ignore: cast_nullable_to_non_nullable
as String,billingPeriodYear: null == billingPeriodYear ? _self.billingPeriodYear : billingPeriodYear // ignore: cast_nullable_to_non_nullable
as int,billingPeriodMonth: null == billingPeriodMonth ? _self.billingPeriodMonth : billingPeriodMonth // ignore: cast_nullable_to_non_nullable
as int,rateSnapshot: null == rateSnapshot ? _self.rateSnapshot : rateSnapshot // ignore: cast_nullable_to_non_nullable
as String,computedAmount: null == computedAmount ? _self.computedAmount : computedAmount // ignore: cast_nullable_to_non_nullable
as String,readingType: null == readingType ? _self.readingType : readingType // ignore: cast_nullable_to_non_nullable
as String,adjustsReadingId: freezed == adjustsReadingId ? _self.adjustsReadingId : adjustsReadingId // ignore: cast_nullable_to_non_nullable
as String?,recordedBy: null == recordedBy ? _self.recordedBy : recordedBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
