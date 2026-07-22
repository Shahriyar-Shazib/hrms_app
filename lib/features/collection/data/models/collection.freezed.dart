// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LineItem {

 String get id; String get head; String get label; String get amount; Map<String, dynamic>? get metadata;
/// Create a copy of LineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineItemCopyWith<LineItem> get copyWith => _$LineItemCopyWithImpl<LineItem>(this as LineItem, _$identity);

  /// Serializes this LineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineItem&&(identical(other.id, id) || other.id == id)&&(identical(other.head, head) || other.head == head)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,head,label,amount,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'LineItem(id: $id, head: $head, label: $label, amount: $amount, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $LineItemCopyWith<$Res>  {
  factory $LineItemCopyWith(LineItem value, $Res Function(LineItem) _then) = _$LineItemCopyWithImpl;
@useResult
$Res call({
 String id, String head, String label, String amount, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$LineItemCopyWithImpl<$Res>
    implements $LineItemCopyWith<$Res> {
  _$LineItemCopyWithImpl(this._self, this._then);

  final LineItem _self;
  final $Res Function(LineItem) _then;

/// Create a copy of LineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? head = null,Object? label = null,Object? amount = null,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LineItem].
extension LineItemPatterns on LineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LineItem value)  $default,){
final _that = this;
switch (_that) {
case _LineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LineItem value)?  $default,){
final _that = this;
switch (_that) {
case _LineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String head,  String label,  String amount,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LineItem() when $default != null:
return $default(_that.id,_that.head,_that.label,_that.amount,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String head,  String label,  String amount,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _LineItem():
return $default(_that.id,_that.head,_that.label,_that.amount,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String head,  String label,  String amount,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _LineItem() when $default != null:
return $default(_that.id,_that.head,_that.label,_that.amount,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LineItem implements LineItem {
  const _LineItem({required this.id, required this.head, required this.label, required this.amount, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _LineItem.fromJson(Map<String, dynamic> json) => _$LineItemFromJson(json);

@override final  String id;
@override final  String head;
@override final  String label;
@override final  String amount;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of LineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineItemCopyWith<_LineItem> get copyWith => __$LineItemCopyWithImpl<_LineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineItem&&(identical(other.id, id) || other.id == id)&&(identical(other.head, head) || other.head == head)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,head,label,amount,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'LineItem(id: $id, head: $head, label: $label, amount: $amount, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$LineItemCopyWith<$Res> implements $LineItemCopyWith<$Res> {
  factory _$LineItemCopyWith(_LineItem value, $Res Function(_LineItem) _then) = __$LineItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String head, String label, String amount, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$LineItemCopyWithImpl<$Res>
    implements _$LineItemCopyWith<$Res> {
  __$LineItemCopyWithImpl(this._self, this._then);

  final _LineItem _self;
  final $Res Function(_LineItem) _then;

/// Create a copy of LineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? head = null,Object? label = null,Object? amount = null,Object? metadata = freezed,}) {
  return _then(_LineItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$ElectricityWarning {

@JsonKey(name: 'room_id') String get roomId;@JsonKey(name: 'room_number') String get roomNumber; String get message;
/// Create a copy of ElectricityWarning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectricityWarningCopyWith<ElectricityWarning> get copyWith => _$ElectricityWarningCopyWithImpl<ElectricityWarning>(this as ElectricityWarning, _$identity);

  /// Serializes this ElectricityWarning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectricityWarning&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,roomNumber,message);

@override
String toString() {
  return 'ElectricityWarning(roomId: $roomId, roomNumber: $roomNumber, message: $message)';
}


}

/// @nodoc
abstract mixin class $ElectricityWarningCopyWith<$Res>  {
  factory $ElectricityWarningCopyWith(ElectricityWarning value, $Res Function(ElectricityWarning) _then) = _$ElectricityWarningCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'room_number') String roomNumber, String message
});




}
/// @nodoc
class _$ElectricityWarningCopyWithImpl<$Res>
    implements $ElectricityWarningCopyWith<$Res> {
  _$ElectricityWarningCopyWithImpl(this._self, this._then);

  final ElectricityWarning _self;
  final $Res Function(ElectricityWarning) _then;

/// Create a copy of ElectricityWarning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? roomNumber = null,Object? message = null,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ElectricityWarning].
extension ElectricityWarningPatterns on ElectricityWarning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectricityWarning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectricityWarning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectricityWarning value)  $default,){
final _that = this;
switch (_that) {
case _ElectricityWarning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectricityWarning value)?  $default,){
final _that = this;
switch (_that) {
case _ElectricityWarning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectricityWarning() when $default != null:
return $default(_that.roomId,_that.roomNumber,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber,  String message)  $default,) {final _that = this;
switch (_that) {
case _ElectricityWarning():
return $default(_that.roomId,_that.roomNumber,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'room_id')  String roomId, @JsonKey(name: 'room_number')  String roomNumber,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ElectricityWarning() when $default != null:
return $default(_that.roomId,_that.roomNumber,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectricityWarning implements ElectricityWarning {
  const _ElectricityWarning({@JsonKey(name: 'room_id') required this.roomId, @JsonKey(name: 'room_number') required this.roomNumber, required this.message});
  factory _ElectricityWarning.fromJson(Map<String, dynamic> json) => _$ElectricityWarningFromJson(json);

@override@JsonKey(name: 'room_id') final  String roomId;
@override@JsonKey(name: 'room_number') final  String roomNumber;
@override final  String message;

/// Create a copy of ElectricityWarning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectricityWarningCopyWith<_ElectricityWarning> get copyWith => __$ElectricityWarningCopyWithImpl<_ElectricityWarning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectricityWarningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectricityWarning&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,roomNumber,message);

@override
String toString() {
  return 'ElectricityWarning(roomId: $roomId, roomNumber: $roomNumber, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ElectricityWarningCopyWith<$Res> implements $ElectricityWarningCopyWith<$Res> {
  factory _$ElectricityWarningCopyWith(_ElectricityWarning value, $Res Function(_ElectricityWarning) _then) = __$ElectricityWarningCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'room_id') String roomId,@JsonKey(name: 'room_number') String roomNumber, String message
});




}
/// @nodoc
class __$ElectricityWarningCopyWithImpl<$Res>
    implements _$ElectricityWarningCopyWith<$Res> {
  __$ElectricityWarningCopyWithImpl(this._self, this._then);

  final _ElectricityWarning _self;
  final $Res Function(_ElectricityWarning) _then;

/// Create a copy of ElectricityWarning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? roomNumber = null,Object? message = null,}) {
  return _then(_ElectricityWarning(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,roomNumber: null == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PreviewInvoice {

 String get id;@JsonKey(name: 'billing_period_year') int get billingPeriodYear;@JsonKey(name: 'billing_period_month') int get billingPeriodMonth;@JsonKey(name: 'total_amount') String get totalAmount;@JsonKey(name: 'paid_amount') String get paidAmount;@JsonKey(name: 'electricity_amount') String? get electricityAmount; String get status;@JsonKey(name: 'issued_at') String get issuedAt;@JsonKey(name: 'due_date') String get dueDate; String? get outstanding;@JsonKey(name: 'line_items') List<LineItem> get lineItems;
/// Create a copy of PreviewInvoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreviewInvoiceCopyWith<PreviewInvoice> get copyWith => _$PreviewInvoiceCopyWithImpl<PreviewInvoice>(this as PreviewInvoice, _$identity);

  /// Serializes this PreviewInvoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviewInvoice&&(identical(other.id, id) || other.id == id)&&(identical(other.billingPeriodYear, billingPeriodYear) || other.billingPeriodYear == billingPeriodYear)&&(identical(other.billingPeriodMonth, billingPeriodMonth) || other.billingPeriodMonth == billingPeriodMonth)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.electricityAmount, electricityAmount) || other.electricityAmount == electricityAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&const DeepCollectionEquality().equals(other.lineItems, lineItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,billingPeriodYear,billingPeriodMonth,totalAmount,paidAmount,electricityAmount,status,issuedAt,dueDate,outstanding,const DeepCollectionEquality().hash(lineItems));

@override
String toString() {
  return 'PreviewInvoice(id: $id, billingPeriodYear: $billingPeriodYear, billingPeriodMonth: $billingPeriodMonth, totalAmount: $totalAmount, paidAmount: $paidAmount, electricityAmount: $electricityAmount, status: $status, issuedAt: $issuedAt, dueDate: $dueDate, outstanding: $outstanding, lineItems: $lineItems)';
}


}

/// @nodoc
abstract mixin class $PreviewInvoiceCopyWith<$Res>  {
  factory $PreviewInvoiceCopyWith(PreviewInvoice value, $Res Function(PreviewInvoice) _then) = _$PreviewInvoiceCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'billing_period_year') int billingPeriodYear,@JsonKey(name: 'billing_period_month') int billingPeriodMonth,@JsonKey(name: 'total_amount') String totalAmount,@JsonKey(name: 'paid_amount') String paidAmount,@JsonKey(name: 'electricity_amount') String? electricityAmount, String status,@JsonKey(name: 'issued_at') String issuedAt,@JsonKey(name: 'due_date') String dueDate, String? outstanding,@JsonKey(name: 'line_items') List<LineItem> lineItems
});




}
/// @nodoc
class _$PreviewInvoiceCopyWithImpl<$Res>
    implements $PreviewInvoiceCopyWith<$Res> {
  _$PreviewInvoiceCopyWithImpl(this._self, this._then);

  final PreviewInvoice _self;
  final $Res Function(PreviewInvoice) _then;

/// Create a copy of PreviewInvoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? billingPeriodYear = null,Object? billingPeriodMonth = null,Object? totalAmount = null,Object? paidAmount = null,Object? electricityAmount = freezed,Object? status = null,Object? issuedAt = null,Object? dueDate = null,Object? outstanding = freezed,Object? lineItems = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,billingPeriodYear: null == billingPeriodYear ? _self.billingPeriodYear : billingPeriodYear // ignore: cast_nullable_to_non_nullable
as int,billingPeriodMonth: null == billingPeriodMonth ? _self.billingPeriodMonth : billingPeriodMonth // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,electricityAmount: freezed == electricityAmount ? _self.electricityAmount : electricityAmount // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,outstanding: freezed == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as String?,lineItems: null == lineItems ? _self.lineItems : lineItems // ignore: cast_nullable_to_non_nullable
as List<LineItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [PreviewInvoice].
extension PreviewInvoicePatterns on PreviewInvoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreviewInvoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreviewInvoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreviewInvoice value)  $default,){
final _that = this;
switch (_that) {
case _PreviewInvoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreviewInvoice value)?  $default,){
final _that = this;
switch (_that) {
case _PreviewInvoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount, @JsonKey(name: 'electricity_amount')  String? electricityAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt, @JsonKey(name: 'due_date')  String dueDate,  String? outstanding, @JsonKey(name: 'line_items')  List<LineItem> lineItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreviewInvoice() when $default != null:
return $default(_that.id,_that.billingPeriodYear,_that.billingPeriodMonth,_that.totalAmount,_that.paidAmount,_that.electricityAmount,_that.status,_that.issuedAt,_that.dueDate,_that.outstanding,_that.lineItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount, @JsonKey(name: 'electricity_amount')  String? electricityAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt, @JsonKey(name: 'due_date')  String dueDate,  String? outstanding, @JsonKey(name: 'line_items')  List<LineItem> lineItems)  $default,) {final _that = this;
switch (_that) {
case _PreviewInvoice():
return $default(_that.id,_that.billingPeriodYear,_that.billingPeriodMonth,_that.totalAmount,_that.paidAmount,_that.electricityAmount,_that.status,_that.issuedAt,_that.dueDate,_that.outstanding,_that.lineItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'billing_period_year')  int billingPeriodYear, @JsonKey(name: 'billing_period_month')  int billingPeriodMonth, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount, @JsonKey(name: 'electricity_amount')  String? electricityAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt, @JsonKey(name: 'due_date')  String dueDate,  String? outstanding, @JsonKey(name: 'line_items')  List<LineItem> lineItems)?  $default,) {final _that = this;
switch (_that) {
case _PreviewInvoice() when $default != null:
return $default(_that.id,_that.billingPeriodYear,_that.billingPeriodMonth,_that.totalAmount,_that.paidAmount,_that.electricityAmount,_that.status,_that.issuedAt,_that.dueDate,_that.outstanding,_that.lineItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreviewInvoice implements PreviewInvoice {
  const _PreviewInvoice({required this.id, @JsonKey(name: 'billing_period_year') required this.billingPeriodYear, @JsonKey(name: 'billing_period_month') required this.billingPeriodMonth, @JsonKey(name: 'total_amount') required this.totalAmount, @JsonKey(name: 'paid_amount') required this.paidAmount, @JsonKey(name: 'electricity_amount') this.electricityAmount, required this.status, @JsonKey(name: 'issued_at') required this.issuedAt, @JsonKey(name: 'due_date') required this.dueDate, this.outstanding, @JsonKey(name: 'line_items') final  List<LineItem> lineItems = const <LineItem>[]}): _lineItems = lineItems;
  factory _PreviewInvoice.fromJson(Map<String, dynamic> json) => _$PreviewInvoiceFromJson(json);

@override final  String id;
@override@JsonKey(name: 'billing_period_year') final  int billingPeriodYear;
@override@JsonKey(name: 'billing_period_month') final  int billingPeriodMonth;
@override@JsonKey(name: 'total_amount') final  String totalAmount;
@override@JsonKey(name: 'paid_amount') final  String paidAmount;
@override@JsonKey(name: 'electricity_amount') final  String? electricityAmount;
@override final  String status;
@override@JsonKey(name: 'issued_at') final  String issuedAt;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override final  String? outstanding;
 final  List<LineItem> _lineItems;
@override@JsonKey(name: 'line_items') List<LineItem> get lineItems {
  if (_lineItems is EqualUnmodifiableListView) return _lineItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lineItems);
}


/// Create a copy of PreviewInvoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviewInvoiceCopyWith<_PreviewInvoice> get copyWith => __$PreviewInvoiceCopyWithImpl<_PreviewInvoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreviewInvoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewInvoice&&(identical(other.id, id) || other.id == id)&&(identical(other.billingPeriodYear, billingPeriodYear) || other.billingPeriodYear == billingPeriodYear)&&(identical(other.billingPeriodMonth, billingPeriodMonth) || other.billingPeriodMonth == billingPeriodMonth)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.electricityAmount, electricityAmount) || other.electricityAmount == electricityAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&const DeepCollectionEquality().equals(other._lineItems, _lineItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,billingPeriodYear,billingPeriodMonth,totalAmount,paidAmount,electricityAmount,status,issuedAt,dueDate,outstanding,const DeepCollectionEquality().hash(_lineItems));

@override
String toString() {
  return 'PreviewInvoice(id: $id, billingPeriodYear: $billingPeriodYear, billingPeriodMonth: $billingPeriodMonth, totalAmount: $totalAmount, paidAmount: $paidAmount, electricityAmount: $electricityAmount, status: $status, issuedAt: $issuedAt, dueDate: $dueDate, outstanding: $outstanding, lineItems: $lineItems)';
}


}

/// @nodoc
abstract mixin class _$PreviewInvoiceCopyWith<$Res> implements $PreviewInvoiceCopyWith<$Res> {
  factory _$PreviewInvoiceCopyWith(_PreviewInvoice value, $Res Function(_PreviewInvoice) _then) = __$PreviewInvoiceCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'billing_period_year') int billingPeriodYear,@JsonKey(name: 'billing_period_month') int billingPeriodMonth,@JsonKey(name: 'total_amount') String totalAmount,@JsonKey(name: 'paid_amount') String paidAmount,@JsonKey(name: 'electricity_amount') String? electricityAmount, String status,@JsonKey(name: 'issued_at') String issuedAt,@JsonKey(name: 'due_date') String dueDate, String? outstanding,@JsonKey(name: 'line_items') List<LineItem> lineItems
});




}
/// @nodoc
class __$PreviewInvoiceCopyWithImpl<$Res>
    implements _$PreviewInvoiceCopyWith<$Res> {
  __$PreviewInvoiceCopyWithImpl(this._self, this._then);

  final _PreviewInvoice _self;
  final $Res Function(_PreviewInvoice) _then;

/// Create a copy of PreviewInvoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? billingPeriodYear = null,Object? billingPeriodMonth = null,Object? totalAmount = null,Object? paidAmount = null,Object? electricityAmount = freezed,Object? status = null,Object? issuedAt = null,Object? dueDate = null,Object? outstanding = freezed,Object? lineItems = null,}) {
  return _then(_PreviewInvoice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,billingPeriodYear: null == billingPeriodYear ? _self.billingPeriodYear : billingPeriodYear // ignore: cast_nullable_to_non_nullable
as int,billingPeriodMonth: null == billingPeriodMonth ? _self.billingPeriodMonth : billingPeriodMonth // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,electricityAmount: freezed == electricityAmount ? _self.electricityAmount : electricityAmount // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,outstanding: freezed == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as String?,lineItems: null == lineItems ? _self._lineItems : lineItems // ignore: cast_nullable_to_non_nullable
as List<LineItem>,
  ));
}


}


/// @nodoc
mixin _$PreviewDue {

 String get id; String get head;@JsonKey(name: 'head_label') String get headLabel; String get amount;@JsonKey(name: 'paid_amount') String get paidAmount; String get outstanding;@JsonKey(name: 'due_date') String get dueDate; String get status;
/// Create a copy of PreviewDue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreviewDueCopyWith<PreviewDue> get copyWith => _$PreviewDueCopyWithImpl<PreviewDue>(this as PreviewDue, _$identity);

  /// Serializes this PreviewDue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviewDue&&(identical(other.id, id) || other.id == id)&&(identical(other.head, head) || other.head == head)&&(identical(other.headLabel, headLabel) || other.headLabel == headLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,head,headLabel,amount,paidAmount,outstanding,dueDate,status);

@override
String toString() {
  return 'PreviewDue(id: $id, head: $head, headLabel: $headLabel, amount: $amount, paidAmount: $paidAmount, outstanding: $outstanding, dueDate: $dueDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $PreviewDueCopyWith<$Res>  {
  factory $PreviewDueCopyWith(PreviewDue value, $Res Function(PreviewDue) _then) = _$PreviewDueCopyWithImpl;
@useResult
$Res call({
 String id, String head,@JsonKey(name: 'head_label') String headLabel, String amount,@JsonKey(name: 'paid_amount') String paidAmount, String outstanding,@JsonKey(name: 'due_date') String dueDate, String status
});




}
/// @nodoc
class _$PreviewDueCopyWithImpl<$Res>
    implements $PreviewDueCopyWith<$Res> {
  _$PreviewDueCopyWithImpl(this._self, this._then);

  final PreviewDue _self;
  final $Res Function(PreviewDue) _then;

/// Create a copy of PreviewDue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? head = null,Object? headLabel = null,Object? amount = null,Object? paidAmount = null,Object? outstanding = null,Object? dueDate = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,headLabel: null == headLabel ? _self.headLabel : headLabel // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreviewDue].
extension PreviewDuePatterns on PreviewDue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreviewDue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreviewDue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreviewDue value)  $default,){
final _that = this;
switch (_that) {
case _PreviewDue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreviewDue value)?  $default,){
final _that = this;
switch (_that) {
case _PreviewDue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String outstanding, @JsonKey(name: 'due_date')  String dueDate,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreviewDue() when $default != null:
return $default(_that.id,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String outstanding, @JsonKey(name: 'due_date')  String dueDate,  String status)  $default,) {final _that = this;
switch (_that) {
case _PreviewDue():
return $default(_that.id,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String outstanding, @JsonKey(name: 'due_date')  String dueDate,  String status)?  $default,) {final _that = this;
switch (_that) {
case _PreviewDue() when $default != null:
return $default(_that.id,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.outstanding,_that.dueDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreviewDue implements PreviewDue {
  const _PreviewDue({required this.id, required this.head, @JsonKey(name: 'head_label') required this.headLabel, required this.amount, @JsonKey(name: 'paid_amount') required this.paidAmount, required this.outstanding, @JsonKey(name: 'due_date') required this.dueDate, required this.status});
  factory _PreviewDue.fromJson(Map<String, dynamic> json) => _$PreviewDueFromJson(json);

@override final  String id;
@override final  String head;
@override@JsonKey(name: 'head_label') final  String headLabel;
@override final  String amount;
@override@JsonKey(name: 'paid_amount') final  String paidAmount;
@override final  String outstanding;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override final  String status;

/// Create a copy of PreviewDue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviewDueCopyWith<_PreviewDue> get copyWith => __$PreviewDueCopyWithImpl<_PreviewDue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreviewDueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewDue&&(identical(other.id, id) || other.id == id)&&(identical(other.head, head) || other.head == head)&&(identical(other.headLabel, headLabel) || other.headLabel == headLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.outstanding, outstanding) || other.outstanding == outstanding)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,head,headLabel,amount,paidAmount,outstanding,dueDate,status);

@override
String toString() {
  return 'PreviewDue(id: $id, head: $head, headLabel: $headLabel, amount: $amount, paidAmount: $paidAmount, outstanding: $outstanding, dueDate: $dueDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PreviewDueCopyWith<$Res> implements $PreviewDueCopyWith<$Res> {
  factory _$PreviewDueCopyWith(_PreviewDue value, $Res Function(_PreviewDue) _then) = __$PreviewDueCopyWithImpl;
@override @useResult
$Res call({
 String id, String head,@JsonKey(name: 'head_label') String headLabel, String amount,@JsonKey(name: 'paid_amount') String paidAmount, String outstanding,@JsonKey(name: 'due_date') String dueDate, String status
});




}
/// @nodoc
class __$PreviewDueCopyWithImpl<$Res>
    implements _$PreviewDueCopyWith<$Res> {
  __$PreviewDueCopyWithImpl(this._self, this._then);

  final _PreviewDue _self;
  final $Res Function(_PreviewDue) _then;

/// Create a copy of PreviewDue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? head = null,Object? headLabel = null,Object? amount = null,Object? paidAmount = null,Object? outstanding = null,Object? dueDate = null,Object? status = null,}) {
  return _then(_PreviewDue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,headLabel: null == headLabel ? _self.headLabel : headLabel // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,outstanding: null == outstanding ? _self.outstanding : outstanding // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CollectionPreview {

@JsonKey(name: 'current_invoice') PreviewInvoice? get currentInvoice;@JsonKey(name: 'open_dues') List<PreviewDue> get openDues;@JsonKey(name: 'grand_total_outstanding') String get grandTotalOutstanding;@JsonKey(name: 'electricity_warning') ElectricityWarning? get electricityWarning;
/// Create a copy of CollectionPreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectionPreviewCopyWith<CollectionPreview> get copyWith => _$CollectionPreviewCopyWithImpl<CollectionPreview>(this as CollectionPreview, _$identity);

  /// Serializes this CollectionPreview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectionPreview&&(identical(other.currentInvoice, currentInvoice) || other.currentInvoice == currentInvoice)&&const DeepCollectionEquality().equals(other.openDues, openDues)&&(identical(other.grandTotalOutstanding, grandTotalOutstanding) || other.grandTotalOutstanding == grandTotalOutstanding)&&(identical(other.electricityWarning, electricityWarning) || other.electricityWarning == electricityWarning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentInvoice,const DeepCollectionEquality().hash(openDues),grandTotalOutstanding,electricityWarning);

@override
String toString() {
  return 'CollectionPreview(currentInvoice: $currentInvoice, openDues: $openDues, grandTotalOutstanding: $grandTotalOutstanding, electricityWarning: $electricityWarning)';
}


}

/// @nodoc
abstract mixin class $CollectionPreviewCopyWith<$Res>  {
  factory $CollectionPreviewCopyWith(CollectionPreview value, $Res Function(CollectionPreview) _then) = _$CollectionPreviewCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_invoice') PreviewInvoice? currentInvoice,@JsonKey(name: 'open_dues') List<PreviewDue> openDues,@JsonKey(name: 'grand_total_outstanding') String grandTotalOutstanding,@JsonKey(name: 'electricity_warning') ElectricityWarning? electricityWarning
});


$PreviewInvoiceCopyWith<$Res>? get currentInvoice;$ElectricityWarningCopyWith<$Res>? get electricityWarning;

}
/// @nodoc
class _$CollectionPreviewCopyWithImpl<$Res>
    implements $CollectionPreviewCopyWith<$Res> {
  _$CollectionPreviewCopyWithImpl(this._self, this._then);

  final CollectionPreview _self;
  final $Res Function(CollectionPreview) _then;

/// Create a copy of CollectionPreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentInvoice = freezed,Object? openDues = null,Object? grandTotalOutstanding = null,Object? electricityWarning = freezed,}) {
  return _then(_self.copyWith(
currentInvoice: freezed == currentInvoice ? _self.currentInvoice : currentInvoice // ignore: cast_nullable_to_non_nullable
as PreviewInvoice?,openDues: null == openDues ? _self.openDues : openDues // ignore: cast_nullable_to_non_nullable
as List<PreviewDue>,grandTotalOutstanding: null == grandTotalOutstanding ? _self.grandTotalOutstanding : grandTotalOutstanding // ignore: cast_nullable_to_non_nullable
as String,electricityWarning: freezed == electricityWarning ? _self.electricityWarning : electricityWarning // ignore: cast_nullable_to_non_nullable
as ElectricityWarning?,
  ));
}
/// Create a copy of CollectionPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreviewInvoiceCopyWith<$Res>? get currentInvoice {
    if (_self.currentInvoice == null) {
    return null;
  }

  return $PreviewInvoiceCopyWith<$Res>(_self.currentInvoice!, (value) {
    return _then(_self.copyWith(currentInvoice: value));
  });
}/// Create a copy of CollectionPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ElectricityWarningCopyWith<$Res>? get electricityWarning {
    if (_self.electricityWarning == null) {
    return null;
  }

  return $ElectricityWarningCopyWith<$Res>(_self.electricityWarning!, (value) {
    return _then(_self.copyWith(electricityWarning: value));
  });
}
}


/// Adds pattern-matching-related methods to [CollectionPreview].
extension CollectionPreviewPatterns on CollectionPreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectionPreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectionPreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectionPreview value)  $default,){
final _that = this;
switch (_that) {
case _CollectionPreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectionPreview value)?  $default,){
final _that = this;
switch (_that) {
case _CollectionPreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_invoice')  PreviewInvoice? currentInvoice, @JsonKey(name: 'open_dues')  List<PreviewDue> openDues, @JsonKey(name: 'grand_total_outstanding')  String grandTotalOutstanding, @JsonKey(name: 'electricity_warning')  ElectricityWarning? electricityWarning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectionPreview() when $default != null:
return $default(_that.currentInvoice,_that.openDues,_that.grandTotalOutstanding,_that.electricityWarning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_invoice')  PreviewInvoice? currentInvoice, @JsonKey(name: 'open_dues')  List<PreviewDue> openDues, @JsonKey(name: 'grand_total_outstanding')  String grandTotalOutstanding, @JsonKey(name: 'electricity_warning')  ElectricityWarning? electricityWarning)  $default,) {final _that = this;
switch (_that) {
case _CollectionPreview():
return $default(_that.currentInvoice,_that.openDues,_that.grandTotalOutstanding,_that.electricityWarning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_invoice')  PreviewInvoice? currentInvoice, @JsonKey(name: 'open_dues')  List<PreviewDue> openDues, @JsonKey(name: 'grand_total_outstanding')  String grandTotalOutstanding, @JsonKey(name: 'electricity_warning')  ElectricityWarning? electricityWarning)?  $default,) {final _that = this;
switch (_that) {
case _CollectionPreview() when $default != null:
return $default(_that.currentInvoice,_that.openDues,_that.grandTotalOutstanding,_that.electricityWarning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollectionPreview implements CollectionPreview {
  const _CollectionPreview({@JsonKey(name: 'current_invoice') this.currentInvoice, @JsonKey(name: 'open_dues') required final  List<PreviewDue> openDues, @JsonKey(name: 'grand_total_outstanding') required this.grandTotalOutstanding, @JsonKey(name: 'electricity_warning') this.electricityWarning}): _openDues = openDues;
  factory _CollectionPreview.fromJson(Map<String, dynamic> json) => _$CollectionPreviewFromJson(json);

@override@JsonKey(name: 'current_invoice') final  PreviewInvoice? currentInvoice;
 final  List<PreviewDue> _openDues;
@override@JsonKey(name: 'open_dues') List<PreviewDue> get openDues {
  if (_openDues is EqualUnmodifiableListView) return _openDues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_openDues);
}

@override@JsonKey(name: 'grand_total_outstanding') final  String grandTotalOutstanding;
@override@JsonKey(name: 'electricity_warning') final  ElectricityWarning? electricityWarning;

/// Create a copy of CollectionPreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectionPreviewCopyWith<_CollectionPreview> get copyWith => __$CollectionPreviewCopyWithImpl<_CollectionPreview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectionPreviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectionPreview&&(identical(other.currentInvoice, currentInvoice) || other.currentInvoice == currentInvoice)&&const DeepCollectionEquality().equals(other._openDues, _openDues)&&(identical(other.grandTotalOutstanding, grandTotalOutstanding) || other.grandTotalOutstanding == grandTotalOutstanding)&&(identical(other.electricityWarning, electricityWarning) || other.electricityWarning == electricityWarning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentInvoice,const DeepCollectionEquality().hash(_openDues),grandTotalOutstanding,electricityWarning);

@override
String toString() {
  return 'CollectionPreview(currentInvoice: $currentInvoice, openDues: $openDues, grandTotalOutstanding: $grandTotalOutstanding, electricityWarning: $electricityWarning)';
}


}

/// @nodoc
abstract mixin class _$CollectionPreviewCopyWith<$Res> implements $CollectionPreviewCopyWith<$Res> {
  factory _$CollectionPreviewCopyWith(_CollectionPreview value, $Res Function(_CollectionPreview) _then) = __$CollectionPreviewCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_invoice') PreviewInvoice? currentInvoice,@JsonKey(name: 'open_dues') List<PreviewDue> openDues,@JsonKey(name: 'grand_total_outstanding') String grandTotalOutstanding,@JsonKey(name: 'electricity_warning') ElectricityWarning? electricityWarning
});


@override $PreviewInvoiceCopyWith<$Res>? get currentInvoice;@override $ElectricityWarningCopyWith<$Res>? get electricityWarning;

}
/// @nodoc
class __$CollectionPreviewCopyWithImpl<$Res>
    implements _$CollectionPreviewCopyWith<$Res> {
  __$CollectionPreviewCopyWithImpl(this._self, this._then);

  final _CollectionPreview _self;
  final $Res Function(_CollectionPreview) _then;

/// Create a copy of CollectionPreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentInvoice = freezed,Object? openDues = null,Object? grandTotalOutstanding = null,Object? electricityWarning = freezed,}) {
  return _then(_CollectionPreview(
currentInvoice: freezed == currentInvoice ? _self.currentInvoice : currentInvoice // ignore: cast_nullable_to_non_nullable
as PreviewInvoice?,openDues: null == openDues ? _self._openDues : openDues // ignore: cast_nullable_to_non_nullable
as List<PreviewDue>,grandTotalOutstanding: null == grandTotalOutstanding ? _self.grandTotalOutstanding : grandTotalOutstanding // ignore: cast_nullable_to_non_nullable
as String,electricityWarning: freezed == electricityWarning ? _self.electricityWarning : electricityWarning // ignore: cast_nullable_to_non_nullable
as ElectricityWarning?,
  ));
}

/// Create a copy of CollectionPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreviewInvoiceCopyWith<$Res>? get currentInvoice {
    if (_self.currentInvoice == null) {
    return null;
  }

  return $PreviewInvoiceCopyWith<$Res>(_self.currentInvoice!, (value) {
    return _then(_self.copyWith(currentInvoice: value));
  });
}/// Create a copy of CollectionPreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ElectricityWarningCopyWith<$Res>? get electricityWarning {
    if (_self.electricityWarning == null) {
    return null;
  }

  return $ElectricityWarningCopyWith<$Res>(_self.electricityWarning!, (value) {
    return _then(_self.copyWith(electricityWarning: value));
  });
}
}


/// @nodoc
mixin _$PaymentApplication {

@JsonKey(name: 'target_type') String get targetType;@JsonKey(name: 'target_id') String get targetId;@JsonKey(name: 'applied_amount') String get appliedAmount;
/// Create a copy of PaymentApplication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentApplicationCopyWith<PaymentApplication> get copyWith => _$PaymentApplicationCopyWithImpl<PaymentApplication>(this as PaymentApplication, _$identity);

  /// Serializes this PaymentApplication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentApplication&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.appliedAmount, appliedAmount) || other.appliedAmount == appliedAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetType,targetId,appliedAmount);

@override
String toString() {
  return 'PaymentApplication(targetType: $targetType, targetId: $targetId, appliedAmount: $appliedAmount)';
}


}

/// @nodoc
abstract mixin class $PaymentApplicationCopyWith<$Res>  {
  factory $PaymentApplicationCopyWith(PaymentApplication value, $Res Function(PaymentApplication) _then) = _$PaymentApplicationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'target_type') String targetType,@JsonKey(name: 'target_id') String targetId,@JsonKey(name: 'applied_amount') String appliedAmount
});




}
/// @nodoc
class _$PaymentApplicationCopyWithImpl<$Res>
    implements $PaymentApplicationCopyWith<$Res> {
  _$PaymentApplicationCopyWithImpl(this._self, this._then);

  final PaymentApplication _self;
  final $Res Function(PaymentApplication) _then;

/// Create a copy of PaymentApplication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetType = null,Object? targetId = null,Object? appliedAmount = null,}) {
  return _then(_self.copyWith(
targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,appliedAmount: null == appliedAmount ? _self.appliedAmount : appliedAmount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentApplication].
extension PaymentApplicationPatterns on PaymentApplication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentApplication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentApplication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentApplication value)  $default,){
final _that = this;
switch (_that) {
case _PaymentApplication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentApplication value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentApplication() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'target_type')  String targetType, @JsonKey(name: 'target_id')  String targetId, @JsonKey(name: 'applied_amount')  String appliedAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentApplication() when $default != null:
return $default(_that.targetType,_that.targetId,_that.appliedAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'target_type')  String targetType, @JsonKey(name: 'target_id')  String targetId, @JsonKey(name: 'applied_amount')  String appliedAmount)  $default,) {final _that = this;
switch (_that) {
case _PaymentApplication():
return $default(_that.targetType,_that.targetId,_that.appliedAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'target_type')  String targetType, @JsonKey(name: 'target_id')  String targetId, @JsonKey(name: 'applied_amount')  String appliedAmount)?  $default,) {final _that = this;
switch (_that) {
case _PaymentApplication() when $default != null:
return $default(_that.targetType,_that.targetId,_that.appliedAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentApplication implements PaymentApplication {
  const _PaymentApplication({@JsonKey(name: 'target_type') required this.targetType, @JsonKey(name: 'target_id') required this.targetId, @JsonKey(name: 'applied_amount') required this.appliedAmount});
  factory _PaymentApplication.fromJson(Map<String, dynamic> json) => _$PaymentApplicationFromJson(json);

@override@JsonKey(name: 'target_type') final  String targetType;
@override@JsonKey(name: 'target_id') final  String targetId;
@override@JsonKey(name: 'applied_amount') final  String appliedAmount;

/// Create a copy of PaymentApplication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentApplicationCopyWith<_PaymentApplication> get copyWith => __$PaymentApplicationCopyWithImpl<_PaymentApplication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentApplicationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentApplication&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.appliedAmount, appliedAmount) || other.appliedAmount == appliedAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetType,targetId,appliedAmount);

@override
String toString() {
  return 'PaymentApplication(targetType: $targetType, targetId: $targetId, appliedAmount: $appliedAmount)';
}


}

/// @nodoc
abstract mixin class _$PaymentApplicationCopyWith<$Res> implements $PaymentApplicationCopyWith<$Res> {
  factory _$PaymentApplicationCopyWith(_PaymentApplication value, $Res Function(_PaymentApplication) _then) = __$PaymentApplicationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'target_type') String targetType,@JsonKey(name: 'target_id') String targetId,@JsonKey(name: 'applied_amount') String appliedAmount
});




}
/// @nodoc
class __$PaymentApplicationCopyWithImpl<$Res>
    implements _$PaymentApplicationCopyWith<$Res> {
  __$PaymentApplicationCopyWithImpl(this._self, this._then);

  final _PaymentApplication _self;
  final $Res Function(_PaymentApplication) _then;

/// Create a copy of PaymentApplication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetType = null,Object? targetId = null,Object? appliedAmount = null,}) {
  return _then(_PaymentApplication(
targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,appliedAmount: null == appliedAmount ? _self.appliedAmount : appliedAmount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Payment {

 String get id; String get amount;@JsonKey(name: 'payment_method') String get paymentMethod; String? get reference;@JsonKey(name: 'paid_at') String get paidAt; List<PaymentApplication> get applications;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&const DeepCollectionEquality().equals(other.applications, applications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,paymentMethod,reference,paidAt,const DeepCollectionEquality().hash(applications));

@override
String toString() {
  return 'Payment(id: $id, amount: $amount, paymentMethod: $paymentMethod, reference: $reference, paidAt: $paidAt, applications: $applications)';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 String id, String amount,@JsonKey(name: 'payment_method') String paymentMethod, String? reference,@JsonKey(name: 'paid_at') String paidAt, List<PaymentApplication> applications
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? paymentMethod = null,Object? reference = freezed,Object? paidAt = null,Object? applications = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String,applications: null == applications ? _self.applications : applications // ignore: cast_nullable_to_non_nullable
as List<PaymentApplication>,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String amount, @JsonKey(name: 'payment_method')  String paymentMethod,  String? reference, @JsonKey(name: 'paid_at')  String paidAt,  List<PaymentApplication> applications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.amount,_that.paymentMethod,_that.reference,_that.paidAt,_that.applications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String amount, @JsonKey(name: 'payment_method')  String paymentMethod,  String? reference, @JsonKey(name: 'paid_at')  String paidAt,  List<PaymentApplication> applications)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.amount,_that.paymentMethod,_that.reference,_that.paidAt,_that.applications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String amount, @JsonKey(name: 'payment_method')  String paymentMethod,  String? reference, @JsonKey(name: 'paid_at')  String paidAt,  List<PaymentApplication> applications)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.amount,_that.paymentMethod,_that.reference,_that.paidAt,_that.applications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment implements Payment {
  const _Payment({required this.id, required this.amount, @JsonKey(name: 'payment_method') required this.paymentMethod, this.reference, @JsonKey(name: 'paid_at') required this.paidAt, required final  List<PaymentApplication> applications}): _applications = applications;
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  String id;
@override final  String amount;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override final  String? reference;
@override@JsonKey(name: 'paid_at') final  String paidAt;
 final  List<PaymentApplication> _applications;
@override List<PaymentApplication> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}


/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&const DeepCollectionEquality().equals(other._applications, _applications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,paymentMethod,reference,paidAt,const DeepCollectionEquality().hash(_applications));

@override
String toString() {
  return 'Payment(id: $id, amount: $amount, paymentMethod: $paymentMethod, reference: $reference, paidAt: $paidAt, applications: $applications)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 String id, String amount,@JsonKey(name: 'payment_method') String paymentMethod, String? reference,@JsonKey(name: 'paid_at') String paidAt, List<PaymentApplication> applications
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? paymentMethod = null,Object? reference = freezed,Object? paidAt = null,Object? applications = null,}) {
  return _then(_Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String,applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<PaymentApplication>,
  ));
}


}


/// @nodoc
mixin _$CollectResult {

 Payment get payment; PreviewInvoice? get invoice;@JsonKey(name: 'open_dues') List<PreviewDue> get openDues;@JsonKey(name: 'grand_total_outstanding') String get grandTotalOutstanding;
/// Create a copy of CollectResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollectResultCopyWith<CollectResult> get copyWith => _$CollectResultCopyWithImpl<CollectResult>(this as CollectResult, _$identity);

  /// Serializes this CollectResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollectResult&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&const DeepCollectionEquality().equals(other.openDues, openDues)&&(identical(other.grandTotalOutstanding, grandTotalOutstanding) || other.grandTotalOutstanding == grandTotalOutstanding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,payment,invoice,const DeepCollectionEquality().hash(openDues),grandTotalOutstanding);

@override
String toString() {
  return 'CollectResult(payment: $payment, invoice: $invoice, openDues: $openDues, grandTotalOutstanding: $grandTotalOutstanding)';
}


}

/// @nodoc
abstract mixin class $CollectResultCopyWith<$Res>  {
  factory $CollectResultCopyWith(CollectResult value, $Res Function(CollectResult) _then) = _$CollectResultCopyWithImpl;
@useResult
$Res call({
 Payment payment, PreviewInvoice? invoice,@JsonKey(name: 'open_dues') List<PreviewDue> openDues,@JsonKey(name: 'grand_total_outstanding') String grandTotalOutstanding
});


$PaymentCopyWith<$Res> get payment;$PreviewInvoiceCopyWith<$Res>? get invoice;

}
/// @nodoc
class _$CollectResultCopyWithImpl<$Res>
    implements $CollectResultCopyWith<$Res> {
  _$CollectResultCopyWithImpl(this._self, this._then);

  final CollectResult _self;
  final $Res Function(CollectResult) _then;

/// Create a copy of CollectResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payment = null,Object? invoice = freezed,Object? openDues = null,Object? grandTotalOutstanding = null,}) {
  return _then(_self.copyWith(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as Payment,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as PreviewInvoice?,openDues: null == openDues ? _self.openDues : openDues // ignore: cast_nullable_to_non_nullable
as List<PreviewDue>,grandTotalOutstanding: null == grandTotalOutstanding ? _self.grandTotalOutstanding : grandTotalOutstanding // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CollectResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res> get payment {
  
  return $PaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of CollectResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreviewInvoiceCopyWith<$Res>? get invoice {
    if (_self.invoice == null) {
    return null;
  }

  return $PreviewInvoiceCopyWith<$Res>(_self.invoice!, (value) {
    return _then(_self.copyWith(invoice: value));
  });
}
}


/// Adds pattern-matching-related methods to [CollectResult].
extension CollectResultPatterns on CollectResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollectResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollectResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollectResult value)  $default,){
final _that = this;
switch (_that) {
case _CollectResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollectResult value)?  $default,){
final _that = this;
switch (_that) {
case _CollectResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Payment payment,  PreviewInvoice? invoice, @JsonKey(name: 'open_dues')  List<PreviewDue> openDues, @JsonKey(name: 'grand_total_outstanding')  String grandTotalOutstanding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollectResult() when $default != null:
return $default(_that.payment,_that.invoice,_that.openDues,_that.grandTotalOutstanding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Payment payment,  PreviewInvoice? invoice, @JsonKey(name: 'open_dues')  List<PreviewDue> openDues, @JsonKey(name: 'grand_total_outstanding')  String grandTotalOutstanding)  $default,) {final _that = this;
switch (_that) {
case _CollectResult():
return $default(_that.payment,_that.invoice,_that.openDues,_that.grandTotalOutstanding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Payment payment,  PreviewInvoice? invoice, @JsonKey(name: 'open_dues')  List<PreviewDue> openDues, @JsonKey(name: 'grand_total_outstanding')  String grandTotalOutstanding)?  $default,) {final _that = this;
switch (_that) {
case _CollectResult() when $default != null:
return $default(_that.payment,_that.invoice,_that.openDues,_that.grandTotalOutstanding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollectResult implements CollectResult {
  const _CollectResult({required this.payment, this.invoice, @JsonKey(name: 'open_dues') required final  List<PreviewDue> openDues, @JsonKey(name: 'grand_total_outstanding') required this.grandTotalOutstanding}): _openDues = openDues;
  factory _CollectResult.fromJson(Map<String, dynamic> json) => _$CollectResultFromJson(json);

@override final  Payment payment;
@override final  PreviewInvoice? invoice;
 final  List<PreviewDue> _openDues;
@override@JsonKey(name: 'open_dues') List<PreviewDue> get openDues {
  if (_openDues is EqualUnmodifiableListView) return _openDues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_openDues);
}

@override@JsonKey(name: 'grand_total_outstanding') final  String grandTotalOutstanding;

/// Create a copy of CollectResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollectResultCopyWith<_CollectResult> get copyWith => __$CollectResultCopyWithImpl<_CollectResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollectResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollectResult&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&const DeepCollectionEquality().equals(other._openDues, _openDues)&&(identical(other.grandTotalOutstanding, grandTotalOutstanding) || other.grandTotalOutstanding == grandTotalOutstanding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,payment,invoice,const DeepCollectionEquality().hash(_openDues),grandTotalOutstanding);

@override
String toString() {
  return 'CollectResult(payment: $payment, invoice: $invoice, openDues: $openDues, grandTotalOutstanding: $grandTotalOutstanding)';
}


}

/// @nodoc
abstract mixin class _$CollectResultCopyWith<$Res> implements $CollectResultCopyWith<$Res> {
  factory _$CollectResultCopyWith(_CollectResult value, $Res Function(_CollectResult) _then) = __$CollectResultCopyWithImpl;
@override @useResult
$Res call({
 Payment payment, PreviewInvoice? invoice,@JsonKey(name: 'open_dues') List<PreviewDue> openDues,@JsonKey(name: 'grand_total_outstanding') String grandTotalOutstanding
});


@override $PaymentCopyWith<$Res> get payment;@override $PreviewInvoiceCopyWith<$Res>? get invoice;

}
/// @nodoc
class __$CollectResultCopyWithImpl<$Res>
    implements _$CollectResultCopyWith<$Res> {
  __$CollectResultCopyWithImpl(this._self, this._then);

  final _CollectResult _self;
  final $Res Function(_CollectResult) _then;

/// Create a copy of CollectResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payment = null,Object? invoice = freezed,Object? openDues = null,Object? grandTotalOutstanding = null,}) {
  return _then(_CollectResult(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as Payment,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as PreviewInvoice?,openDues: null == openDues ? _self._openDues : openDues // ignore: cast_nullable_to_non_nullable
as List<PreviewDue>,grandTotalOutstanding: null == grandTotalOutstanding ? _self.grandTotalOutstanding : grandTotalOutstanding // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CollectResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res> get payment {
  
  return $PaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of CollectResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreviewInvoiceCopyWith<$Res>? get invoice {
    if (_self.invoice == null) {
    return null;
  }

  return $PreviewInvoiceCopyWith<$Res>(_self.invoice!, (value) {
    return _then(_self.copyWith(invoice: value));
  });
}
}

// dart format on
