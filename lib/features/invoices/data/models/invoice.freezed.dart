// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Invoice {

 String get id;@JsonKey(name: 'house_id') String get houseId;@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'renter_id') String get renterId;@JsonKey(name: 'billing_period_year') int get billingPeriodYear;@JsonKey(name: 'billing_period_month') int get billingPeriodMonth;@JsonKey(name: 'base_rent') String get baseRent;@JsonKey(name: 'electricity_amount') String get electricityAmount;@JsonKey(name: 'total_amount') String get totalAmount;@JsonKey(name: 'paid_amount') String get paidAmount; String get status;@JsonKey(name: 'issued_at') String get issuedAt;@JsonKey(name: 'due_date') String get dueDate;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'line_items') List<LineItem>? get lineItems;
/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceCopyWith<Invoice> get copyWith => _$InvoiceCopyWithImpl<Invoice>(this as Invoice, _$identity);

  /// Serializes this Invoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invoice&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.renterId, renterId) || other.renterId == renterId)&&(identical(other.billingPeriodYear, billingPeriodYear) || other.billingPeriodYear == billingPeriodYear)&&(identical(other.billingPeriodMonth, billingPeriodMonth) || other.billingPeriodMonth == billingPeriodMonth)&&(identical(other.baseRent, baseRent) || other.baseRent == baseRent)&&(identical(other.electricityAmount, electricityAmount) || other.electricityAmount == electricityAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.lineItems, lineItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,roomId,renterId,billingPeriodYear,billingPeriodMonth,baseRent,electricityAmount,totalAmount,paidAmount,status,issuedAt,dueDate,createdAt,const DeepCollectionEquality().hash(lineItems));

@override
String toString() {
  return 'Invoice(id: $id, houseId: $houseId, roomId: $roomId, renterId: $renterId, billingPeriodYear: $billingPeriodYear, billingPeriodMonth: $billingPeriodMonth, baseRent: $baseRent, electricityAmount: $electricityAmount, totalAmount: $totalAmount, paidAmount: $paidAmount, status: $status, issuedAt: $issuedAt, dueDate: $dueDate, createdAt: $createdAt, lineItems: $lineItems)';
}


}

/// @nodoc
abstract mixin class $InvoiceCopyWith<$Res>  {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) _then) = _$InvoiceCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'renter_id') String renterId,@JsonKey(name: 'billing_period_year') int billingPeriodYear,@JsonKey(name: 'billing_period_month') int billingPeriodMonth,@JsonKey(name: 'base_rent') String baseRent,@JsonKey(name: 'electricity_amount') String electricityAmount,@JsonKey(name: 'total_amount') String totalAmount,@JsonKey(name: 'paid_amount') String paidAmount, String status,@JsonKey(name: 'issued_at') String issuedAt,@JsonKey(name: 'due_date') String dueDate,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'line_items') List<LineItem>? lineItems
});




}
/// @nodoc
class _$InvoiceCopyWithImpl<$Res>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._self, this._then);

  final Invoice _self;
  final $Res Function(Invoice) _then;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? roomId = null,Object? renterId = null,Object? billingPeriodYear = null,Object? billingPeriodMonth = null,Object? baseRent = null,Object? electricityAmount = null,Object? totalAmount = null,Object? paidAmount = null,Object? status = null,Object? issuedAt = null,Object? dueDate = null,Object? createdAt = null,Object? lineItems = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,renterId: null == renterId ? _self.renterId : renterId // ignore: cast_nullable_to_non_nullable
