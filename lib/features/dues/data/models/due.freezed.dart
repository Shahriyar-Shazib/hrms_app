// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'due.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Due {

 String get id;@JsonKey(name: 'renter_id') String get renterId;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'room_id_at_creation') String? get roomIdAtCreation; String get head;@JsonKey(name: 'head_label') String get headLabel; String get amount;@JsonKey(name: 'paid_amount') String get paidAmount; String get outstanding;@JsonKey(name: 'due_date') String get dueDate; String get source; String? get reason; String get status;@JsonKey(name: 'linked_invoice_id') String? get linkedInvoiceId; Map<String, dynamic>? get metadata;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'paid_at') String? get paidAt;@JsonKey(name: 'waived_by') String? get waivedBy;@JsonKey(name: 'waive_reason') String? get waiveReason;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Due
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DueCopyWith<Due> get copyWith => _$DueCopyWithImpl<Due>(this as Due, _$identity);

  /// Serializes this Due to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Due&&(identical(other.id, id) || other.id == id)&&(identical(other.renterId, renterId) || other.renterId == renterId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.roomIdAtCreation, roomIdAtCreation) || other.roomIdAtCreation == roomIdAtCreation)&&(identical(other.head, head) || other.head == head)&&(identical(other.headLabel, headLabel) || other.headLabel == headLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.source, source) || other.source == source)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.linkedInvoiceId, linkedInvoiceId) || other.linkedInvoiceId == linkedInvoiceId)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.waivedBy, waivedBy) || other.waivedBy == waivedBy)&&(identical(other.waiveReason, waiveReason) || other.waiveReason == waiveReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,renterId,houseId,roomIdAtCreation,head,headLabel,amount,paidAmount,outstanding,dueDate,source,reason,status,linkedInvoiceId,const DeepCollectionEquality().hash(metadata),createdBy,paidAt,waivedBy,waiveReason,createdAt]);

