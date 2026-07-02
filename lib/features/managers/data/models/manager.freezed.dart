// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Manager {

 String get id; String get email;@JsonKey(name: 'full_name') String get fullName; String get role; String get status;@JsonKey(name: 'must_reset_password') bool get mustResetPassword;@JsonKey(name: 'parent_owner_id') String? get parentOwnerId;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Manager
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerCopyWith<Manager> get copyWith => _$ManagerCopyWithImpl<Manager>(this as Manager, _$identity);

  /// Serializes this Manager to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Manager&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.mustResetPassword, mustResetPassword) || other.mustResetPassword == mustResetPassword)&&(identical(other.parentOwnerId, parentOwnerId) || other.parentOwnerId == parentOwnerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,role,status,mustResetPassword,parentOwnerId,createdAt);

@override
String toString() {
  return 'Manager(id: $id, email: $email, fullName: $fullName, role: $role, status: $status, mustResetPassword: $mustResetPassword, parentOwnerId: $parentOwnerId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ManagerCopyWith<$Res>  {
  factory $ManagerCopyWith(Manager value, $Res Function(Manager) _then) = _$ManagerCopyWithImpl;
@useResult
$Res call({
 String id, String email,@JsonKey(name: 'full_name') String fullName, String role, String status,@JsonKey(name: 'must_reset_password') bool mustResetPassword,@JsonKey(name: 'parent_owner_id') String? parentOwnerId,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$ManagerCopyWithImpl<$Res>
    implements $ManagerCopyWith<$Res> {
  _$ManagerCopyWithImpl(this._self, this._then);

  final Manager _self;
  final $Res Function(Manager) _then;

/// Create a copy of Manager
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? role = null,Object? status = null,Object? mustResetPassword = null,Object? parentOwnerId = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,mustResetPassword: null == mustResetPassword ? _self.mustResetPassword : mustResetPassword // ignore: cast_nullable_to_non_nullable
as bool,parentOwnerId: freezed == parentOwnerId ? _self.parentOwnerId : parentOwnerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Manager].
extension ManagerPatterns on Manager {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Manager value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Manager() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Manager value)  $default,){
final _that = this;
switch (_that) {
case _Manager():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Manager value)?  $default,){
final _that = this;
switch (_that) {
case _Manager() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'full_name')  String fullName,  String role,  String status, @JsonKey(name: 'must_reset_password')  bool mustResetPassword, @JsonKey(name: 'parent_owner_id')  String? parentOwnerId, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Manager() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.role,_that.status,_that.mustResetPassword,_that.parentOwnerId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'full_name')  String fullName,  String role,  String status, @JsonKey(name: 'must_reset_password')  bool mustResetPassword, @JsonKey(name: 'parent_owner_id')  String? parentOwnerId, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Manager():
return $default(_that.id,_that.email,_that.fullName,_that.role,_that.status,_that.mustResetPassword,_that.parentOwnerId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email, @JsonKey(name: 'full_name')  String fullName,  String role,  String status, @JsonKey(name: 'must_reset_password')  bool mustResetPassword, @JsonKey(name: 'parent_owner_id')  String? parentOwnerId, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Manager() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.role,_that.status,_that.mustResetPassword,_that.parentOwnerId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Manager implements Manager {
  const _Manager({required this.id, required this.email, @JsonKey(name: 'full_name') required this.fullName, required this.role, required this.status, @JsonKey(name: 'must_reset_password') required this.mustResetPassword, @JsonKey(name: 'parent_owner_id') this.parentOwnerId, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Manager.fromJson(Map<String, dynamic> json) => _$ManagerFromJson(json);

@override final  String id;
@override final  String email;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String role;
@override final  String status;
@override@JsonKey(name: 'must_reset_password') final  bool mustResetPassword;
@override@JsonKey(name: 'parent_owner_id') final  String? parentOwnerId;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of Manager
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerCopyWith<_Manager> get copyWith => __$ManagerCopyWithImpl<_Manager>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Manager&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.mustResetPassword, mustResetPassword) || other.mustResetPassword == mustResetPassword)&&(identical(other.parentOwnerId, parentOwnerId) || other.parentOwnerId == parentOwnerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,role,status,mustResetPassword,parentOwnerId,createdAt);

@override
String toString() {
  return 'Manager(id: $id, email: $email, fullName: $fullName, role: $role, status: $status, mustResetPassword: $mustResetPassword, parentOwnerId: $parentOwnerId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ManagerCopyWith<$Res> implements $ManagerCopyWith<$Res> {
  factory _$ManagerCopyWith(_Manager value, $Res Function(_Manager) _then) = __$ManagerCopyWithImpl;
@override @useResult
$Res call({
 String id, String email,@JsonKey(name: 'full_name') String fullName, String role, String status,@JsonKey(name: 'must_reset_password') bool mustResetPassword,@JsonKey(name: 'parent_owner_id') String? parentOwnerId,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$ManagerCopyWithImpl<$Res>
    implements _$ManagerCopyWith<$Res> {
  __$ManagerCopyWithImpl(this._self, this._then);

  final _Manager _self;
  final $Res Function(_Manager) _then;

/// Create a copy of Manager
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? role = null,Object? status = null,Object? mustResetPassword = null,Object? parentOwnerId = freezed,Object? createdAt = null,}) {
  return _then(_Manager(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,mustResetPassword: null == mustResetPassword ? _self.mustResetPassword : mustResetPassword // ignore: cast_nullable_to_non_nullable
as bool,parentOwnerId: freezed == parentOwnerId ? _self.parentOwnerId : parentOwnerId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ManagerSummary {

 String get id;@JsonKey(name: 'full_name') String get fullName; String get email;
/// Create a copy of ManagerSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerSummaryCopyWith<ManagerSummary> get copyWith => _$ManagerSummaryCopyWithImpl<ManagerSummary>(this as ManagerSummary, _$identity);

  /// Serializes this ManagerSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email);

@override
String toString() {
  return 'ManagerSummary(id: $id, fullName: $fullName, email: $email)';
}


}

/// @nodoc
abstract mixin class $ManagerSummaryCopyWith<$Res>  {
  factory $ManagerSummaryCopyWith(ManagerSummary value, $Res Function(ManagerSummary) _then) = _$ManagerSummaryCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'full_name') String fullName, String email
});




}
/// @nodoc
class _$ManagerSummaryCopyWithImpl<$Res>
    implements $ManagerSummaryCopyWith<$Res> {
  _$ManagerSummaryCopyWithImpl(this._self, this._then);

  final ManagerSummary _self;
  final $Res Function(ManagerSummary) _then;

/// Create a copy of ManagerSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagerSummary].
extension ManagerSummaryPatterns on ManagerSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerSummary value)  $default,){
final _that = this;
switch (_that) {
case _ManagerSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'full_name')  String fullName,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerSummary() when $default != null:
return $default(_that.id,_that.fullName,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'full_name')  String fullName,  String email)  $default,) {final _that = this;
switch (_that) {
case _ManagerSummary():
return $default(_that.id,_that.fullName,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'full_name')  String fullName,  String email)?  $default,) {final _that = this;
switch (_that) {
case _ManagerSummary() when $default != null:
return $default(_that.id,_that.fullName,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagerSummary implements ManagerSummary {
  const _ManagerSummary({required this.id, @JsonKey(name: 'full_name') required this.fullName, required this.email});
  factory _ManagerSummary.fromJson(Map<String, dynamic> json) => _$ManagerSummaryFromJson(json);

@override final  String id;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String email;

/// Create a copy of ManagerSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerSummaryCopyWith<_ManagerSummary> get copyWith => __$ManagerSummaryCopyWithImpl<_ManagerSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email);

@override
String toString() {
  return 'ManagerSummary(id: $id, fullName: $fullName, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ManagerSummaryCopyWith<$Res> implements $ManagerSummaryCopyWith<$Res> {
  factory _$ManagerSummaryCopyWith(_ManagerSummary value, $Res Function(_ManagerSummary) _then) = __$ManagerSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'full_name') String fullName, String email
});




}
/// @nodoc
class __$ManagerSummaryCopyWithImpl<$Res>
    implements _$ManagerSummaryCopyWith<$Res> {
  __$ManagerSummaryCopyWithImpl(this._self, this._then);

  final _ManagerSummary _self;
  final $Res Function(_ManagerSummary) _then;

/// Create a copy of ManagerSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = null,}) {
  return _then(_ManagerSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HouseManagerAssignment {

 String get id;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'manager_user_id') String get managerUserId;@JsonKey(name: 'can_log_expenses') bool get canLogExpenses;@JsonKey(name: 'assigned_by') String? get assignedBy;@JsonKey(name: 'assigned_at') String? get assignedAt;@JsonKey(name: 'revoked_at') String? get revokedAt; ManagerSummary? get manager;
/// Create a copy of HouseManagerAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseManagerAssignmentCopyWith<HouseManagerAssignment> get copyWith => _$HouseManagerAssignmentCopyWithImpl<HouseManagerAssignment>(this as HouseManagerAssignment, _$identity);

  /// Serializes this HouseManagerAssignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseManagerAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.managerUserId, managerUserId) || other.managerUserId == managerUserId)&&(identical(other.canLogExpenses, canLogExpenses) || other.canLogExpenses == canLogExpenses)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt)&&(identical(other.revokedAt, revokedAt) || other.revokedAt == revokedAt)&&(identical(other.manager, manager) || other.manager == manager));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,managerUserId,canLogExpenses,assignedBy,assignedAt,revokedAt,manager);

@override
String toString() {
  return 'HouseManagerAssignment(id: $id, houseId: $houseId, managerUserId: $managerUserId, canLogExpenses: $canLogExpenses, assignedBy: $assignedBy, assignedAt: $assignedAt, revokedAt: $revokedAt, manager: $manager)';
}


}

/// @nodoc
abstract mixin class $HouseManagerAssignmentCopyWith<$Res>  {
  factory $HouseManagerAssignmentCopyWith(HouseManagerAssignment value, $Res Function(HouseManagerAssignment) _then) = _$HouseManagerAssignmentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'manager_user_id') String managerUserId,@JsonKey(name: 'can_log_expenses') bool canLogExpenses,@JsonKey(name: 'assigned_by') String? assignedBy,@JsonKey(name: 'assigned_at') String? assignedAt,@JsonKey(name: 'revoked_at') String? revokedAt, ManagerSummary? manager
});


$ManagerSummaryCopyWith<$Res>? get manager;

}
/// @nodoc
class _$HouseManagerAssignmentCopyWithImpl<$Res>
    implements $HouseManagerAssignmentCopyWith<$Res> {
  _$HouseManagerAssignmentCopyWithImpl(this._self, this._then);

  final HouseManagerAssignment _self;
  final $Res Function(HouseManagerAssignment) _then;

/// Create a copy of HouseManagerAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? managerUserId = null,Object? canLogExpenses = null,Object? assignedBy = freezed,Object? assignedAt = freezed,Object? revokedAt = freezed,Object? manager = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,managerUserId: null == managerUserId ? _self.managerUserId : managerUserId // ignore: cast_nullable_to_non_nullable
as String,canLogExpenses: null == canLogExpenses ? _self.canLogExpenses : canLogExpenses // ignore: cast_nullable_to_non_nullable
as bool,assignedBy: freezed == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String?,assignedAt: freezed == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as String?,revokedAt: freezed == revokedAt ? _self.revokedAt : revokedAt // ignore: cast_nullable_to_non_nullable
as String?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerSummary?,
  ));
}
/// Create a copy of HouseManagerAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerSummaryCopyWith<$Res>? get manager {
    if (_self.manager == null) {
    return null;
  }

  return $ManagerSummaryCopyWith<$Res>(_self.manager!, (value) {
    return _then(_self.copyWith(manager: value));
  });
}
}