as String,billingPeriodYear: null == billingPeriodYear ? _self.billingPeriodYear : billingPeriodYear // ignore: cast_nullable_to_non_nullable
as int,billingPeriodMonth: null == billingPeriodMonth ? _self.billingPeriodMonth : billingPeriodMonth // ignore: cast_nullable_to_non_nullable
as int,baseRent: null == baseRent ? _self.baseRent : baseRent // ignore: cast_nullable_to_non_nullable
as String,electricityAmount: null == electricityAmount ? _self.electricityAmount : electricityAmount // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lineItems: freezed == lineItems ? _self.lineItems : lineItems // ignore: cast_nullable_to_non_nullable
as List<LineItem>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Invoice].
extension InvoicePatterns on Invoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Invoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Invoice value)  $default,){
final _that = this;
switch (_that) {
case _Invoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Invoice value)?  $default,){
final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'renter_id')  String renterId, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'base_rent')  String baseRent, @JsonKey(name: 'electricity_amount')  String electricityAmount, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'line_items')  List<LineItem>? lineItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Invoice() when $default != null:
return $default(_that.id,_that.houseId,_that.roomId,_that.renterId,_that.billingPeriodYear,_that.billingPeriodMonth,_that.baseRent,_that.electricityAmount,_that.totalAmount,_that.paidAmount,_that.status,_that.issuedAt,_that.dueDate,_that.createdAt,_that.lineItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'renter_id')  String renterId, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'base_rent')  String baseRent, @JsonKey(name: 'electricity_amount')  String electricityAmount, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'line_items')  List<LineItem>? lineItems)  $default,) {final _that = this;
switch (_that) {
case _Invoice():
return $default(_that.id,_that.houseId,_that.roomId,_that.renterId,_that.billingPeriodYear,_that.billingPeriodMonth,_that.baseRent,_that.electricityAmount,_that.totalAmount,_that.paidAmount,_that.status,_that.issuedAt,_that.dueDate,_that.createdAt,_that.lineItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'house_id')  String houseId, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'renter_id')  String renterId, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'base_rent')  String baseRent, @JsonKey(name: 'electricity_amount')  String electricityAmount, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'line_items')  List<LineItem>? lineItems)?  $default,) {final _that = this;
switch (_that) {
case _Invoice() when $default != null:
return $default(_that.id,_that.houseId,_that.roomId,_that.renterId,_that.billingPeriodYear,_that.billingPeriodMonth,_that.baseRent,_that.electricityAmount,_that.totalAmount,_that.paidAmount,_that.status,_that.issuedAt,_that.dueDate,_that.createdAt,_that.lineItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Invoice implements Invoice {
  const _Invoice({required this.id, @JsonKey(name: 'house_id') required this.houseId, @JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'renter_id') required this.renterId, @JsonKey(name: 'billing_period_year') required this.billingPeriodYear, @JsonKey(name: 'billing_period_month') required this.billingPeriodMonth, @JsonKey(name: 'base_rent') required this.baseRent, @JsonKey(name: 'electricity_amount') required this.electricityAmount, @JsonKey(name: 'total_amount') required this.totalAmount, @JsonKey(name: 'paid_amount') required this.paidAmount, required this.status, @JsonKey(name: 'issued_at') required this.issuedAt, @JsonKey(name: 'due_date') required this.dueDate, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'line_items') final  List<LineItem>? lineItems}): _lineItems = lineItems;
  factory _Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

@override final  String id;
@override@JsonKey(name: 'house_id') final  String houseId;
@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'renter_id') final  String renterId;
@override@JsonKey(name: 'billing_period_year') final  int billingPeriodYear;
@override@JsonKey(name: 'billing_period_month') final  int billingPeriodMonth;
@override@JsonKey(name: 'base_rent') final  String baseRent;
@override@JsonKey(name: 'electricity_amount') final  String electricityAmount;
@override@JsonKey(name: 'total_amount') final  String totalAmount;
@override@JsonKey(name: 'paid_amount') final  String paidAmount;
@override final  String status;
@override@JsonKey(name: 'issued_at') final  String issuedAt;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override@JsonKey(name: 'created_at') final  String createdAt;
 final  List<LineItem>? _lineItems;
@override@JsonKey(name: 'line_items') List<LineItem>? get lineItems {
  final value = _lineItems;
  if (value == null) return null;
  if (_lineItems is EqualUnmodifiableListView) return _lineItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceCopyWith<_Invoice> get copyWith => __$InvoiceCopyWithImpl<_Invoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invoice&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.renterId, renterId) || other.renterId == renterId)&&(identical(other.billingPeriodYear, billingPeriodYear) || other.billingPeriodYear == billingPeriodYear)&&(identical(other.billingPeriodMonth, billingPeriodMonth) || other.billingPeriodMonth == billingPeriodMonth)&&(identical(other.baseRent, baseRent) || other.baseRent == baseRent)&&(identical(other.electricityAmount, electricityAmount) || other.electricityAmount == electricityAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._lineItems, _lineItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,roomId,renterId,billingPeriodYear,billingPeriodMonth,baseRent,electricityAmount,totalAmount,paidAmount,status,issuedAt,dueDate,createdAt,const DeepCollectionEquality().hash(_lineItems));

