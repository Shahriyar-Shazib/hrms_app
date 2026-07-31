// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'renter_ledger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LedgerPeriod {

 int get year; int get month;
/// Create a copy of LedgerPeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerPeriodCopyWith<LedgerPeriod> get copyWith => _$LedgerPeriodCopyWithImpl<LedgerPeriod>(this as LedgerPeriod, _$identity);

  /// Serializes this LedgerPeriod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerPeriod&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month);

@override
String toString() {
  return 'LedgerPeriod(year: $year, month: $month)';
}


}

/// @nodoc
abstract mixin class $LedgerPeriodCopyWith<$Res>  {
  factory $LedgerPeriodCopyWith(LedgerPeriod value, $Res Function(LedgerPeriod) _then) = _$LedgerPeriodCopyWithImpl;
@useResult
$Res call({
 int year, int month
});




}
/// @nodoc
class _$LedgerPeriodCopyWithImpl<$Res>
    implements $LedgerPeriodCopyWith<$Res> {
  _$LedgerPeriodCopyWithImpl(this._self, this._then);

  final LedgerPeriod _self;
  final $Res Function(LedgerPeriod) _then;

/// Create a copy of LedgerPeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? month = null,}) {
  return _then(_self.copyWith(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerPeriod].
extension LedgerPeriodPatterns on LedgerPeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerPeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerPeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerPeriod value)  $default,){
final _that = this;
switch (_that) {
case _LedgerPeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerPeriod value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerPeriod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  int month)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerPeriod() when $default != null:
return $default(_that.year,_that.month);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  int month)  $default,) {final _that = this;
switch (_that) {
case _LedgerPeriod():
return $default(_that.year,_that.month);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  int month)?  $default,) {final _that = this;
switch (_that) {
case _LedgerPeriod() when $default != null:
return $default(_that.year,_that.month);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerPeriod implements LedgerPeriod {
  const _LedgerPeriod({required this.year, required this.month});
  factory _LedgerPeriod.fromJson(Map<String, dynamic> json) => _$LedgerPeriodFromJson(json);

@override final  int year;
@override final  int month;

/// Create a copy of LedgerPeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerPeriodCopyWith<_LedgerPeriod> get copyWith => __$LedgerPeriodCopyWithImpl<_LedgerPeriod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerPeriodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerPeriod&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month);

@override
String toString() {
  return 'LedgerPeriod(year: $year, month: $month)';
}


}

/// @nodoc
abstract mixin class _$LedgerPeriodCopyWith<$Res> implements $LedgerPeriodCopyWith<$Res> {
  factory _$LedgerPeriodCopyWith(_LedgerPeriod value, $Res Function(_LedgerPeriod) _then) = __$LedgerPeriodCopyWithImpl;
@override @useResult
$Res call({
 int year, int month
});




}
/// @nodoc
class __$LedgerPeriodCopyWithImpl<$Res>
    implements _$LedgerPeriodCopyWith<$Res> {
  __$LedgerPeriodCopyWithImpl(this._self, this._then);

  final _LedgerPeriod _self;
  final $Res Function(_LedgerPeriod) _then;

/// Create a copy of LedgerPeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? month = null,}) {
  return _then(_LedgerPeriod(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LedgerInvoice {

 String get id; LedgerPeriod get period;@JsonKey(name: 'total_amount') String get totalAmount;@JsonKey(name: 'paid_amount') String get paidAmount; String get status;@JsonKey(name: 'issued_at') String get issuedAt;
/// Create a copy of LedgerInvoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerInvoiceCopyWith<LedgerInvoice> get copyWith => _$LedgerInvoiceCopyWithImpl<LedgerInvoice>(this as LedgerInvoice, _$identity);

  /// Serializes this LedgerInvoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerInvoice&&(identical(other.id, id) || other.id == id)&&(identical(other.period, period) || other.period == period)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,period,totalAmount,paidAmount,status,issuedAt);

@override
String toString() {
  return 'LedgerInvoice(id: $id, period: $period, totalAmount: $totalAmount, paidAmount: $paidAmount, status: $status, issuedAt: $issuedAt)';
}


}

/// @nodoc
abstract mixin class $LedgerInvoiceCopyWith<$Res>  {
  factory $LedgerInvoiceCopyWith(LedgerInvoice value, $Res Function(LedgerInvoice) _then) = _$LedgerInvoiceCopyWithImpl;
@useResult
$Res call({
 String id, LedgerPeriod period,@JsonKey(name: 'total_amount') String totalAmount,@JsonKey(name: 'paid_amount') String paidAmount, String status,@JsonKey(name: 'issued_at') String issuedAt
});


$LedgerPeriodCopyWith<$Res> get period;

}
/// @nodoc
class _$LedgerInvoiceCopyWithImpl<$Res>
    implements $LedgerInvoiceCopyWith<$Res> {
  _$LedgerInvoiceCopyWithImpl(this._self, this._then);

  final LedgerInvoice _self;
  final $Res Function(LedgerInvoice) _then;

/// Create a copy of LedgerInvoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? period = null,Object? totalAmount = null,Object? paidAmount = null,Object? status = null,Object? issuedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as LedgerPeriod,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LedgerInvoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LedgerPeriodCopyWith<$Res> get period {
  
  return $LedgerPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}
}


/// Adds pattern-matching-related methods to [LedgerInvoice].
extension LedgerInvoicePatterns on LedgerInvoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerInvoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerInvoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerInvoice value)  $default,){
final _that = this;
switch (_that) {
case _LedgerInvoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerInvoice value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerInvoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LedgerPeriod period, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerInvoice() when $default != null:
return $default(_that.id,_that.period,_that.totalAmount,_that.paidAmount,_that.status,_that.issuedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LedgerPeriod period, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt)  $default,) {final _that = this;
switch (_that) {
case _LedgerInvoice():
return $default(_that.id,_that.period,_that.totalAmount,_that.paidAmount,_that.status,_that.issuedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LedgerPeriod period, @JsonKey(name: 'total_amount')  String totalAmount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status, @JsonKey(name: 'issued_at')  String issuedAt)?  $default,) {final _that = this;
switch (_that) {
case _LedgerInvoice() when $default != null:
return $default(_that.id,_that.period,_that.totalAmount,_that.paidAmount,_that.status,_that.issuedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerInvoice implements LedgerInvoice {
  const _LedgerInvoice({required this.id, required this.period, @JsonKey(name: 'total_amount') required this.totalAmount, @JsonKey(name: 'paid_amount') required this.paidAmount, required this.status, @JsonKey(name: 'issued_at') required this.issuedAt});
  factory _LedgerInvoice.fromJson(Map<String, dynamic> json) => _$LedgerInvoiceFromJson(json);

@override final  String id;
@override final  LedgerPeriod period;
@override@JsonKey(name: 'total_amount') final  String totalAmount;
@override@JsonKey(name: 'paid_amount') final  String paidAmount;
@override final  String status;
@override@JsonKey(name: 'issued_at') final  String issuedAt;

/// Create a copy of LedgerInvoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerInvoiceCopyWith<_LedgerInvoice> get copyWith => __$LedgerInvoiceCopyWithImpl<_LedgerInvoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerInvoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerInvoice&&(identical(other.id, id) || other.id == id)&&(identical(other.period, period) || other.period == period)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,period,totalAmount,paidAmount,status,issuedAt);

@override
String toString() {
  return 'LedgerInvoice(id: $id, period: $period, totalAmount: $totalAmount, paidAmount: $paidAmount, status: $status, issuedAt: $issuedAt)';
}


}

/// @nodoc
abstract mixin class _$LedgerInvoiceCopyWith<$Res> implements $LedgerInvoiceCopyWith<$Res> {
  factory _$LedgerInvoiceCopyWith(_LedgerInvoice value, $Res Function(_LedgerInvoice) _then) = __$LedgerInvoiceCopyWithImpl;
@override @useResult
$Res call({
 String id, LedgerPeriod period,@JsonKey(name: 'total_amount') String totalAmount,@JsonKey(name: 'paid_amount') String paidAmount, String status,@JsonKey(name: 'issued_at') String issuedAt
});


@override $LedgerPeriodCopyWith<$Res> get period;

}
/// @nodoc
class __$LedgerInvoiceCopyWithImpl<$Res>
    implements _$LedgerInvoiceCopyWith<$Res> {
  __$LedgerInvoiceCopyWithImpl(this._self, this._then);

  final _LedgerInvoice _self;
  final $Res Function(_LedgerInvoice) _then;

/// Create a copy of LedgerInvoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? period = null,Object? totalAmount = null,Object? paidAmount = null,Object? status = null,Object? issuedAt = null,}) {
  return _then(_LedgerInvoice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as LedgerPeriod,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LedgerInvoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LedgerPeriodCopyWith<$Res> get period {
  
  return $LedgerPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}
}


/// @nodoc
mixin _$LedgerDue {

 String get id; String get head;@JsonKey(name: 'head_label') String get headLabel; String get amount;@JsonKey(name: 'paid_amount') String get paidAmount; String get status; String get source;@JsonKey(name: 'due_date') String get dueDate;@JsonKey(name: 'waived_by') String? get waivedBy;@JsonKey(name: 'waive_reason') String? get waiveReason;
/// Create a copy of LedgerDue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerDueCopyWith<LedgerDue> get copyWith => _$LedgerDueCopyWithImpl<LedgerDue>(this as LedgerDue, _$identity);

  /// Serializes this LedgerDue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerDue&&(identical(other.id, id) || other.id == id)&&(identical(other.head, head) || other.head == head)&&(identical(other.headLabel, headLabel) || other.headLabel == headLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.source, source) || other.source == source)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.waivedBy, waivedBy) || other.waivedBy == waivedBy)&&(identical(other.waiveReason, waiveReason) || other.waiveReason == waiveReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,head,headLabel,amount,paidAmount,status,source,dueDate,waivedBy,waiveReason);

@override
String toString() {
  return 'LedgerDue(id: $id, head: $head, headLabel: $headLabel, amount: $amount, paidAmount: $paidAmount, status: $status, source: $source, dueDate: $dueDate, waivedBy: $waivedBy, waiveReason: $waiveReason)';
}


}

/// @nodoc
abstract mixin class $LedgerDueCopyWith<$Res>  {
  factory $LedgerDueCopyWith(LedgerDue value, $Res Function(LedgerDue) _then) = _$LedgerDueCopyWithImpl;
@useResult
$Res call({
 String id, String head,@JsonKey(name: 'head_label') String headLabel, String amount,@JsonKey(name: 'paid_amount') String paidAmount, String status, String source,@JsonKey(name: 'due_date') String dueDate,@JsonKey(name: 'waived_by') String? waivedBy,@JsonKey(name: 'waive_reason') String? waiveReason
});




}
/// @nodoc
class _$LedgerDueCopyWithImpl<$Res>
    implements $LedgerDueCopyWith<$Res> {
  _$LedgerDueCopyWithImpl(this._self, this._then);

  final LedgerDue _self;
  final $Res Function(LedgerDue) _then;

/// Create a copy of LedgerDue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? head = null,Object? headLabel = null,Object? amount = null,Object? paidAmount = null,Object? status = null,Object? source = null,Object? dueDate = null,Object? waivedBy = freezed,Object? waiveReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,headLabel: null == headLabel ? _self.headLabel : headLabel // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,waivedBy: freezed == waivedBy ? _self.waivedBy : waivedBy // ignore: cast_nullable_to_non_nullable
as String?,waiveReason: freezed == waiveReason ? _self.waiveReason : waiveReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerDue].
extension LedgerDuePatterns on LedgerDue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerDue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerDue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerDue value)  $default,){
final _that = this;
switch (_that) {
case _LedgerDue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerDue value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerDue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status,  String source, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'waived_by')  String? waivedBy, @JsonKey(name: 'waive_reason')  String? waiveReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerDue() when $default != null:
return $default(_that.id,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.status,_that.source,_that.dueDate,_that.waivedBy,_that.waiveReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status,  String source, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'waived_by')  String? waivedBy, @JsonKey(name: 'waive_reason')  String? waiveReason)  $default,) {final _that = this;
switch (_that) {
case _LedgerDue():
return $default(_that.id,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.status,_that.source,_that.dueDate,_that.waivedBy,_that.waiveReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String head, @JsonKey(name: 'head_label')  String headLabel,  String amount, @JsonKey(name: 'paid_amount')  String paidAmount,  String status,  String source, @JsonKey(name: 'due_date')  String dueDate, @JsonKey(name: 'waived_by')  String? waivedBy, @JsonKey(name: 'waive_reason')  String? waiveReason)?  $default,) {final _that = this;
switch (_that) {
case _LedgerDue() when $default != null:
return $default(_that.id,_that.head,_that.headLabel,_that.amount,_that.paidAmount,_that.status,_that.source,_that.dueDate,_that.waivedBy,_that.waiveReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerDue implements LedgerDue {
  const _LedgerDue({required this.id, required this.head, @JsonKey(name: 'head_label') required this.headLabel, required this.amount, @JsonKey(name: 'paid_amount') required this.paidAmount, required this.status, required this.source, @JsonKey(name: 'due_date') required this.dueDate, @JsonKey(name: 'waived_by') this.waivedBy, @JsonKey(name: 'waive_reason') this.waiveReason});
  factory _LedgerDue.fromJson(Map<String, dynamic> json) => _$LedgerDueFromJson(json);

@override final  String id;
@override final  String head;
@override@JsonKey(name: 'head_label') final  String headLabel;
@override final  String amount;
@override@JsonKey(name: 'paid_amount') final  String paidAmount;
@override final  String status;
@override final  String source;
@override@JsonKey(name: 'due_date') final  String dueDate;
@override@JsonKey(name: 'waived_by') final  String? waivedBy;
@override@JsonKey(name: 'waive_reason') final  String? waiveReason;

/// Create a copy of LedgerDue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerDueCopyWith<_LedgerDue> get copyWith => __$LedgerDueCopyWithImpl<_LedgerDue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerDueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerDue&&(identical(other.id, id) || other.id == id)&&(identical(other.head, head) || other.head == head)&&(identical(other.headLabel, headLabel) || other.headLabel == headLabel)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.source, source) || other.source == source)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.waivedBy, waivedBy) || other.waivedBy == waivedBy)&&(identical(other.waiveReason, waiveReason) || other.waiveReason == waiveReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,head,headLabel,amount,paidAmount,status,source,dueDate,waivedBy,waiveReason);

@override
String toString() {
  return 'LedgerDue(id: $id, head: $head, headLabel: $headLabel, amount: $amount, paidAmount: $paidAmount, status: $status, source: $source, dueDate: $dueDate, waivedBy: $waivedBy, waiveReason: $waiveReason)';
}


}

/// @nodoc
abstract mixin class _$LedgerDueCopyWith<$Res> implements $LedgerDueCopyWith<$Res> {
  factory _$LedgerDueCopyWith(_LedgerDue value, $Res Function(_LedgerDue) _then) = __$LedgerDueCopyWithImpl;
@override @useResult
$Res call({
 String id, String head,@JsonKey(name: 'head_label') String headLabel, String amount,@JsonKey(name: 'paid_amount') String paidAmount, String status, String source,@JsonKey(name: 'due_date') String dueDate,@JsonKey(name: 'waived_by') String? waivedBy,@JsonKey(name: 'waive_reason') String? waiveReason
});




}
/// @nodoc
class __$LedgerDueCopyWithImpl<$Res>
    implements _$LedgerDueCopyWith<$Res> {
  __$LedgerDueCopyWithImpl(this._self, this._then);

  final _LedgerDue _self;
  final $Res Function(_LedgerDue) _then;

/// Create a copy of LedgerDue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? head = null,Object? headLabel = null,Object? amount = null,Object? paidAmount = null,Object? status = null,Object? source = null,Object? dueDate = null,Object? waivedBy = freezed,Object? waiveReason = freezed,}) {
  return _then(_LedgerDue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,head: null == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String,headLabel: null == headLabel ? _self.headLabel : headLabel // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,waivedBy: freezed == waivedBy ? _self.waivedBy : waivedBy // ignore: cast_nullable_to_non_nullable
as String?,waiveReason: freezed == waiveReason ? _self.waiveReason : waiveReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LedgerPaymentApplication {

@JsonKey(name: 'target_type') String get targetType;@JsonKey(name: 'target_id') String get targetId;@JsonKey(name: 'applied_amount') String get appliedAmount;
/// Create a copy of LedgerPaymentApplication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerPaymentApplicationCopyWith<LedgerPaymentApplication> get copyWith => _$LedgerPaymentApplicationCopyWithImpl<LedgerPaymentApplication>(this as LedgerPaymentApplication, _$identity);

  /// Serializes this LedgerPaymentApplication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerPaymentApplication&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.appliedAmount, appliedAmount) || other.appliedAmount == appliedAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetType,targetId,appliedAmount);

@override
String toString() {
  return 'LedgerPaymentApplication(targetType: $targetType, targetId: $targetId, appliedAmount: $appliedAmount)';
}


}

/// @nodoc
abstract mixin class $LedgerPaymentApplicationCopyWith<$Res>  {
  factory $LedgerPaymentApplicationCopyWith(LedgerPaymentApplication value, $Res Function(LedgerPaymentApplication) _then) = _$LedgerPaymentApplicationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'target_type') String targetType,@JsonKey(name: 'target_id') String targetId,@JsonKey(name: 'applied_amount') String appliedAmount
});




}
/// @nodoc
class _$LedgerPaymentApplicationCopyWithImpl<$Res>
    implements $LedgerPaymentApplicationCopyWith<$Res> {
  _$LedgerPaymentApplicationCopyWithImpl(this._self, this._then);

  final LedgerPaymentApplication _self;
  final $Res Function(LedgerPaymentApplication) _then;

/// Create a copy of LedgerPaymentApplication
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


/// Adds pattern-matching-related methods to [LedgerPaymentApplication].
extension LedgerPaymentApplicationPatterns on LedgerPaymentApplication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerPaymentApplication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerPaymentApplication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerPaymentApplication value)  $default,){
final _that = this;
switch (_that) {
case _LedgerPaymentApplication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerPaymentApplication value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerPaymentApplication() when $default != null:
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
case _LedgerPaymentApplication() when $default != null:
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
case _LedgerPaymentApplication():
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
case _LedgerPaymentApplication() when $default != null:
return $default(_that.targetType,_that.targetId,_that.appliedAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerPaymentApplication implements LedgerPaymentApplication {
  const _LedgerPaymentApplication({@JsonKey(name: 'target_type') required this.targetType, @JsonKey(name: 'target_id') required this.targetId, @JsonKey(name: 'applied_amount') required this.appliedAmount});
  factory _LedgerPaymentApplication.fromJson(Map<String, dynamic> json) => _$LedgerPaymentApplicationFromJson(json);

@override@JsonKey(name: 'target_type') final  String targetType;
@override@JsonKey(name: 'target_id') final  String targetId;
@override@JsonKey(name: 'applied_amount') final  String appliedAmount;

/// Create a copy of LedgerPaymentApplication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerPaymentApplicationCopyWith<_LedgerPaymentApplication> get copyWith => __$LedgerPaymentApplicationCopyWithImpl<_LedgerPaymentApplication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerPaymentApplicationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerPaymentApplication&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.appliedAmount, appliedAmount) || other.appliedAmount == appliedAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetType,targetId,appliedAmount);

@override
String toString() {
  return 'LedgerPaymentApplication(targetType: $targetType, targetId: $targetId, appliedAmount: $appliedAmount)';
}


}

/// @nodoc
abstract mixin class _$LedgerPaymentApplicationCopyWith<$Res> implements $LedgerPaymentApplicationCopyWith<$Res> {
  factory _$LedgerPaymentApplicationCopyWith(_LedgerPaymentApplication value, $Res Function(_LedgerPaymentApplication) _then) = __$LedgerPaymentApplicationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'target_type') String targetType,@JsonKey(name: 'target_id') String targetId,@JsonKey(name: 'applied_amount') String appliedAmount
});




}
/// @nodoc
class __$LedgerPaymentApplicationCopyWithImpl<$Res>
    implements _$LedgerPaymentApplicationCopyWith<$Res> {
  __$LedgerPaymentApplicationCopyWithImpl(this._self, this._then);

  final _LedgerPaymentApplication _self;
  final $Res Function(_LedgerPaymentApplication) _then;

/// Create a copy of LedgerPaymentApplication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetType = null,Object? targetId = null,Object? appliedAmount = null,}) {
  return _then(_LedgerPaymentApplication(
targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,appliedAmount: null == appliedAmount ? _self.appliedAmount : appliedAmount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LedgerPayment {

 String get id; String get amount;@JsonKey(name: 'payment_method') String get paymentMethod;@JsonKey(name: 'paid_at') String get paidAt; List<LedgerPaymentApplication> get applications;
/// Create a copy of LedgerPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerPaymentCopyWith<LedgerPayment> get copyWith => _$LedgerPaymentCopyWithImpl<LedgerPayment>(this as LedgerPayment, _$identity);

  /// Serializes this LedgerPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerPayment&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&const DeepCollectionEquality().equals(other.applications, applications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,paymentMethod,paidAt,const DeepCollectionEquality().hash(applications));

@override
String toString() {
  return 'LedgerPayment(id: $id, amount: $amount, paymentMethod: $paymentMethod, paidAt: $paidAt, applications: $applications)';
}


}

/// @nodoc
abstract mixin class $LedgerPaymentCopyWith<$Res>  {
  factory $LedgerPaymentCopyWith(LedgerPayment value, $Res Function(LedgerPayment) _then) = _$LedgerPaymentCopyWithImpl;
@useResult
$Res call({
 String id, String amount,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'paid_at') String paidAt, List<LedgerPaymentApplication> applications
});




}
/// @nodoc
class _$LedgerPaymentCopyWithImpl<$Res>
    implements $LedgerPaymentCopyWith<$Res> {
  _$LedgerPaymentCopyWithImpl(this._self, this._then);

  final LedgerPayment _self;
  final $Res Function(LedgerPayment) _then;

/// Create a copy of LedgerPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? paymentMethod = null,Object? paidAt = null,Object? applications = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String,applications: null == applications ? _self.applications : applications // ignore: cast_nullable_to_non_nullable
as List<LedgerPaymentApplication>,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerPayment].
extension LedgerPaymentPatterns on LedgerPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerPayment value)  $default,){
final _that = this;
switch (_that) {
case _LedgerPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerPayment value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String amount, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'paid_at')  String paidAt,  List<LedgerPaymentApplication> applications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerPayment() when $default != null:
return $default(_that.id,_that.amount,_that.paymentMethod,_that.paidAt,_that.applications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String amount, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'paid_at')  String paidAt,  List<LedgerPaymentApplication> applications)  $default,) {final _that = this;
switch (_that) {
case _LedgerPayment():
return $default(_that.id,_that.amount,_that.paymentMethod,_that.paidAt,_that.applications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String amount, @JsonKey(name: 'payment_method')  String paymentMethod, @JsonKey(name: 'paid_at')  String paidAt,  List<LedgerPaymentApplication> applications)?  $default,) {final _that = this;
switch (_that) {
case _LedgerPayment() when $default != null:
return $default(_that.id,_that.amount,_that.paymentMethod,_that.paidAt,_that.applications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerPayment implements LedgerPayment {
  const _LedgerPayment({required this.id, required this.amount, @JsonKey(name: 'payment_method') required this.paymentMethod, @JsonKey(name: 'paid_at') required this.paidAt, final  List<LedgerPaymentApplication> applications = const <LedgerPaymentApplication>[]}): _applications = applications;
  factory _LedgerPayment.fromJson(Map<String, dynamic> json) => _$LedgerPaymentFromJson(json);

@override final  String id;
@override final  String amount;
@override@JsonKey(name: 'payment_method') final  String paymentMethod;
@override@JsonKey(name: 'paid_at') final  String paidAt;
 final  List<LedgerPaymentApplication> _applications;
@override@JsonKey() List<LedgerPaymentApplication> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}


/// Create a copy of LedgerPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerPaymentCopyWith<_LedgerPayment> get copyWith => __$LedgerPaymentCopyWithImpl<_LedgerPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerPayment&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&const DeepCollectionEquality().equals(other._applications, _applications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,paymentMethod,paidAt,const DeepCollectionEquality().hash(_applications));

@override
String toString() {
  return 'LedgerPayment(id: $id, amount: $amount, paymentMethod: $paymentMethod, paidAt: $paidAt, applications: $applications)';
}


}

/// @nodoc
abstract mixin class _$LedgerPaymentCopyWith<$Res> implements $LedgerPaymentCopyWith<$Res> {
  factory _$LedgerPaymentCopyWith(_LedgerPayment value, $Res Function(_LedgerPayment) _then) = __$LedgerPaymentCopyWithImpl;
@override @useResult
$Res call({
 String id, String amount,@JsonKey(name: 'payment_method') String paymentMethod,@JsonKey(name: 'paid_at') String paidAt, List<LedgerPaymentApplication> applications
});




}
/// @nodoc
class __$LedgerPaymentCopyWithImpl<$Res>
    implements _$LedgerPaymentCopyWith<$Res> {
  __$LedgerPaymentCopyWithImpl(this._self, this._then);

  final _LedgerPayment _self;
  final $Res Function(_LedgerPayment) _then;

/// Create a copy of LedgerPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? paymentMethod = null,Object? paidAt = null,Object? applications = null,}) {
  return _then(_LedgerPayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as String,applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<LedgerPaymentApplication>,
  ));
}


}


/// @nodoc
mixin _$LedgerSummary {

@JsonKey(name: 'total_billed') String get totalBilled;@JsonKey(name: 'total_paid') String get totalPaid;@JsonKey(name: 'total_outstanding') String get totalOutstanding;@JsonKey(name: 'total_waived') String get totalWaived;
/// Create a copy of LedgerSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedgerSummaryCopyWith<LedgerSummary> get copyWith => _$LedgerSummaryCopyWithImpl<LedgerSummary>(this as LedgerSummary, _$identity);

  /// Serializes this LedgerSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedgerSummary&&(identical(other.totalBilled, totalBilled) || other.totalBilled == totalBilled)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.totalWaived, totalWaived) || other.totalWaived == totalWaived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBilled,totalPaid,totalOutstanding,totalWaived);

@override
String toString() {
  return 'LedgerSummary(totalBilled: $totalBilled, totalPaid: $totalPaid, totalOutstanding: $totalOutstanding, totalWaived: $totalWaived)';
}


}

/// @nodoc
abstract mixin class $LedgerSummaryCopyWith<$Res>  {
  factory $LedgerSummaryCopyWith(LedgerSummary value, $Res Function(LedgerSummary) _then) = _$LedgerSummaryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_billed') String totalBilled,@JsonKey(name: 'total_paid') String totalPaid,@JsonKey(name: 'total_outstanding') String totalOutstanding,@JsonKey(name: 'total_waived') String totalWaived
});




}
/// @nodoc
class _$LedgerSummaryCopyWithImpl<$Res>
    implements $LedgerSummaryCopyWith<$Res> {
  _$LedgerSummaryCopyWithImpl(this._self, this._then);

  final LedgerSummary _self;
  final $Res Function(LedgerSummary) _then;

/// Create a copy of LedgerSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBilled = null,Object? totalPaid = null,Object? totalOutstanding = null,Object? totalWaived = null,}) {
  return _then(_self.copyWith(
totalBilled: null == totalBilled ? _self.totalBilled : totalBilled // ignore: cast_nullable_to_non_nullable
as String,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as String,totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as String,totalWaived: null == totalWaived ? _self.totalWaived : totalWaived // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LedgerSummary].
extension LedgerSummaryPatterns on LedgerSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedgerSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedgerSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedgerSummary value)  $default,){
final _that = this;
switch (_that) {
case _LedgerSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedgerSummary value)?  $default,){
final _that = this;
switch (_that) {
case _LedgerSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_billed')  String totalBilled, @JsonKey(name: 'total_paid')  String totalPaid, @JsonKey(name: 'total_outstanding')  String totalOutstanding, @JsonKey(name: 'total_waived')  String totalWaived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedgerSummary() when $default != null:
return $default(_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.totalWaived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_billed')  String totalBilled, @JsonKey(name: 'total_paid')  String totalPaid, @JsonKey(name: 'total_outstanding')  String totalOutstanding, @JsonKey(name: 'total_waived')  String totalWaived)  $default,) {final _that = this;
switch (_that) {
case _LedgerSummary():
return $default(_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.totalWaived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_billed')  String totalBilled, @JsonKey(name: 'total_paid')  String totalPaid, @JsonKey(name: 'total_outstanding')  String totalOutstanding, @JsonKey(name: 'total_waived')  String totalWaived)?  $default,) {final _that = this;
switch (_that) {
case _LedgerSummary() when $default != null:
return $default(_that.totalBilled,_that.totalPaid,_that.totalOutstanding,_that.totalWaived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedgerSummary implements LedgerSummary {
  const _LedgerSummary({@JsonKey(name: 'total_billed') required this.totalBilled, @JsonKey(name: 'total_paid') required this.totalPaid, @JsonKey(name: 'total_outstanding') required this.totalOutstanding, @JsonKey(name: 'total_waived') required this.totalWaived});
  factory _LedgerSummary.fromJson(Map<String, dynamic> json) => _$LedgerSummaryFromJson(json);

@override@JsonKey(name: 'total_billed') final  String totalBilled;
@override@JsonKey(name: 'total_paid') final  String totalPaid;
@override@JsonKey(name: 'total_outstanding') final  String totalOutstanding;
@override@JsonKey(name: 'total_waived') final  String totalWaived;

/// Create a copy of LedgerSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedgerSummaryCopyWith<_LedgerSummary> get copyWith => __$LedgerSummaryCopyWithImpl<_LedgerSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedgerSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedgerSummary&&(identical(other.totalBilled, totalBilled) || other.totalBilled == totalBilled)&&(identical(other.totalPaid, totalPaid) || other.totalPaid == totalPaid)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding)&&(identical(other.totalWaived, totalWaived) || other.totalWaived == totalWaived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBilled,totalPaid,totalOutstanding,totalWaived);

@override
String toString() {
  return 'LedgerSummary(totalBilled: $totalBilled, totalPaid: $totalPaid, totalOutstanding: $totalOutstanding, totalWaived: $totalWaived)';
}


}

/// @nodoc
abstract mixin class _$LedgerSummaryCopyWith<$Res> implements $LedgerSummaryCopyWith<$Res> {
  factory _$LedgerSummaryCopyWith(_LedgerSummary value, $Res Function(_LedgerSummary) _then) = __$LedgerSummaryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_billed') String totalBilled,@JsonKey(name: 'total_paid') String totalPaid,@JsonKey(name: 'total_outstanding') String totalOutstanding,@JsonKey(name: 'total_waived') String totalWaived
});




}
/// @nodoc
class __$LedgerSummaryCopyWithImpl<$Res>
    implements _$LedgerSummaryCopyWith<$Res> {
  __$LedgerSummaryCopyWithImpl(this._self, this._then);

  final _LedgerSummary _self;
  final $Res Function(_LedgerSummary) _then;

/// Create a copy of LedgerSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBilled = null,Object? totalPaid = null,Object? totalOutstanding = null,Object? totalWaived = null,}) {
  return _then(_LedgerSummary(
totalBilled: null == totalBilled ? _self.totalBilled : totalBilled // ignore: cast_nullable_to_non_nullable
as String,totalPaid: null == totalPaid ? _self.totalPaid : totalPaid // ignore: cast_nullable_to_non_nullable
as String,totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as String,totalWaived: null == totalWaived ? _self.totalWaived : totalWaived // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RenterLedger {

 List<LedgerInvoice> get invoices; List<LedgerDue> get dues; List<LedgerPayment> get payments; LedgerSummary get summary;
/// Create a copy of RenterLedger
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenterLedgerCopyWith<RenterLedger> get copyWith => _$RenterLedgerCopyWithImpl<RenterLedger>(this as RenterLedger, _$identity);

  /// Serializes this RenterLedger to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenterLedger&&const DeepCollectionEquality().equals(other.invoices, invoices)&&const DeepCollectionEquality().equals(other.dues, dues)&&const DeepCollectionEquality().equals(other.payments, payments)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invoices),const DeepCollectionEquality().hash(dues),const DeepCollectionEquality().hash(payments),summary);

@override
String toString() {
  return 'RenterLedger(invoices: $invoices, dues: $dues, payments: $payments, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $RenterLedgerCopyWith<$Res>  {
  factory $RenterLedgerCopyWith(RenterLedger value, $Res Function(RenterLedger) _then) = _$RenterLedgerCopyWithImpl;
@useResult
$Res call({
 List<LedgerInvoice> invoices, List<LedgerDue> dues, List<LedgerPayment> payments, LedgerSummary summary
});


$LedgerSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$RenterLedgerCopyWithImpl<$Res>
    implements $RenterLedgerCopyWith<$Res> {
  _$RenterLedgerCopyWithImpl(this._self, this._then);

  final RenterLedger _self;
  final $Res Function(RenterLedger) _then;

/// Create a copy of RenterLedger
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoices = null,Object? dues = null,Object? payments = null,Object? summary = null,}) {
  return _then(_self.copyWith(
invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<LedgerInvoice>,dues: null == dues ? _self.dues : dues // ignore: cast_nullable_to_non_nullable
as List<LedgerDue>,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<LedgerPayment>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LedgerSummary,
  ));
}
/// Create a copy of RenterLedger
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LedgerSummaryCopyWith<$Res> get summary {
  
  return $LedgerSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [RenterLedger].
extension RenterLedgerPatterns on RenterLedger {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RenterLedger value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RenterLedger() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RenterLedger value)  $default,){
final _that = this;
switch (_that) {
case _RenterLedger():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RenterLedger value)?  $default,){
final _that = this;
switch (_that) {
case _RenterLedger() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LedgerInvoice> invoices,  List<LedgerDue> dues,  List<LedgerPayment> payments,  LedgerSummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RenterLedger() when $default != null:
return $default(_that.invoices,_that.dues,_that.payments,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LedgerInvoice> invoices,  List<LedgerDue> dues,  List<LedgerPayment> payments,  LedgerSummary summary)  $default,) {final _that = this;
switch (_that) {
case _RenterLedger():
return $default(_that.invoices,_that.dues,_that.payments,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LedgerInvoice> invoices,  List<LedgerDue> dues,  List<LedgerPayment> payments,  LedgerSummary summary)?  $default,) {final _that = this;
switch (_that) {
case _RenterLedger() when $default != null:
return $default(_that.invoices,_that.dues,_that.payments,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RenterLedger implements RenterLedger {
  const _RenterLedger({final  List<LedgerInvoice> invoices = const <LedgerInvoice>[], final  List<LedgerDue> dues = const <LedgerDue>[], final  List<LedgerPayment> payments = const <LedgerPayment>[], required this.summary}): _invoices = invoices,_dues = dues,_payments = payments;
  factory _RenterLedger.fromJson(Map<String, dynamic> json) => _$RenterLedgerFromJson(json);

 final  List<LedgerInvoice> _invoices;
@override@JsonKey() List<LedgerInvoice> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}

 final  List<LedgerDue> _dues;
@override@JsonKey() List<LedgerDue> get dues {
  if (_dues is EqualUnmodifiableListView) return _dues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dues);
}

 final  List<LedgerPayment> _payments;
@override@JsonKey() List<LedgerPayment> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}

@override final  LedgerSummary summary;

/// Create a copy of RenterLedger
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenterLedgerCopyWith<_RenterLedger> get copyWith => __$RenterLedgerCopyWithImpl<_RenterLedger>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenterLedgerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenterLedger&&const DeepCollectionEquality().equals(other._invoices, _invoices)&&const DeepCollectionEquality().equals(other._dues, _dues)&&const DeepCollectionEquality().equals(other._payments, _payments)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invoices),const DeepCollectionEquality().hash(_dues),const DeepCollectionEquality().hash(_payments),summary);

@override
String toString() {
  return 'RenterLedger(invoices: $invoices, dues: $dues, payments: $payments, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$RenterLedgerCopyWith<$Res> implements $RenterLedgerCopyWith<$Res> {
  factory _$RenterLedgerCopyWith(_RenterLedger value, $Res Function(_RenterLedger) _then) = __$RenterLedgerCopyWithImpl;
@override @useResult
$Res call({
 List<LedgerInvoice> invoices, List<LedgerDue> dues, List<LedgerPayment> payments, LedgerSummary summary
});


@override $LedgerSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$RenterLedgerCopyWithImpl<$Res>
    implements _$RenterLedgerCopyWith<$Res> {
  __$RenterLedgerCopyWithImpl(this._self, this._then);

  final _RenterLedger _self;
  final $Res Function(_RenterLedger) _then;

/// Create a copy of RenterLedger
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoices = null,Object? dues = null,Object? payments = null,Object? summary = null,}) {
  return _then(_RenterLedger(
invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<LedgerInvoice>,dues: null == dues ? _self._dues : dues // ignore: cast_nullable_to_non_nullable
as List<LedgerDue>,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<LedgerPayment>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as LedgerSummary,
  ));
}

/// Create a copy of RenterLedger
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LedgerSummaryCopyWith<$Res> get summary {
  
  return $LedgerSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