@override
String toString() {
  return 'Due(id: $id, renterId: $renterId, houseId: $houseId, roomIdAtCreation: $roomIdAtCreation, head: $head, headLabel: $headLabel, amount: $amount, paidAmount: $paidAmount, outstanding: $outstanding, dueDate: $dueDate, source: $source, reason: $reason, status: $status, linkedInvoiceId: $linkedInvoiceId, metadata: $metadata, createdBy: $createdBy, paidAt: $paidAt, waivedBy: $waivedBy, waiveReason: $waiveReason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DueCopyWith<$Res>  {
  factory $DueCopyWith(Due value, $Res Function(Due) _then) = _$DueCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'renter_id') String renterId,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'room_id_at_creation') String? roomIdAtCreation, String head,@JsonKey(name: 'head_label') String headLabel, String amount,@JsonKey(name: 'paid_amount') String paidAmount, String outstanding,@JsonKey(name: 'due_date') String dueDate, String source, String? reason, String status,@JsonKey(name: 'linked_invoice_id') String? linkedInvoiceId, Map<String, dynamic>? metadata,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'paid_at') String? paidAt,@JsonKey(name: 'waived_by') String? waivedBy,@JsonKey(name: 'waive_reason') String? waiveReason,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$DueCopyWithImpl<$Res>
    implements $DueCopyWith<$Res> {
  _$DueCopyWithImpl(this._self, this._then);

  final Due _self;
  final $Res Function(Due) _then;

/// Create a copy of Due
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? renterId = null,Object? houseId = null,Object? roomIdAtCreation = freezed,Object? head = null,Object? headLabel = null,Object? amount = null,Object? paidAmount = null,Object? outstanding = null,Object? dueDate = null,Object? source = null,Object? reason = freezed,Object? status = null,Object? linkedInvoiceId = freezed,Object? metadata = freezed,Object? createdBy = null,Object? paidAt = freezed,Object? waivedBy = freezed,Object? waiveReason = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,renterId: null == renterId ? _self.renterId : renterId // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,roomIdAtCreation: freezed == roomIdAtCreation ? _self.roomIdAtCreation : roomIdAtCreation // ignore: cast_nullable_to_non_nullable
as String?,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,headLabel: null == headLabel ? _self.headLabel : headLabel // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,linkedInvoiceId: freezed == linkedInvoiceId ? _self.linkedInvoiceId : linkedInvoiceId // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String?,waivedBy: freezed == waivedBy ? _self.waivedBy : waivedBy // ignore: cast_nullable_to_non_nullable
as String?,waiveReason: freezed == waiveReason ? _self.waiveReason : waiveReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Due].
extension DuePatterns on Due {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Due value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Due() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Due value)  $default,){
final _that = this;
switch (_that) {
case _Due():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Due value)?  $default,){
final _that = this;
switch (_that) {
case _Due() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'renter_id')  String renterId, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_id_at_creation')  String? roomIdAtCreation,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String outstanding, @JsonKey(name: 'due_date')  String dueDate,  String source,  String? reason,  String status, @JsonKey(name: 'linked_invoice_id')  String? linkedInvoiceId,  Map<String, dynamic>? metadata, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'paid_at')  String? paidAt, @JsonKey(name: 'waived_by')  String? waivedBy, @JsonKey(name: 'waive_reason')  String? waiveReason, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Due() when $default != null:
return $default(_that.id,_that.renterId,_that.houseId,_that.roomIdAtCreation,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.source,_that.reason,_that.status,_that.linkedInvoiceId,_that.metadata,_that.createdBy,_that.paidAt,_that.waivedBy,_that.waiveReason,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'renter_id')  String renterId, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_id_at_creation')  String? roomIdAtCreation,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String outstanding, @JsonKey(name: 'due_date')  String dueDate,  String source,  String? reason,  String status, @JsonKey(name: 'linked_invoice_id')  String? linkedInvoiceId,  Map<String, dynamic>? metadata, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'paid_at')  String? paidAt, @JsonKey(name: 'waived_by')  String? waivedBy, @JsonKey(name: 'waive_reason')  String? waiveReason, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Due():
return $default(_that.id,_that.renterId,_that.houseId,_that.roomIdAtCreation,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.source,_that.reason,_that.status,_that.linkedInvoiceId,_that.metadata,_that.createdBy,_that.paidAt,_that.waivedBy,_that.waiveReason,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'renter_id')  String renterId, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_id_at_creation')  String? roomIdAtCreation,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String outstanding, @JsonKey(name: 'due_date')  String dueDate,  String source,  String? reason,  String status, @JsonKey(name: 'linked_invoice_id')  String? linkedInvoiceId,  Map<String, dynamic>? metadata, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'paid_at')  String? paidAt, @JsonKey(name: 'waived_by')  String? waivedBy, @JsonKey(name: 'waive_reason')  String? waiveReason, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Due() when $default != null:
return $default(_that.id,_that.renterId,_that.houseId,_that.roomIdAtCreation,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.source,_that.reason,_that.status,_that.linkedInvoiceId,_that.metadata,_that.createdBy,_that.paidAt,_that.waivedBy,_that.waiveReason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Due implements Due {
  const _Due({required this.id, @JsonKey(name: 'renter_id') required this.renterId, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'room_id_at_creation') this.roomIdAtCreation, required this.head, @JsonKey(name: 'head_label') required this.headLabel, required this.amount, @JsonKey(name: 'paid_amount') required this.paidAmount, required this.outstanding, @JsonKey(name: 'due_date') required this.dueDate, required this.source, this.reason, required this.status, @JsonKey(name: 'linked_invoice_id') this.linkedInvoiceId, final  Map<String, dynamic>? metadata, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'paid_at') this.paidAt, @JsonKey(name: 'waived_by') this.waivedBy, @JsonKey(name: 'waive_reason') this.waiveReason, @JsonKey(name: 'created_at') required this.createdAt}): _metadata = metadata;
  factory _Due.fromJson(Map<String, dynamic> json) => _$DueFromJson(json);

@override final  String id;
@override@JsonKey(name: 'renter_id') final  String renterId;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'room_id_at_creation') final  String? roomIdAtCreation;
@override final  String head;
@override@JsonKey(name: 'head_label') final  String headLabel;
@override final  String amount;
@override@JsonKey(name: 'paid_amount') final  String paidAmount;
@override final  String outstanding;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override final  String source;
@override final  String? reason;
@override final  String status;
@override@JsonKey(name: 'linked_invoice_id') final  String? linkedInvoiceId;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'paid_at') final  String? paidAt;
@override@JsonKey(name: 'waived_by') final  String? waivedBy;
@override@JsonKey(name: 'waive_reason') final  String? waiveReason;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of Due
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DueCopyWith<_Due> get copyWith => __$DueCopyWithImpl<_Due>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Due&&(identical(other.id, id) || other.id == id)&&(identical(other.renterId, renterId) || other.renterId == renterId)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.roomIdAtCreation, roomIdAtCreation) || other.roomIdAtCreation == roomIdAtCreation)&&(identical(other.head, head) || other.head == head)&&(identical(other.headLabel, headLabel) || other.headLabel == headLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.source, source) || other.source == source)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.linkedInvoiceId, linkedInvoiceId) || other.linkedInvoiceId == linkedInvoiceId)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.waivedBy, waivedBy) || other.waivedBy == waivedBy)&&(identical(other.waiveReason, waiveReason) || other.waiveReason == waiveReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,renterId,houseId,roomIdAtCreation,head,headLabel,amount,paidAmount,outstanding,dueDate,source,reason,status,linkedInvoiceId,const DeepCollectionEquality().hash(_metadata),createdBy,paidAt,waivedBy,waiveReason,createdAt]);