/// Adds pattern-matching-related methods to [HouseManagerAssignment].
extension HouseManagerAssignmentPatterns on HouseManagerAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HouseManagerAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HouseManagerAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HouseManagerAssignment value)  $default,){
final _that = this;
switch (_that) {
case _HouseManagerAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HouseManagerAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _HouseManagerAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'manager_user_id')  String managerUserId, @JsonKey(name: 'can_log_expenses')  bool canLogExpenses, @JsonKey(name: 'assigned_by')  String? assignedBy, @JsonKey(name: 'assigned_at')  String? assignedAt, @JsonKey(name: 'revoked_at')  String? revokedAt,  ManagerSummary? manager)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseManagerAssignment() when $default != null:
return $default(_that.id,_that.houseId,_that.managerUserId,_that.canLogExpenses,_that.assignedBy,_that.assignedAt,_that.revokedAt,_that.manager);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'manager_user_id')  String managerUserId, @JsonKey(name: 'can_log_expenses')  bool canLogExpenses, @JsonKey(name: 'assigned_by')  String? assignedBy, @JsonKey(name: 'assigned_at')  String? assignedAt, @JsonKey(name: 'revoked_at')  String? revokedAt,  ManagerSummary? manager)  $default,) {final _that = this;
switch (_that) {
case _HouseManagerAssignment():
return $default(_that.id,_that.houseId,_that.managerUserId,_that.canLogExpenses,_that.assignedBy,_that.assignedAt,_that.revokedAt,_that.manager);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'manager_user_id')  String managerUserId, @JsonKey(name: 'can_log_expenses')  bool canLogExpenses, @JsonKey(name: 'assigned_by')  String? assignedBy, @JsonKey(name: 'assigned_at')  String? assignedAt, @JsonKey(name: 'revoked_at')  String? revokedAt,  ManagerSummary? manager)?  $default,) {final _that = this;
switch (_that) {
case _HouseManagerAssignment() when $default != null:
return $default(_that.id,_that.houseId,_that.managerUserId,_that.canLogExpenses,_that.assignedBy,_that.assignedAt,_that.revokedAt,_that.manager);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseManagerAssignment implements HouseManagerAssignment {
  const _HouseManagerAssignment({required this.id, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'manager_user_id') required this.managerUserId, @JsonKey(name: 'can_log_expenses') required this.canLogExpenses, @JsonKey(name: 'assigned_by') this.assignedBy, @JsonKey(name: 'assigned_at') this.assignedAt, @JsonKey(name: 'revoked_at') this.revokedAt, this.manager});
  factory _HouseManagerAssignment.fromJson(Map<String, dynamic> json) => _$HouseManagerAssignmentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'manager_user_id') final  String managerUserId;
@override@JsonKey(name: 'can_log_expenses') final  bool canLogExpenses;
@override@JsonKey(name: 'assigned_by') final  String? assignedBy;
@override@JsonKey(name: 'assigned_at') final  String? assignedAt;
@override@JsonKey(name: 'revoked_at') final  String? revokedAt;
@override final  ManagerSummary? manager;

/// Create a copy of HouseManagerAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseManagerAssignmentCopyWith<_HouseManagerAssignment> get copyWith => __$HouseManagerAssignmentCopyWithImpl<_HouseManagerAssignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseManagerAssignmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseManagerAssignment&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.managerUserId, managerUserId) || other.managerUserId == managerUserId)&&(identical(other.canLogExpenses, canLogExpenses) || other.canLogExpenses == canLogExpenses)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt)&&(identical(other.revokedAt, revokedAt) || other.revokedAt == revokedAt)&&(identical(other.manager, manager) || other.manager == manager));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,managerUserId,canLogExpenses,assignedBy,assignedAt,revokedAt,manager);

@override
String toString() {
  return 'HouseManagerAssignment(id: $id, houseId: $houseId, managerUserId: $managerUserId, canLogExpenses: $canLogExpenses, assignedBy: $assignedBy, assignedAt: $assignedAt, revokedAt: $revokedAt, manager: $manager)';
}


}

