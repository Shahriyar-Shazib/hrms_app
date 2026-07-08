// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditLog {

 String get id;@JsonKey(name: 'entity_type') String get entityType;@JsonKey(name: 'entity_id') String get entityId; String get action; Map<String, dynamic>? get before; Map<String, dynamic>? get after;@JsonKey(name: 'actor_user_id') String? get actorUserId;@JsonKey(name: 'actor_role') String? get actorRole;@JsonKey(name: 'house_id') String? get houseId; String? get ip;@JsonKey(name: 'occurred_at') String get occurredAt;
/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditLogCopyWith<AuditLog> get copyWith => _$AuditLogCopyWithImpl<AuditLog>(this as AuditLog, _$identity);

  /// Serializes this AuditLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other.before, before)&&const DeepCollectionEquality().equals(other.after, after)&&(identical(other.actorUserId, actorUserId) || other.actorUserId == actorUserId)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,entityType,entityId,action,const DeepCollectionEquality().hash(before),const DeepCollectionEquality().hash(after),actorUserId,actorRole,houseId,ip,occurredAt);

@override
String toString() {
  return 'AuditLog(id: $id, entityType: $entityType, entityId: $entityId, action: $action, before: $before, after: $after, actorUserId: $actorUserId, actorRole: $actorRole, houseId: $houseId, ip: $ip, occurredAt: $occurredAt)';
}


}

