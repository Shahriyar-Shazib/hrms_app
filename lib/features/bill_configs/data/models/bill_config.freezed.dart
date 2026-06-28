// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BillConfig {

 String get id;@JsonKey(name: 'house_id') String get houseId; String get head; String get label; String get amount;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'effective_from') String get effectiveFrom;@JsonKey(name: 'effective_to') String? get effectiveTo;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of BillConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillConfigCopyWith<BillConfig> get copyWith => _$BillConfigCopyWithImpl<BillConfig>(this as BillConfig, _$identity);

  /// Serializes this BillConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.head, head) || other.head == head)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.effectiveTo, effectiveTo) || other.effectiveTo == effectiveTo)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,head,label,amount,isActive,effectiveFrom,effectiveTo,createdBy,createdAt);

@override
String toString() {
  return 'BillConfig(id: $id, houseId: $houseId, head: $head, label: $label, amount: $amount, isActive: $isActive, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BillConfigCopyWith<$Res>  {
  factory $BillConfigCopyWith(BillConfig value, $Res Function(BillConfig) _then) = _$BillConfigCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId, String head, String label, String amount,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'effective_from') String effectiveFrom,@JsonKey(name: 'effective_to') String? effectiveTo,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$BillConfigCopyWithImpl<$Res>
    implements $BillConfigCopyWith<$Res> {
  _$BillConfigCopyWithImpl(this._self, this._then);

  final BillConfig _self;
  final $Res Function(BillConfig) _then;

/// Create a copy of BillConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? head = null,Object? label = null,Object? amount = null,Object? isActive = null,Object? effectiveFrom = null,Object? effectiveTo = freezed,Object? createdBy = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as String,effectiveTo: freezed == effectiveTo ? _self.effectiveTo : effectiveTo // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BillConfig].
extension BillConfigPatterns on BillConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillConfig value)  $default,){
final _that = this;
switch (_that) {
case _BillConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BillConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId,  String head,  String label,  String amount, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'effective_from')  String effectiveFrom, @JsonKey(name: 'effective_to')  String? effectiveTo, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillConfig() when $default != null:
return $default(_that.id,_that.houseId,_that.head,_that.label,_that.amount,_that.isActive,_that.effectiveFrom,_that.effectiveTo,_that.createdBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId,  String head,  String label,  String amount, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'effective_from')  String effectiveFrom, @JsonKey(name: 'effective_to')  String? effectiveTo, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _BillConfig():
return $default(_that.id,_that.houseId,_that.head,_that.label,_that.amount,_that.isActive,_that.effectiveFrom,_that.effectiveTo,_that.createdBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'house_id')  String houseId,  String head,  String label,  String amount, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'effective_from')  String effectiveFrom, @JsonKey(name: 'effective_to')  String? effectiveTo, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BillConfig() when $default != null:
return $default(_that.id,_that.houseId,_that.head,_that.label,_that.amount,_that.isActive,_that.effectiveFrom,_that.effectiveTo,_that.createdBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BillConfig implements BillConfig {
  const _BillConfig({required this.id, @JsonKey(name: 'house_id') required this.houseId, required this.head, required this.label, required this.amount, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'effective_from') required this.effectiveFrom, @JsonKey(name: 'effective_to') this.effectiveTo, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'created_at') required this.createdAt});
  factory _BillConfig.fromJson(Map<String, dynamic> json) => _$BillConfigFromJson(json);

@override final  String id;
@override@JsonKey(name: 'house_id') final  String houseId;
@override final  String head;
@override final  String label;
@override final  String amount;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'effective_from') final  String effectiveFrom;
@override@JsonKey(name: 'effective_to') final  String? effectiveTo;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of BillConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillConfigCopyWith<_BillConfig> get copyWith => __$BillConfigCopyWithImpl<_BillConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BillConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.head, head) || other.head == head)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.effectiveFrom, effectiveFrom) || other.effectiveFrom == effectiveFrom)&&(identical(other.effectiveTo, effectiveTo) || other.effectiveTo == effectiveTo)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,head,label,amount,isActive,effectiveFrom,effectiveTo,createdBy,createdAt);

@override
String toString() {
  return 'BillConfig(id: $id, houseId: $houseId, head: $head, label: $label, amount: $amount, isActive: $isActive, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BillConfigCopyWith<$Res> implements $BillConfigCopyWith<$Res> {
  factory _$BillConfigCopyWith(_BillConfig value, $Res Function(_BillConfig) _then) = __$BillConfigCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId, String head, String label, String amount,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'effective_from') String effectiveFrom,@JsonKey(name: 'effective_to') String? effectiveTo,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$BillConfigCopyWithImpl<$Res>
    implements _$BillConfigCopyWith<$Res> {
  __$BillConfigCopyWithImpl(this._self, this._then);

  final _BillConfig _self;
  final $Res Function(_BillConfig) _then;

/// Create a copy of BillConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? head = null,Object? label = null,Object? amount = null,Object? isActive = null,Object? effectiveFrom = null,Object? effectiveTo = freezed,Object? createdBy = null,Object? createdAt = null,}) {
  return _then(_BillConfig(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,effectiveFrom: null == effectiveFrom ? _self.effectiveFrom : effectiveFrom // ignore: cast_nullable_to_non_nullable
as String,effectiveTo: freezed == effectiveTo ? _self.effectiveTo : effectiveTo // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