@override
String toString() {
  return 'Due(id: $id, renterId: $renterId, houseId: $houseId, roomIdAtCreation: $roomIdAtCreation, head: $head, headLabel: $headLabel, amount: $amount, paidAmount: $paidAmount, outstanding: $outstanding, dueDate: $dueDate, source: $source, reason: $reason, status: $status, linkedInvoiceId: $linkedInvoiceId, metadata: $metadata, createdBy: $createdBy, paidAt: $paidAt, waivedBy: $waivedBy, waiveReason: $waiveReason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DueCopyWith<$Res> implements $DueCopyWith<$Res> {
  factory _$DueCopyWith(_Due value, $Res Function(_Due) _then) = __$DueCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'renter_id') String renterId,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'room_id_at_creation') String? roomIdAtCreation, String head,@JsonKey(name: 'head_label') String headLabel, String amount,@JsonKey(name: 'paid_amount') String paidAmount, String outstanding,@JsonKey(name: 'due_date') String dueDate, String source, String? reason, String status,@JsonKey(name: 'linked_invoice_id') String? linkedInvoiceId, Map<String, dynamic>? metadata,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'paid_at') String? paidAt,@JsonKey(name: 'waived_by') String? waivedBy,@JsonKey(name: 'waive_reason') String? waiveReason,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$DueCopyWithImpl<$Res>
    implements _$DueCopyWith<$Res> {
  __$DueCopyWithImpl(this._self, this._then);

  final _Due _self;
  final $Res Function(_Due) _then;

/// Create a copy of Due
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? renterId = null,Object? houseId = null,Object? roomIdAtCreation = freezed,Object? head = null,Object? headLabel = null,Object? amount = null,Object? paidAmount = null,Object? outstanding = null,Object? dueDate = null,Object? source = null,Object? reason = freezed,Object? status = null,Object? linkedInvoiceId = freezed,Object? metadata = freezed,Object? createdBy = null,Object? paidAt = freezed,Object? waivedBy = freezed,Object? waiveReason = freezed,Object? createdAt = null,}) {
  return _then(_Due(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,renterId: null == renterId ? _self.renterId : renterId // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,roomIdAtCreation: freezed == roomIdAtCreation ? _self.roomIdAtCreation : roomIdAtCreation // ignore: cast_nullable_to_non_nullable
as String?,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,headLabel: null == headLabel ? _self.headLabel : headLabel // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,linkedInvoiceId: freezed == linkedInvoiceId ? _self.linkedInvoiceId : linkedInvoiceId // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String?,waivedBy: freezed == waivedBy ? _self.waivedBy : waivedBy // ignore: cast_nullable_to_non_nullable
as String?,waiveReason: freezed == waiveReason ? _self.waiveReason : waiveReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