/// @nodoc
abstract mixin class _$HouseManagerAssignmentCopyWith<$Res> implements $HouseManagerAssignmentCopyWith<$Res> {
  factory _$HouseManagerAssignmentCopyWith(_HouseManagerAssignment value, $Res Function(_HouseManagerAssignment) _then) = __$HouseManagerAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'manager_user_id') String managerUserId,@JsonKey(name: 'can_log_expenses') bool canLogExpenses,@JsonKey(name: 'assigned_by') String? assignedBy,@JsonKey(name: 'assigned_at') String? assignedAt,@JsonKey(name: 'revoked_at') String? revokedAt, ManagerSummary? manager
});


@override $ManagerSummaryCopyWith<$Res>? get manager;

}
/// @nodoc
class __$HouseManagerAssignmentCopyWithImpl<$Res>
    implements _$HouseManagerAssignmentCopyWith<$Res> {
  __$HouseManagerAssignmentCopyWithImpl(this._self, this._then);

  final _HouseManagerAssignment _self;
  final $Res Function(_HouseManagerAssignment) _then;

/// Create a copy of HouseManagerAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? managerUserId = null,Object? canLogExpenses = null,Object? assignedBy = freezed,Object? assignedAt = freezed,Object? revokedAt = freezed,Object? manager = freezed,}) {
  return _then(_HouseManagerAssignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,managerUserId: null == managerUserId ? _self.managerUserId : managerUserId // ignore: cast_nullable_to_non_nullable
as String,canLogExpenses: null == canLogExpenses ? _self.canLogExpenses : canLogExpenses // ignore: cast_nullable_to_non_nullable
as bool,assignedBy: freezed == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String?,assignedAt: freezed == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as String?,revokedAt: freezed == revokedAt ? _self.revokedAt : revokedAt // ignore: cast_nullable_to_non_nullable
as String?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerSummary?,
  ));
}

/// Create a copy of HouseManagerAssignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerSummaryCopyWith<$Res>? get manager {
    if (_self.manager == null) {
    return null;
  }

  return $ManagerSummaryCopyWith<$Res>(_self.manager!, (value) {
    return _then(_self.copyWith(manager: value));
  });
}
}

// dart format on