@override
String toString() {
  return 'Invoice(id: $id, houseId: $houseId, roomId: $roomId, renterId: $renterId, billingPeriodYear: $billingPeriodYear, billingPeriodMonth: $billingPeriodMonth, baseRent: $baseRent, electricityAmount: $electricityAmount, totalAmount: $totalAmount, paidAmount: $paidAmount, status: $status, issuedAt: $issuedAt, dueDate: $dueDate, createdAt: $createdAt, lineItems: $lineItems)';
}


}

/// @nodoc
abstract mixin class _$InvoiceCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$InvoiceCopyWith(_Invoice value, $Res Function(_Invoice) _then) = __$InvoiceCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'renter_id') String renterId,@JsonKey(name: 'billing_period_year') int billingPeriodYear,@JsonKey(name: 'billing_period_month') int billingPeriodMonth,@JsonKey(name: 'base_rent') String baseRent,@JsonKey(name: 'electricity_amount') String electricityAmount,@JsonKey(name: 'total_amount') String totalAmount,@JsonKey(name: 'paid_amount') String paidAmount, String status,@JsonKey(name: 'issued_at') String issuedAt,@JsonKey(name: 'due_date') String dueDate,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'line_items') List<LineItem>? lineItems
});




}
/// @nodoc
class __$InvoiceCopyWithImpl<$Res>
    implements _$InvoiceCopyWith<$Res> {
  __$InvoiceCopyWithImpl(this._self, this._then);

  final _Invoice _self;
  final $Res Function(_Invoice) _then;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? roomId = null,Object? renterId = null,Object? billingPeriodYear = null,Object? billingPeriodMonth = null,Object? baseRent = null,Object? electricityAmount = null,Object? totalAmount = null,Object? paidAmount = null,Object? status = null,Object? issuedAt = null,Object? dueDate = null,Object? createdAt = null,Object? lineItems = freezed,}) {
  return _then(_Invoice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,renterId: null == renterId ? _self.renterId : renterId // ignore: cast_nullable_to_non_nullable
as String,billingPeriodYear: null == billingPeriodYear ? _self.billingPeriodYear : billingPeriodYear // ignore: cast_nullable_to_non_nullable
as int,billingPeriodMonth: null == billingPeriodMonth ? _self.billingPeriodMonth : billingPeriodMonth // ignore: cast_nullable_to_non_nullable
as int,baseRent: null == baseRent ? _self.baseRent : baseRent // ignore: cast_nullable_to_non_nullable
as String,electricityAmount: null == electricityAmount ? _self.electricityAmount : electricityAmount // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lineItems: freezed == lineItems ? _self._lineItems : lineItems // ignore: cast_nullable_to_non_nullable
as List<LineItem>?,
  ));
}


}


/// @nodoc
mixin _$GenerateWarning {

 String get type;@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'room_number') String get roomNumber;
/// Create a copy of GenerateWarning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateWarningCopyWith<GenerateWarning> get copyWith => _$GenerateWarningCopyWithImpl<GenerateWarning>(this as GenerateWarning, _$identity);

  /// Serializes this GenerateWarning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateWarning&&(identical(other.type, type) || other.type == type)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,roomId,roomNumber);

@override
String toString() {
  return 'GenerateWarning(type: $type, roomId: $roomId, roomNumber: $roomNumber)';
}


}