/// @nodoc
abstract mixin class $AuditLogCopyWith<$Res>  {
  factory $AuditLogCopyWith(AuditLog value, $Res Function(AuditLog) _then) = _$AuditLogCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'entity_type') String entityType,@JsonKey(name: 'entity_id') String entityId, String action, Map<String, dynamic>? before, Map<String, dynamic>? after,@JsonKey(name: 'actor_user_id') String? actorUserId,@JsonKey(name: 'actor_role') String? actorRole,@JsonKey(name: 'house_id') String? houseId, String? ip,@JsonKey(name: 'occurred_at') String occurredAt
});




}
/// @nodoc
class _$AuditLogCopyWithImpl<$Res>
    implements $AuditLogCopyWith<$Res> {
  _$AuditLogCopyWithImpl(this._self, this._then);

  final AuditLog _self;
  final $Res Function(AuditLog) _then;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? entityType = null,Object? entityId = null,Object? action = null,Object? before = freezed,Object? after = freezed,Object? actorUserId = freezed,Object? actorRole = freezed,Object? houseId = freezed,Object? ip = freezed,Object? occurredAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,entityId: null == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,before: freezed == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,after: freezed == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,actorUserId: freezed == actorUserId ? _self.actorUserId : actorUserId // ignore: cast_nullable_to_non_nullable
as String?,actorRole: freezed == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditLog].
extension AuditLogPatterns on AuditLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditLog value)  $default,){
final _that = this;
switch (_that) {
case _AuditLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditLog value)?  $default,){
final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'entity_type')  String entityType, @JsonKey(name: 'entity_id')  String entityId,  String action,  Map<String, dynamic>? before,  Map<String, dynamic>? after, @JsonKey(name: 'actor_user_id')  String? actorUserId, @JsonKey(name: 'actor_role')  String? actorRole, @JsonKey(name: 'house_id')  String? houseId,  String? ip, @JsonKey(name: 'occurred_at')  String occurredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that.id,_that.entityType,_that.entityId,_that.action,_that.before,_that.after,_that.actorUserId,_that.actorRole,_that.houseId,_that.ip,_that.occurredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'entity_type')  String entityType, @JsonKey(name: 'entity_id')  String entityId,  String action,  Map<String, dynamic>? before,  Map<String, dynamic>? after, @JsonKey(name: 'actor_user_id')  String? actorUserId, @JsonKey(name: 'actor_role')  String? actorRole, @JsonKey(name: 'house_id')  String? houseId,  String? ip, @JsonKey(name: 'occurred_at')  String occurredAt)  $default,) {final _that = this;
switch (_that) {
case _AuditLog():
return $default(_that.id,_that.entityType,_that.entityId,_that.action,_that.before,_that.after,_that.actorUserId,_that.actorRole,_that.houseId,_that.ip,_that.occurredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'entity_type')  String entityType, @JsonKey(name: 'entity_id')  String entityId,  String action,  Map<String, dynamic>? before,  Map<String, dynamic>? after, @JsonKey(name: 'actor_user_id')  String? actorUserId, @JsonKey(name: 'actor_role')  String? actorRole, @JsonKey(name: 'house_id')  String? houseId,  String? ip, @JsonKey(name: 'occurred_at')  String occurredAt)?  $default,) {final _that = this;
switch (_that) {
case _AuditLog() when $default != null:
return $default(_that.id,_that.entityType,_that.entityId,_that.action,_that.before,_that.after,_that.actorUserId,_that.actorRole,_that.houseId,_that.ip,_that.occurredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditLog implements AuditLog {
  const _AuditLog({required this.id, @JsonKey(name: 'entity_type') required this.entityType, @JsonKey(name: 'entity_id') required this.entityId, required this.action, final  Map<String, dynamic>? before, final  Map<String, dynamic>? after, @JsonKey(name: 'actor_user_id') this.actorUserId, @JsonKey(name: 'actor_role') this.actorRole, @JsonKey(name: 'house_id') this.houseId, this.ip, @JsonKey(name: 'occurred_at') required this.occurredAt}): _before = before,_after = after;
  factory _AuditLog.fromJson(Map<String, dynamic> json) => _$AuditLogFromJson(json);

@override final  String id;
@override@JsonKey(name: 'entity_type') final  String entityType;
@override@JsonKey(name: 'entity_id') final  String entityId;
@override final  String action;
 final  Map<String, dynamic>? _before;
@override Map<String, dynamic>? get before {
  final value = _before;
  if (value == null) return null;
  if (_before is EqualUnmodifiableMapView) return _before;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _after;
@override Map<String, dynamic>? get after {
  final value = _after;
  if (value == null) return null;
  if (_after is EqualUnmodifiableMapView) return _after;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'actor_user_id') final  String? actorUserId;
@override@JsonKey(name: 'actor_role') final  String? actorRole;
@override@JsonKey(name: 'house_id') final  String? houseId;
@override final  String? ip;
@override@JsonKey(name: 'occurred_at') final  String occurredAt;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditLogCopyWith<_AuditLog> get copyWith => __$AuditLogCopyWithImpl<_AuditLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditLog&&(identical(other.id, id) || other.id == id)&&(identical(other.entityType, entityType) || other.entityType == entityType)&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other._before, _before)&&const DeepCollectionEquality().equals(other._after, _after)&&(identical(other.actorUserId, actorUserId) || other.actorUserId == actorUserId)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,entityType,entityId,action,const DeepCollectionEquality().hash(_before),const DeepCollectionEquality().hash(_after),actorUserId,actorRole,houseId,ip,occurredAt);

@override
String toString() {
  return 'AuditLog(id: $id, entityType: $entityType, entityId: $entityId, action: $action, before: $before, after: $after, actorUserId: $actorUserId, actorRole: $actorRole, houseId: $houseId, ip: $ip, occurredAt: $occurredAt)';
}


}

/// @nodoc
abstract mixin class _$AuditLogCopyWith<$Res> implements $AuditLogCopyWith<$Res> {
  factory _$AuditLogCopyWith(_AuditLog value, $Res Function(_AuditLog) _then) = __$AuditLogCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'entity_type') String entityType,@JsonKey(name: 'entity_id') String entityId, String action, Map<String, dynamic>? before, Map<String, dynamic>? after,@JsonKey(name: 'actor_user_id') String? actorUserId,@JsonKey(name: 'actor_role') String? actorRole,@JsonKey(name: 'house_id') String? houseId, String? ip,@JsonKey(name: 'occurred_at') String occurredAt
});




}
/// @nodoc
class __$AuditLogCopyWithImpl<$Res>
    implements _$AuditLogCopyWith<$Res> {
  __$AuditLogCopyWithImpl(this._self, this._then);

  final _AuditLog _self;
  final $Res Function(_AuditLog) _then;

/// Create a copy of AuditLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? entityType = null,Object? entityId = null,Object? action = null,Object? before = freezed,Object? after = freezed,Object? actorUserId = freezed,Object? actorRole = freezed,Object? houseId = freezed,Object? ip = freezed,Object? occurredAt = null,}) {
  return _then(_AuditLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,entityType: null == entityType ? _self.entityType : entityType // ignore: cast_nullable_to_non_nullable
as String,entityId: null == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,before: freezed == before ? _self._before : before // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,after: freezed == after ? _self._after : after // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,actorUserId: freezed == actorUserId ? _self.actorUserId : actorUserId // ignore: cast_nullable_to_non_nullable
as String?,actorRole: freezed == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as String?,houseId: freezed == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String?,ip: freezed == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String?,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