/// @nodoc
abstract mixin class $GenerateWarningCopyWith<$Res>  {
  factory $GenerateWarningCopyWith(GenerateWarning value, $Res Function(GenerateWarning) _then) = _$GenerateWarningCopyWithImpl;
@useResult
$Res call({
 String type,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'room_number') String roomNumber
});




}
/// @nodoc
class _$GenerateWarningCopyWithImpl<$Res>
    implements $GenerateWarningCopyWith<$Res> {
  _$GenerateWarningCopyWithImpl(this._self, this._then);

  final GenerateWarning _self;
  final $Res Function(GenerateWarning) _then;

/// Create a copy of GenerateWarning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? roomId = null,Object? roomNumber = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateWarning].
extension GenerateWarningPatterns on GenerateWarning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateWarning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateWarning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateWarning value)  $default,){
final _that = this;
switch (_that) {
case _GenerateWarning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateWarning value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateWarning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateWarning() when $default != null:
return $default(_that.type,_that.roomId,_that.roomNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber)  $default,) {final _that = this;
switch (_that) {
case _GenerateWarning():
return $default(_that.type,_that.roomId,_that.roomNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type, @JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber)?  $default,) {final _that = this;
switch (_that) {
case _GenerateWarning() when $default != null:
return $default(_that.type,_that.roomId,_that.roomNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateWarning implements GenerateWarning {
  const _GenerateWarning({required this.type, @JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'room_number') required this.roomNumber});
  factory _GenerateWarning.fromJson(Map<String, dynamic> json) => _$GenerateWarningFromJson(json);

@override final  String type;
@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'room_number') final  String roomNumber;

/// Create a copy of GenerateWarning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateWarningCopyWith<_GenerateWarning> get copyWith => __$GenerateWarningCopyWithImpl<_GenerateWarning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateWarningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateWarning&&(identical(other.type, type) || other.type == type)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,roomId,roomNumber);

@override
String toString() {
  return 'GenerateWarning(type: $type, roomId: $roomId, roomNumber: $roomNumber)';
}


}

/// @nodoc
abstract mixin class _$GenerateWarningCopyWith<$Res> implements $GenerateWarningCopyWith<$Res> {
  factory _$GenerateWarningCopyWith(_GenerateWarning value, $Res Function(_GenerateWarning) _then) = __$GenerateWarningCopyWithImpl;
@override @useResult
$Res call({
 String type,@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'room_number') String roomNumber
});




}
/// @nodoc
class __$GenerateWarningCopyWithImpl<$Res>
    implements _$GenerateWarningCopyWith<$Res> {
  __$GenerateWarningCopyWithImpl(this._self, this._then);

  final _GenerateWarning _self;
  final $Res Function(_GenerateWarning) _then;

/// Create a copy of GenerateWarning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? roomId = null,Object? roomNumber = null,}) {
  return _then(_GenerateWarning(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GenerateResult {

@JsonKey(name: 'already_generated') bool get alreadyGenerated; List<Invoice> get invoices; List<GenerateWarning> get warnings; List<Map<String, dynamic>> get skipped;@JsonKey(name: 'closed_invoices') List<Invoice> get closedInvoices;@JsonKey(name: 'dues_created') List<Map<String, dynamic>> get duesCreated;
/// Create a copy of GenerateResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateResultCopyWith<GenerateResult> get copyWith => _$GenerateResultCopyWithImpl<GenerateResult>(this as GenerateResult, _$identity);

  /// Serializes this GenerateResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateResult&&(identical(other.alreadyGenerated, alreadyGenerated) || other.alreadyGenerated == alreadyGenerated)&&const DeepCollectionEquality().equals(other.invoices, invoices)&&const DeepCollectionEquality().equals(other.warnings, warnings)&&const DeepCollectionEquality().equals(other.skipped, skipped)&&const DeepCollectionEquality().equals(other.closedInvoices, closedInvoices)&&const DeepCollectionEquality().equals(other.duesCreated, duesCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alreadyGenerated,const DeepCollectionEquality().hash(invoices),const DeepCollectionEquality().hash(warnings),const DeepCollectionEquality().hash(skipped),const DeepCollectionEquality().hash(closedInvoices),const DeepCollectionEquality().hash(duesCreated));

@override
String toString() {
  return 'GenerateResult(alreadyGenerated: $alreadyGenerated, invoices: $invoices, warnings: $warnings, skipped: $skipped, closedInvoices: $closedInvoices, duesCreated: $duesCreated)';
}


}

/// @nodoc
abstract mixin class $GenerateResultCopyWith<$Res>  {
  factory $GenerateResultCopyWith(GenerateResult value, $Res Function(GenerateResult) _then) = _$GenerateResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'already_generated') bool alreadyGenerated, List<Invoice> invoices, List<GenerateWarning> warnings, List<Map<String, dynamic>> skipped,@JsonKey(name: 'closed_invoices') List<Invoice> closedInvoices,@JsonKey(name: 'dues_created') List<Map<String, dynamic>> duesCreated
});




}
/// @nodoc
class _$GenerateResultCopyWithImpl<$Res>
    implements $GenerateResultCopyWith<$Res> {
  _$GenerateResultCopyWithImpl(this._self, this._then);

  final GenerateResult _self;
  final $Res Function(GenerateResult) _then;

/// Create a copy of GenerateResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alreadyGenerated = null,Object? invoices = null,Object? warnings = null,Object? skipped = null,Object? closedInvoices = null,Object? duesCreated = null,}) {
  return _then(_self.copyWith(
alreadyGenerated: null == alreadyGenerated ? _self.alreadyGenerated : alreadyGenerated // ignore: cast_nullable_to_non_nullable
as bool,invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<GenerateWarning>,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,closedInvoices: null == closedInvoices ? _self.closedInvoices : closedInvoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>,duesCreated: null == duesCreated ? _self.duesCreated : duesCreated // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [GenerateResult].
extension GenerateResultPatterns on GenerateResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenerateResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenerateResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenerateResult value)  $default,){
final _that = this;
switch (_that) {
case _GenerateResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenerateResult value)?  $default,){
final _that = this;
switch (_that) {
case _GenerateResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'already_generated')  bool alreadyGenerated,  List<Invoice> invoices,  List<GenerateWarning> warnings,  List<Map<String, dynamic>> skipped, @JsonKey(name: 'closed_invoices')  List<Invoice> closedInvoices, @JsonKey(name: 'dues_created')  List<Map<String, dynamic>> duesCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenerateResult() when $default != null:
return $default(_that.alreadyGenerated,_that.invoices,_that.warnings,_that.skipped,_that.closedInvoices,_that.duesCreated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'already_generated')  bool alreadyGenerated,  List<Invoice> invoices,  List<GenerateWarning> warnings,  List<Map<String, dynamic>> skipped, @JsonKey(name: 'closed_invoices')  List<Invoice> closedInvoices, @JsonKey(name: 'dues_created')  List<Map<String, dynamic>> duesCreated)  $default,) {final _that = this;
switch (_that) {
case _GenerateResult():
return $default(_that.alreadyGenerated,_that.invoices,_that.warnings,_that.skipped,_that.closedInvoices,_that.duesCreated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'already_generated')  bool alreadyGenerated,  List<Invoice> invoices,  List<GenerateWarning> warnings,  List<Map<String, dynamic>> skipped, @JsonKey(name: 'closed_invoices')  List<Invoice> closedInvoices, @JsonKey(name: 'dues_created')  List<Map<String, dynamic>> duesCreated)?  $default,) {final _that = this;
switch (_that) {
case _GenerateResult() when $default != null:
return $default(_that.alreadyGenerated,_that.invoices,_that.warnings,_that.skipped,_that.closedInvoices,_that.duesCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenerateResult implements GenerateResult {
  const _GenerateResult({@JsonKey(name: 'already_generated') required this.alreadyGenerated, final  List<Invoice> invoices = const <Invoice>[], final  List<GenerateWarning> warnings = const <GenerateWarning>[], final  List<Map<String, dynamic>> skipped = const <Map<String, dynamic>>[], @JsonKey(name: 'closed_invoices') final  List<Invoice> closedInvoices = const <Invoice>[], @JsonKey(name: 'dues_created') final  List<Map<String, dynamic>> duesCreated = const <Map<String, dynamic>>[]}): _invoices = invoices,_warnings = warnings,_skipped = skipped,_closedInvoices = closedInvoices,_duesCreated = duesCreated;
  factory _GenerateResult.fromJson(Map<String, dynamic> json) => _$GenerateResultFromJson(json);

@override@JsonKey(name: 'already_generated') final  bool alreadyGenerated;
 final  List<Invoice> _invoices;
@override@JsonKey() List<Invoice> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

 final  List<GenerateWarning> _warnings;
@override@JsonKey() List<GenerateWarning> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}

 final  List<Map<String, dynamic>> _skipped;
@override@JsonKey() List<Map<String, dynamic>> get skipped {
  if (_skipped is EqualUnmodifiableListView) return _skipped;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skipped);
}

 final  List<Invoice> _closedInvoices;
@override@JsonKey(name: 'closed_invoices') List<Invoice> get closedInvoices {
  if (_closedInvoices is EqualUnmodifiableListView) return _closedInvoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_closedInvoices);
}

 final  List<Map<String, dynamic>> _duesCreated;
@override@JsonKey(name: 'dues_created') List<Map<String, dynamic>> get duesCreated {
  if (_duesCreated is EqualUnmodifiableListView) return _duesCreated;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_duesCreated);
}


/// Create a copy of GenerateResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateResultCopyWith<_GenerateResult> get copyWith => __$GenerateResultCopyWithImpl<_GenerateResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateResult&&(identical(other.alreadyGenerated, alreadyGenerated) || other.alreadyGenerated == alreadyGenerated)&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&const DeepCollectionEquality().equals(other._warnings, _warnings)&&const DeepCollectionEquality().equals(other._skipped, _skipped)&&const DeepCollectionEquality().equals(other._closedInvoices, _closedInvoices)&&const DeepCollectionEquality().equals(other._duesCreated, _duesCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alreadyGenerated,const DeepCollectionEquality().hash(_invoices),const DeepCollectionEquality().hash(_warnings),const DeepCollectionEquality().hash(_skipped),const DeepCollectionEquality().hash(_closedInvoices),const DeepCollectionEquality().hash(_duesCreated));

@override
String toString() {
  return 'GenerateResult(alreadyGenerated: $alreadyGenerated, invoices: $invoices, warnings: $warnings, skipped: $skipped, closedInvoices: $closedInvoices, duesCreated: $duesCreated)';
}


}

/// @nodoc
abstract mixin class _$GenerateResultCopyWith<$Res> implements $GenerateResultCopyWith<$Res> {
  factory _$GenerateResultCopyWith(_GenerateResult value, $Res Function(_GenerateResult) _then) = __$GenerateResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'already_generated') bool alreadyGenerated, List<Invoice> invoices, List<GenerateWarning> warnings, List<Map<String, dynamic>> skipped,@JsonKey(name: 'closed_invoices') List<Invoice> closedInvoices,@JsonKey(name: 'dues_created') List<Map<String, dynamic>> duesCreated
});




}
/// @nodoc
class __$GenerateResultCopyWithImpl<$Res>
    implements _$GenerateResultCopyWith<$Res> {
  __$GenerateResultCopyWithImpl(this._self, this._then);

  final _GenerateResult _self;
  final $Res Function(_GenerateResult) _then;

/// Create a copy of GenerateResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alreadyGenerated = null,Object? invoices = null,Object? warnings = null,Object? skipped = null,Object? closedInvoices = null,Object? duesCreated = null,}) {
  return _then(_GenerateResult(
alreadyGenerated: null == alreadyGenerated ? _self.alreadyGenerated : alreadyGenerated // ignore: cast_nullable_to_non_nullable
as bool,invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>,warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<GenerateWarning>,skipped: null == skipped ? _self._skipped : skipped // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,closedInvoices: null == closedInvoices ? _self._closedInvoices : closedInvoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>,duesCreated: null == duesCreated ? _self._duesCreated : duesCreated // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
