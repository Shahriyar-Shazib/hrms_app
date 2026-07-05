// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PnlPeriod {

 int get year; int get month;
/// Create a copy of PnlPeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PnlPeriodCopyWith<PnlPeriod> get copyWith => _$PnlPeriodCopyWithImpl<PnlPeriod>(this as PnlPeriod, _$identity);

  /// Serializes this PnlPeriod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PnlPeriod&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month);

@override
String toString() {
  return 'PnlPeriod(year: $year, month: $month)';
}


}

/// @nodoc
abstract mixin class $PnlPeriodCopyWith<$Res>  {
  factory $PnlPeriodCopyWith(PnlPeriod value, $Res Function(PnlPeriod) _then) = _$PnlPeriodCopyWithImpl;
@useResult
$Res call({
 int year, int month
});




}
/// @nodoc
class _$PnlPeriodCopyWithImpl<$Res>
    implements $PnlPeriodCopyWith<$Res> {
  _$PnlPeriodCopyWithImpl(this._self, this._then);

  final PnlPeriod _self;
  final $Res Function(PnlPeriod) _then;

/// Create a copy of PnlPeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? month = null,}) {
  return _then(_self.copyWith(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PnlPeriod].
extension PnlPeriodPatterns on PnlPeriod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PnlPeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PnlPeriod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PnlPeriod value)  $default,){
final _that = this;
switch (_that) {
case _PnlPeriod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PnlPeriod value)?  $default,){
final _that = this;
switch (_that) {
case _PnlPeriod() when $default != null:
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
case _PnlPeriod() when $default != null:
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
case _PnlPeriod():
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
case _PnlPeriod() when $default != null:
return $default(_that.year,_that.month);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PnlPeriod implements PnlPeriod {
  const _PnlPeriod({required this.year, required this.month});
  factory _PnlPeriod.fromJson(Map<String, dynamic> json) => _$PnlPeriodFromJson(json);

@override final  int year;
@override final  int month;

/// Create a copy of PnlPeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PnlPeriodCopyWith<_PnlPeriod> get copyWith => __$PnlPeriodCopyWithImpl<_PnlPeriod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PnlPeriodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PnlPeriod&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month);

@override
String toString() {
  return 'PnlPeriod(year: $year, month: $month)';
}


}

/// @nodoc
abstract mixin class _$PnlPeriodCopyWith<$Res> implements $PnlPeriodCopyWith<$Res> {
  factory _$PnlPeriodCopyWith(_PnlPeriod value, $Res Function(_PnlPeriod) _then) = __$PnlPeriodCopyWithImpl;
@override @useResult
$Res call({
 int year, int month
});




}
/// @nodoc
class __$PnlPeriodCopyWithImpl<$Res>
    implements _$PnlPeriodCopyWith<$Res> {
  __$PnlPeriodCopyWithImpl(this._self, this._then);

  final _PnlPeriod _self;
  final $Res Function(_PnlPeriod) _then;

/// Create a copy of PnlPeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? month = null,}) {
  return _then(_PnlPeriod(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PnlBilled {

@JsonKey(name: 'invoices_total') String get invoicesTotal; String get rent; String get electricity; String get bills;@JsonKey(name: 'manual_dues') String get manualDues; String get total;
/// Create a copy of PnlBilled
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PnlBilledCopyWith<PnlBilled> get copyWith => _$PnlBilledCopyWithImpl<PnlBilled>(this as PnlBilled, _$identity);

  /// Serializes this PnlBilled to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PnlBilled&&(identical(other.invoicesTotal, invoicesTotal) || other.invoicesTotal == invoicesTotal)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.electricity, electricity) || other.electricity == electricity)&&(identical(other.bills, bills) || other.bills == bills)&&(identical(other.manualDues, manualDues) || other.manualDues == manualDues)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invoicesTotal,rent,electricity,bills,manualDues,total);

@override
String toString() {
  return 'PnlBilled(invoicesTotal: $invoicesTotal, rent: $rent, electricity: $electricity, bills: $bills, manualDues: $manualDues, total: $total)';
}


}

/// @nodoc
abstract mixin class $PnlBilledCopyWith<$Res>  {
  factory $PnlBilledCopyWith(PnlBilled value, $Res Function(PnlBilled) _then) = _$PnlBilledCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'invoices_total') String invoicesTotal, String rent, String electricity, String bills,@JsonKey(name: 'manual_dues') String manualDues, String total
});




}
/// @nodoc
class _$PnlBilledCopyWithImpl<$Res>
    implements $PnlBilledCopyWith<$Res> {
  _$PnlBilledCopyWithImpl(this._self, this._then);

  final PnlBilled _self;
  final $Res Function(PnlBilled) _then;

/// Create a copy of PnlBilled
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invoicesTotal = null,Object? rent = null,Object? electricity = null,Object? bills = null,Object? manualDues = null,Object? total = null,}) {
  return _then(_self.copyWith(
invoicesTotal: null == invoicesTotal ? _self.invoicesTotal : invoicesTotal // ignore: cast_nullable_to_non_nullable
as String,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as String,electricity: null == electricity ? _self.electricity : electricity // ignore: cast_nullable_to_non_nullable
as String,bills: null == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as String,manualDues: null == manualDues ? _self.manualDues : manualDues // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PnlBilled].
extension PnlBilledPatterns on PnlBilled {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PnlBilled value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PnlBilled() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PnlBilled value)  $default,){
final _that = this;
switch (_that) {
case _PnlBilled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PnlBilled value)?  $default,){
final _that = this;
switch (_that) {
case _PnlBilled() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'invoices_total')  String invoicesTotal,  String rent,  String electricity,  String bills, @JsonKey(name: 'manual_dues')  String manualDues,  String total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PnlBilled() when $default != null:
return $default(_that.invoicesTotal,_that.rent,_that.electricity,_that.bills,_that.manualDues,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'invoices_total')  String invoicesTotal,  String rent,  String electricity,  String bills, @JsonKey(name: 'manual_dues')  String manualDues,  String total)  $default,) {final _that = this;
switch (_that) {
case _PnlBilled():
return $default(_that.invoicesTotal,_that.rent,_that.electricity,_that.bills,_that.manualDues,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'invoices_total')  String invoicesTotal,  String rent,  String electricity,  String bills, @JsonKey(name: 'manual_dues')  String manualDues,  String total)?  $default,) {final _that = this;
switch (_that) {
case _PnlBilled() when $default != null:
return $default(_that.invoicesTotal,_that.rent,_that.electricity,_that.bills,_that.manualDues,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PnlBilled implements PnlBilled {
  const _PnlBilled({@JsonKey(name: 'invoices_total') required this.invoicesTotal, required this.rent, required this.electricity, required this.bills, @JsonKey(name: 'manual_dues') required this.manualDues, required this.total});
  factory _PnlBilled.fromJson(Map<String, dynamic> json) => _$PnlBilledFromJson(json);

@override@JsonKey(name: 'invoices_total') final  String invoicesTotal;
@override final  String rent;
@override final  String electricity;
@override final  String bills;
@override@JsonKey(name: 'manual_dues') final  String manualDues;
@override final  String total;

/// Create a copy of PnlBilled
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PnlBilledCopyWith<_PnlBilled> get copyWith => __$PnlBilledCopyWithImpl<_PnlBilled>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PnlBilledToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PnlBilled&&(identical(other.invoicesTotal, invoicesTotal) || other.invoicesTotal == invoicesTotal)&&(identical(other.rent, rent) || other.rent == rent)&&(identical(other.electricity, electricity) || other.electricity == electricity)&&(identical(other.bills, bills) || other.bills == bills)&&(identical(other.manualDues, manualDues) || other.manualDues == manualDues)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,invoicesTotal,rent,electricity,bills,manualDues,total);

@override
String toString() {
  return 'PnlBilled(invoicesTotal: $invoicesTotal, rent: $rent, electricity: $electricity, bills: $bills, manualDues: $manualDues, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PnlBilledCopyWith<$Res> implements $PnlBilledCopyWith<$Res> {
  factory _$PnlBilledCopyWith(_PnlBilled value, $Res Function(_PnlBilled) _then) = __$PnlBilledCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'invoices_total') String invoicesTotal, String rent, String electricity, String bills,@JsonKey(name: 'manual_dues') String manualDues, String total
});




}
/// @nodoc
class __$PnlBilledCopyWithImpl<$Res>
    implements _$PnlBilledCopyWith<$Res> {
  __$PnlBilledCopyWithImpl(this._self, this._then);

  final _PnlBilled _self;
  final $Res Function(_PnlBilled) _then;

/// Create a copy of PnlBilled
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invoicesTotal = null,Object? rent = null,Object? electricity = null,Object? bills = null,Object? manualDues = null,Object? total = null,}) {
  return _then(_PnlBilled(
invoicesTotal: null == invoicesTotal ? _self.invoicesTotal : invoicesTotal // ignore: cast_nullable_to_non_nullable
as String,rent: null == rent ? _self.rent : rent // ignore: cast_nullable_to_non_nullable
as String,electricity: null == electricity ? _self.electricity : electricity // ignore: cast_nullable_to_non_nullable
as String,bills: null == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as String,manualDues: null == manualDues ? _self.manualDues : manualDues // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PnlCollected {

 String get total;
/// Create a copy of PnlCollected
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PnlCollectedCopyWith<PnlCollected> get copyWith => _$PnlCollectedCopyWithImpl<PnlCollected>(this as PnlCollected, _$identity);

  /// Serializes this PnlCollected to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PnlCollected&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'PnlCollected(total: $total)';
}


}

/// @nodoc
abstract mixin class $PnlCollectedCopyWith<$Res>  {
  factory $PnlCollectedCopyWith(PnlCollected value, $Res Function(PnlCollected) _then) = _$PnlCollectedCopyWithImpl;
@useResult
$Res call({
 String total
});




}
/// @nodoc
class _$PnlCollectedCopyWithImpl<$Res>
    implements $PnlCollectedCopyWith<$Res> {
  _$PnlCollectedCopyWithImpl(this._self, this._then);

  final PnlCollected _self;
  final $Res Function(PnlCollected) _then;

/// Create a copy of PnlCollected
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PnlCollected].
extension PnlCollectedPatterns on PnlCollected {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PnlCollected value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PnlCollected() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PnlCollected value)  $default,){
final _that = this;
switch (_that) {
case _PnlCollected():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PnlCollected value)?  $default,){
final _that = this;
switch (_that) {
case _PnlCollected() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PnlCollected() when $default != null:
return $default(_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String total)  $default,) {final _that = this;
switch (_that) {
case _PnlCollected():
return $default(_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String total)?  $default,) {final _that = this;
switch (_that) {
case _PnlCollected() when $default != null:
return $default(_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PnlCollected implements PnlCollected {
  const _PnlCollected({required this.total});
  factory _PnlCollected.fromJson(Map<String, dynamic> json) => _$PnlCollectedFromJson(json);

@override final  String total;

/// Create a copy of PnlCollected
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PnlCollectedCopyWith<_PnlCollected> get copyWith => __$PnlCollectedCopyWithImpl<_PnlCollected>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PnlCollectedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PnlCollected&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'PnlCollected(total: $total)';
}


}

/// @nodoc
abstract mixin class _$PnlCollectedCopyWith<$Res> implements $PnlCollectedCopyWith<$Res> {
  factory _$PnlCollectedCopyWith(_PnlCollected value, $Res Function(_PnlCollected) _then) = __$PnlCollectedCopyWithImpl;
@override @useResult
$Res call({
 String total
});




}
/// @nodoc
class __$PnlCollectedCopyWithImpl<$Res>
    implements _$PnlCollectedCopyWith<$Res> {
  __$PnlCollectedCopyWithImpl(this._self, this._then);

  final _PnlCollected _self;
  final $Res Function(_PnlCollected) _then;

/// Create a copy of PnlCollected
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,}) {
  return _then(_PnlCollected(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PnlExpenses {

@JsonKey(name: 'by_category') Map<String, String> get byCategory; String get total;
/// Create a copy of PnlExpenses
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PnlExpensesCopyWith<PnlExpenses> get copyWith => _$PnlExpensesCopyWithImpl<PnlExpenses>(this as PnlExpenses, _$identity);

  /// Serializes this PnlExpenses to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PnlExpenses&&const DeepCollectionEquality().equals(other.byCategory, byCategory)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(byCategory),total);

@override
String toString() {
  return 'PnlExpenses(byCategory: $byCategory, total: $total)';
}


}

/// @nodoc
abstract mixin class $PnlExpensesCopyWith<$Res>  {
  factory $PnlExpensesCopyWith(PnlExpenses value, $Res Function(PnlExpenses) _then) = _$PnlExpensesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'by_category') Map<String, String> byCategory, String total
});




}
/// @nodoc
class _$PnlExpensesCopyWithImpl<$Res>
    implements $PnlExpensesCopyWith<$Res> {
  _$PnlExpensesCopyWithImpl(this._self, this._then);

  final PnlExpenses _self;
  final $Res Function(PnlExpenses) _then;

/// Create a copy of PnlExpenses
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? byCategory = null,Object? total = null,}) {
  return _then(_self.copyWith(
byCategory: null == byCategory ? _self.byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as Map<String, String>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PnlExpenses].
extension PnlExpensesPatterns on PnlExpenses {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PnlExpenses value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PnlExpenses() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PnlExpenses value)  $default,){
final _that = this;
switch (_that) {
case _PnlExpenses():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PnlExpenses value)?  $default,){
final _that = this;
switch (_that) {
case _PnlExpenses() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'by_category')  Map<String, String> byCategory,  String total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PnlExpenses() when $default != null:
return $default(_that.byCategory,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'by_category')  Map<String, String> byCategory,  String total)  $default,) {final _that = this;
switch (_that) {
case _PnlExpenses():
return $default(_that.byCategory,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'by_category')  Map<String, String> byCategory,  String total)?  $default,) {final _that = this;
switch (_that) {
case _PnlExpenses() when $default != null:
return $default(_that.byCategory,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PnlExpenses implements PnlExpenses {
  const _PnlExpenses({@JsonKey(name: 'by_category') required final  Map<String, String> byCategory, required this.total}): _byCategory = byCategory;
  factory _PnlExpenses.fromJson(Map<String, dynamic> json) => _$PnlExpensesFromJson(json);

 final  Map<String, String> _byCategory;
@override@JsonKey(name: 'by_category') Map<String, String> get byCategory {
  if (_byCategory is EqualUnmodifiableMapView) return _byCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_byCategory);
}

@override final  String total;

/// Create a copy of PnlExpenses
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PnlExpensesCopyWith<_PnlExpenses> get copyWith => __$PnlExpensesCopyWithImpl<_PnlExpenses>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PnlExpensesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PnlExpenses&&const DeepCollectionEquality().equals(other._byCategory, _byCategory)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_byCategory),total);

@override
String toString() {
  return 'PnlExpenses(byCategory: $byCategory, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PnlExpensesCopyWith<$Res> implements $PnlExpensesCopyWith<$Res> {
  factory _$PnlExpensesCopyWith(_PnlExpenses value, $Res Function(_PnlExpenses) _then) = __$PnlExpensesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'by_category') Map<String, String> byCategory, String total
});




}
/// @nodoc
class __$PnlExpensesCopyWithImpl<$Res>
    implements _$PnlExpensesCopyWith<$Res> {
  __$PnlExpensesCopyWithImpl(this._self, this._then);

  final _PnlExpenses _self;
  final $Res Function(_PnlExpenses) _then;

/// Create a copy of PnlExpenses
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? byCategory = null,Object? total = null,}) {
  return _then(_PnlExpenses(
byCategory: null == byCategory ? _self._byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as Map<String, String>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PnlReport {

 PnlPeriod get period; PnlBilled get billed; PnlCollected get collected; PnlExpenses get expenses;@JsonKey(name: 'net_billed') String get netBilled;@JsonKey(name: 'net_collected') String get netCollected;@JsonKey(name: 'collection_gap') String get collectionGap;
/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PnlReportCopyWith<PnlReport> get copyWith => _$PnlReportCopyWithImpl<PnlReport>(this as PnlReport, _$identity);

  /// Serializes this PnlReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PnlReport&&(identical(other.period, period) || other.period == period)&&(identical(other.billed, billed) || other.billed == billed)&&(identical(other.collected, collected) || other.collected == collected)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.netBilled, netBilled) || other.netBilled == netBilled)&&(identical(other.netCollected, netCollected) || other.netCollected == netCollected)&&(identical(other.collectionGap, collectionGap) || other.collectionGap == collectionGap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,billed,collected,expenses,netBilled,netCollected,collectionGap);

@override
String toString() {
  return 'PnlReport(period: $period, billed: $billed, collected: $collected, expenses: $expenses, netBilled: $netBilled, netCollected: $netCollected, collectionGap: $collectionGap)';
}


}

/// @nodoc
abstract mixin class $PnlReportCopyWith<$Res>  {
  factory $PnlReportCopyWith(PnlReport value, $Res Function(PnlReport) _then) = _$PnlReportCopyWithImpl;
@useResult
$Res call({
 PnlPeriod period, PnlBilled billed, PnlCollected collected, PnlExpenses expenses,@JsonKey(name: 'net_billed') String netBilled,@JsonKey(name: 'net_collected') String netCollected,@JsonKey(name: 'collection_gap') String collectionGap
});


$PnlPeriodCopyWith<$Res> get period;$PnlBilledCopyWith<$Res> get billed;$PnlCollectedCopyWith<$Res> get collected;$PnlExpensesCopyWith<$Res> get expenses;

}
/// @nodoc
class _$PnlReportCopyWithImpl<$Res>
    implements $PnlReportCopyWith<$Res> {
  _$PnlReportCopyWithImpl(this._self, this._then);

  final PnlReport _self;
  final $Res Function(PnlReport) _then;

/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? billed = null,Object? collected = null,Object? expenses = null,Object? netBilled = null,Object? netCollected = null,Object? collectionGap = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PnlPeriod,billed: null == billed ? _self.billed : billed // ignore: cast_nullable_to_non_nullable
as PnlBilled,collected: null == collected ? _self.collected : collected // ignore: cast_nullable_to_non_nullable
as PnlCollected,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as PnlExpenses,netBilled: null == netBilled ? _self.netBilled : netBilled // ignore: cast_nullable_to_non_nullable
as String,netCollected: null == netCollected ? _self.netCollected : netCollected // ignore: cast_nullable_to_non_nullable
as String,collectionGap: null == collectionGap ? _self.collectionGap : collectionGap // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PnlPeriodCopyWith<$Res> get period {
  
  return $PnlPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PnlBilledCopyWith<$Res> get billed {
  
  return $PnlBilledCopyWith<$Res>(_self.billed, (value) {
    return _then(_self.copyWith(billed: value));
  });
}/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PnlCollectedCopyWith<$Res> get collected {
  
  return $PnlCollectedCopyWith<$Res>(_self.collected, (value) {
    return _then(_self.copyWith(collected: value));
  });
}/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PnlExpensesCopyWith<$Res> get expenses {
  
  return $PnlExpensesCopyWith<$Res>(_self.expenses, (value) {
    return _then(_self.copyWith(expenses: value));
  });
}
}


/// Adds pattern-matching-related methods to [PnlReport].
extension PnlReportPatterns on PnlReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PnlReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PnlReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PnlReport value)  $default,){
final _that = this;
switch (_that) {
case _PnlReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PnlReport value)?  $default,){
final _that = this;
switch (_that) {
case _PnlReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PnlPeriod period,  PnlBilled billed,  PnlCollected collected,  PnlExpenses expenses, @JsonKey(name: 'net_billed')  String netBilled, @JsonKey(name: 'net_collected')  String netCollected, @JsonKey(name: 'collection_gap')  String collectionGap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PnlReport() when $default != null:
return $default(_that.period,_that.billed,_that.collected,_that.expenses,_that.netBilled,_that.netCollected,_that.collectionGap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PnlPeriod period,  PnlBilled billed,  PnlCollected collected,  PnlExpenses expenses, @JsonKey(name: 'net_billed')  String netBilled, @JsonKey(name: 'net_collected')  String netCollected, @JsonKey(name: 'collection_gap')  String collectionGap)  $default,) {final _that = this;
switch (_that) {
case _PnlReport():
return $default(_that.period,_that.billed,_that.collected,_that.expenses,_that.netBilled,_that.netCollected,_that.collectionGap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PnlPeriod period,  PnlBilled billed,  PnlCollected collected,  PnlExpenses expenses, @JsonKey(name: 'net_billed')  String netBilled, @JsonKey(name: 'net_collected')  String netCollected, @JsonKey(name: 'collection_gap')  String collectionGap)?  $default,) {final _that = this;
switch (_that) {
case _PnlReport() when $default != null:
return $default(_that.period,_that.billed,_that.collected,_that.expenses,_that.netBilled,_that.netCollected,_that.collectionGap);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PnlReport implements PnlReport {
  const _PnlReport({required this.period, required this.billed, required this.collected, required this.expenses, @JsonKey(name: 'net_billed') required this.netBilled, @JsonKey(name: 'net_collected') required this.netCollected, @JsonKey(name: 'collection_gap') required this.collectionGap});
  factory _PnlReport.fromJson(Map<String, dynamic> json) => _$PnlReportFromJson(json);

@override final  PnlPeriod period;
@override final  PnlBilled billed;
@override final  PnlCollected collected;
@override final  PnlExpenses expenses;
@override@JsonKey(name: 'net_billed') final  String netBilled;
@override@JsonKey(name: 'net_collected') final  String netCollected;
@override@JsonKey(name: 'collection_gap') final  String collectionGap;

/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PnlReportCopyWith<_PnlReport> get copyWith => __$PnlReportCopyWithImpl<_PnlReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PnlReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PnlReport&&(identical(other.period, period) || other.period == period)&&(identical(other.billed, billed) || other.billed == billed)&&(identical(other.collected, collected) || other.collected == collected)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.netBilled, netBilled) || other.netBilled == netBilled)&&(identical(other.netCollected, netCollected) || other.netCollected == netCollected)&&(identical(other.collectionGap, collectionGap) || other.collectionGap == collectionGap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,period,billed,collected,expenses,netBilled,netCollected,collectionGap);

@override
String toString() {
  return 'PnlReport(period: $period, billed: $billed, collected: $collected, expenses: $expenses, netBilled: $netBilled, netCollected: $netCollected, collectionGap: $collectionGap)';
}


}

/// @nodoc
abstract mixin class _$PnlReportCopyWith<$Res> implements $PnlReportCopyWith<$Res> {
  factory _$PnlReportCopyWith(_PnlReport value, $Res Function(_PnlReport) _then) = __$PnlReportCopyWithImpl;
@override @useResult
$Res call({
 PnlPeriod period, PnlBilled billed, PnlCollected collected, PnlExpenses expenses,@JsonKey(name: 'net_billed') String netBilled,@JsonKey(name: 'net_collected') String netCollected,@JsonKey(name: 'collection_gap') String collectionGap
});


@override $PnlPeriodCopyWith<$Res> get period;@override $PnlBilledCopyWith<$Res> get billed;@override $PnlCollectedCopyWith<$Res> get collected;@override $PnlExpensesCopyWith<$Res> get expenses;

}
/// @nodoc
class __$PnlReportCopyWithImpl<$Res>
    implements _$PnlReportCopyWith<$Res> {
  __$PnlReportCopyWithImpl(this._self, this._then);

  final _PnlReport _self;
  final $Res Function(_PnlReport) _then;

/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? billed = null,Object? collected = null,Object? expenses = null,Object? netBilled = null,Object? netCollected = null,Object? collectionGap = null,}) {
  return _then(_PnlReport(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PnlPeriod,billed: null == billed ? _self.billed : billed // ignore: cast_nullable_to_non_nullable
as PnlBilled,collected: null == collected ? _self.collected : collected // ignore: cast_nullable_to_non_nullable
as PnlCollected,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as PnlExpenses,netBilled: null == netBilled ? _self.netBilled : netBilled // ignore: cast_nullable_to_non_nullable
as String,netCollected: null == netCollected ? _self.netCollected : netCollected // ignore: cast_nullable_to_non_nullable
as String,collectionGap: null == collectionGap ? _self.collectionGap : collectionGap // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PnlPeriodCopyWith<$Res> get period {
  
  return $PnlPeriodCopyWith<$Res>(_self.period, (value) {
    return _then(_self.copyWith(period: value));
  });
}/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PnlBilledCopyWith<$Res> get billed {
  
  return $PnlBilledCopyWith<$Res>(_self.billed, (value) {
    return _then(_self.copyWith(billed: value));
  });
}/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PnlCollectedCopyWith<$Res> get collected {
  
  return $PnlCollectedCopyWith<$Res>(_self.collected, (value) {
    return _then(_self.copyWith(collected: value));
  });
}/// Create a copy of PnlReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PnlExpensesCopyWith<$Res> get expenses {
  
  return $PnlExpensesCopyWith<$Res>(_self.expenses, (value) {
    return _then(_self.copyWith(expenses: value));
  });
}
}


/// @nodoc
mixin _$OccupancyReport {

@JsonKey(name: 'total_rooms') int get totalRooms; int get occupied; int get vacant;@JsonKey(name: 'occupancy_rate') String get occupancyRate;
/// Create a copy of OccupancyReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OccupancyReportCopyWith<OccupancyReport> get copyWith => _$OccupancyReportCopyWithImpl<OccupancyReport>(this as OccupancyReport, _$identity);

  /// Serializes this OccupancyReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OccupancyReport&&(identical(other.totalRooms, totalRooms) || other.totalRooms == totalRooms)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.vacant, vacant) || other.vacant == vacant)&&(identical(other.occupancyRate, occupancyRate) || other.occupancyRate == occupancyRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRooms,occupied,vacant,occupancyRate);

@override
String toString() {
  return 'OccupancyReport(totalRooms: $totalRooms, occupied: $occupied, vacant: $vacant, occupancyRate: $occupancyRate)';
}


}

/// @nodoc
abstract mixin class $OccupancyReportCopyWith<$Res>  {
  factory $OccupancyReportCopyWith(OccupancyReport value, $Res Function(OccupancyReport) _then) = _$OccupancyReportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_rooms') int totalRooms, int occupied, int vacant,@JsonKey(name: 'occupancy_rate') String occupancyRate
});




}
/// @nodoc
class _$OccupancyReportCopyWithImpl<$Res>
    implements $OccupancyReportCopyWith<$Res> {
  _$OccupancyReportCopyWithImpl(this._self, this._then);

  final OccupancyReport _self;
  final $Res Function(OccupancyReport) _then;

/// Create a copy of OccupancyReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRooms = null,Object? occupied = null,Object? vacant = null,Object? occupancyRate = null,}) {
  return _then(_self.copyWith(
totalRooms: null == totalRooms ? _self.totalRooms : totalRooms // ignore: cast_nullable_to_non_nullable
as int,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as int,vacant: null == vacant ? _self.vacant : vacant // ignore: cast_nullable_to_non_nullable
as int,occupancyRate: null == occupancyRate ? _self.occupancyRate : occupancyRate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OccupancyReport].
extension OccupancyReportPatterns on OccupancyReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OccupancyReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OccupancyReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OccupancyReport value)  $default,){
final _that = this;
switch (_that) {
case _OccupancyReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OccupancyReport value)?  $default,){
final _that = this;
switch (_that) {
case _OccupancyReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_rooms')  int totalRooms,  int occupied,  int vacant, @JsonKey(name: 'occupancy_rate')  String occupancyRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OccupancyReport() when $default != null:
return $default(_that.totalRooms,_that.occupied,_that.vacant,_that.occupancyRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_rooms')  int totalRooms,  int occupied,  int vacant, @JsonKey(name: 'occupancy_rate')  String occupancyRate)  $default,) {final _that = this;
switch (_that) {
case _OccupancyReport():
return $default(_that.totalRooms,_that.occupied,_that.vacant,_that.occupancyRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_rooms')  int totalRooms,  int occupied,  int vacant, @JsonKey(name: 'occupancy_rate')  String occupancyRate)?  $default,) {final _that = this;
switch (_that) {
case _OccupancyReport() when $default != null:
return $default(_that.totalRooms,_that.occupied,_that.vacant,_that.occupancyRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OccupancyReport implements OccupancyReport {
  const _OccupancyReport({@JsonKey(name: 'total_rooms') required this.totalRooms, required this.occupied, required this.vacant, @JsonKey(name: 'occupancy_rate') required this.occupancyRate});
  factory _OccupancyReport.fromJson(Map<String, dynamic> json) => _$OccupancyReportFromJson(json);

@override@JsonKey(name: 'total_rooms') final  int totalRooms;
@override final  int occupied;
@override final  int vacant;
@override@JsonKey(name: 'occupancy_rate') final  String occupancyRate;

/// Create a copy of OccupancyReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OccupancyReportCopyWith<_OccupancyReport> get copyWith => __$OccupancyReportCopyWithImpl<_OccupancyReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OccupancyReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OccupancyReport&&(identical(other.totalRooms, totalRooms) || other.totalRooms == totalRooms)&&(identical(other.occupied, occupied) || other.occupied == occupied)&&(identical(other.vacant, vacant) || other.vacant == vacant)&&(identical(other.occupancyRate, occupancyRate) || other.occupancyRate == occupancyRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRooms,occupied,vacant,occupancyRate);

@override
String toString() {
  return 'OccupancyReport(totalRooms: $totalRooms, occupied: $occupied, vacant: $vacant, occupancyRate: $occupancyRate)';
}


}

/// @nodoc
abstract mixin class _$OccupancyReportCopyWith<$Res> implements $OccupancyReportCopyWith<$Res> {
  factory _$OccupancyReportCopyWith(_OccupancyReport value, $Res Function(_OccupancyReport) _then) = __$OccupancyReportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_rooms') int totalRooms, int occupied, int vacant,@JsonKey(name: 'occupancy_rate') String occupancyRate
});




}
/// @nodoc
class __$OccupancyReportCopyWithImpl<$Res>
    implements _$OccupancyReportCopyWith<$Res> {
  __$OccupancyReportCopyWithImpl(this._self, this._then);

  final _OccupancyReport _self;
  final $Res Function(_OccupancyReport) _then;

/// Create a copy of OccupancyReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRooms = null,Object? occupied = null,Object? vacant = null,Object? occupancyRate = null,}) {
  return _then(_OccupancyReport(
totalRooms: null == totalRooms ? _self.totalRooms : totalRooms // ignore: cast_nullable_to_non_nullable
as int,occupied: null == occupied ? _self.occupied : occupied // ignore: cast_nullable_to_non_nullable
as int,vacant: null == vacant ? _self.vacant : vacant // ignore: cast_nullable_to_non_nullable
as int,occupancyRate: null == occupancyRate ? _self.occupancyRate : occupancyRate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AgingBucket {

 int get count; String get total;
/// Create a copy of AgingBucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<AgingBucket> get copyWith => _$AgingBucketCopyWithImpl<AgingBucket>(this as AgingBucket, _$identity);

  /// Serializes this AgingBucket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgingBucket&&(identical(other.count, count) || other.count == count)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,total);

@override
String toString() {
  return 'AgingBucket(count: $count, total: $total)';
}


}

/// @nodoc
abstract mixin class $AgingBucketCopyWith<$Res>  {
  factory $AgingBucketCopyWith(AgingBucket value, $Res Function(AgingBucket) _then) = _$AgingBucketCopyWithImpl;
@useResult
$Res call({
 int count, String total
});




}
/// @nodoc
class _$AgingBucketCopyWithImpl<$Res>
    implements $AgingBucketCopyWith<$Res> {
  _$AgingBucketCopyWithImpl(this._self, this._then);

  final AgingBucket _self;
  final $Res Function(AgingBucket) _then;

/// Create a copy of AgingBucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? total = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AgingBucket].
extension AgingBucketPatterns on AgingBucket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgingBucket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgingBucket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgingBucket value)  $default,){
final _that = this;
switch (_that) {
case _AgingBucket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgingBucket value)?  $default,){
final _that = this;
switch (_that) {
case _AgingBucket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgingBucket() when $default != null:
return $default(_that.count,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String total)  $default,) {final _that = this;
switch (_that) {
case _AgingBucket():
return $default(_that.count,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String total)?  $default,) {final _that = this;
switch (_that) {
case _AgingBucket() when $default != null:
return $default(_that.count,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AgingBucket implements AgingBucket {
  const _AgingBucket({required this.count, required this.total});
  factory _AgingBucket.fromJson(Map<String, dynamic> json) => _$AgingBucketFromJson(json);

@override final  int count;
@override final  String total;

/// Create a copy of AgingBucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgingBucketCopyWith<_AgingBucket> get copyWith => __$AgingBucketCopyWithImpl<_AgingBucket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AgingBucketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgingBucket&&(identical(other.count, count) || other.count == count)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,total);

@override
String toString() {
  return 'AgingBucket(count: $count, total: $total)';
}


}

/// @nodoc
abstract mixin class _$AgingBucketCopyWith<$Res> implements $AgingBucketCopyWith<$Res> {
  factory _$AgingBucketCopyWith(_AgingBucket value, $Res Function(_AgingBucket) _then) = __$AgingBucketCopyWithImpl;
@override @useResult
$Res call({
 int count, String total
});




}
/// @nodoc
class __$AgingBucketCopyWithImpl<$Res>
    implements _$AgingBucketCopyWith<$Res> {
  __$AgingBucketCopyWithImpl(this._self, this._then);

  final _AgingBucket _self;
  final $Res Function(_AgingBucket) _then;

/// Create a copy of AgingBucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? total = null,}) {
  return _then(_AgingBucket(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DuesBuckets {

@JsonKey(name: '0_30') AgingBucket get bucket0_30;@JsonKey(name: '31_60') AgingBucket get bucket31_60;@JsonKey(name: '61_90') AgingBucket get bucket61_90;@JsonKey(name: '90_plus') AgingBucket get bucket90Plus;
/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuesBucketsCopyWith<DuesBuckets> get copyWith => _$DuesBucketsCopyWithImpl<DuesBuckets>(this as DuesBuckets, _$identity);

  /// Serializes this DuesBuckets to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuesBuckets&&(identical(other.bucket0_30, bucket0_30) || other.bucket0_30 == bucket0_30)&&(identical(other.bucket31_60, bucket31_60) || other.bucket31_60 == bucket31_60)&&(identical(other.bucket61_90, bucket61_90) || other.bucket61_90 == bucket61_90)&&(identical(other.bucket90Plus, bucket90Plus) || other.bucket90Plus == bucket90Plus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucket0_30,bucket31_60,bucket61_90,bucket90Plus);

@override
String toString() {
  return 'DuesBuckets(bucket0_30: $bucket0_30, bucket31_60: $bucket31_60, bucket61_90: $bucket61_90, bucket90Plus: $bucket90Plus)';
}


}

/// @nodoc
abstract mixin class $DuesBucketsCopyWith<$Res>  {
  factory $DuesBucketsCopyWith(DuesBuckets value, $Res Function(DuesBuckets) _then) = _$DuesBucketsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '0_30') AgingBucket bucket0_30,@JsonKey(name: '31_60') AgingBucket bucket31_60,@JsonKey(name: '61_90') AgingBucket bucket61_90,@JsonKey(name: '90_plus') AgingBucket bucket90Plus
});


$AgingBucketCopyWith<$Res> get bucket0_30;$AgingBucketCopyWith<$Res> get bucket31_60;$AgingBucketCopyWith<$Res> get bucket61_90;$AgingBucketCopyWith<$Res> get bucket90Plus;

}
/// @nodoc
class _$DuesBucketsCopyWithImpl<$Res>
    implements $DuesBucketsCopyWith<$Res> {
  _$DuesBucketsCopyWithImpl(this._self, this._then);

  final DuesBuckets _self;
  final $Res Function(DuesBuckets) _then;

/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bucket0_30 = null,Object? bucket31_60 = null,Object? bucket61_90 = null,Object? bucket90Plus = null,}) {
  return _then(_self.copyWith(
bucket0_30: null == bucket0_30 ? _self.bucket0_30 : bucket0_30 // ignore: cast_nullable_to_non_nullable
as AgingBucket,bucket31_60: null == bucket31_60 ? _self.bucket31_60 : bucket31_60 // ignore: cast_nullable_to_non_nullable
as AgingBucket,bucket61_90: null == bucket61_90 ? _self.bucket61_90 : bucket61_90 // ignore: cast_nullable_to_non_nullable
as AgingBucket,bucket90Plus: null == bucket90Plus ? _self.bucket90Plus : bucket90Plus // ignore: cast_nullable_to_non_nullable
as AgingBucket,
  ));
}
/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<$Res> get bucket0_30 {
  
  return $AgingBucketCopyWith<$Res>(_self.bucket0_30, (value) {
    return _then(_self.copyWith(bucket0_30: value));
  });
}/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<$Res> get bucket31_60 {
  
  return $AgingBucketCopyWith<$Res>(_self.bucket31_60, (value) {
    return _then(_self.copyWith(bucket31_60: value));
  });
}/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<$Res> get bucket61_90 {
  
  return $AgingBucketCopyWith<$Res>(_self.bucket61_90, (value) {
    return _then(_self.copyWith(bucket61_90: value));
  });
}/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<$Res> get bucket90Plus {
  
  return $AgingBucketCopyWith<$Res>(_self.bucket90Plus, (value) {
    return _then(_self.copyWith(bucket90Plus: value));
  });
}
}


/// Adds pattern-matching-related methods to [DuesBuckets].
extension DuesBucketsPatterns on DuesBuckets {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DuesBuckets value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DuesBuckets() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DuesBuckets value)  $default,){
final _that = this;
switch (_that) {
case _DuesBuckets():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DuesBuckets value)?  $default,){
final _that = this;
switch (_that) {
case _DuesBuckets() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '0_30')  AgingBucket bucket0_30, @JsonKey(name: '31_60')  AgingBucket bucket31_60, @JsonKey(name: '61_90')  AgingBucket bucket61_90, @JsonKey(name: '90_plus')  AgingBucket bucket90Plus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DuesBuckets() when $default != null:
return $default(_that.bucket0_30,_that.bucket31_60,_that.bucket61_90,_that.bucket90Plus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '0_30')  AgingBucket bucket0_30, @JsonKey(name: '31_60')  AgingBucket bucket31_60, @JsonKey(name: '61_90')  AgingBucket bucket61_90, @JsonKey(name: '90_plus')  AgingBucket bucket90Plus)  $default,) {final _that = this;
switch (_that) {
case _DuesBuckets():
return $default(_that.bucket0_30,_that.bucket31_60,_that.bucket61_90,_that.bucket90Plus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '0_30')  AgingBucket bucket0_30, @JsonKey(name: '31_60')  AgingBucket bucket31_60, @JsonKey(name: '61_90')  AgingBucket bucket61_90, @JsonKey(name: '90_plus')  AgingBucket bucket90Plus)?  $default,) {final _that = this;
switch (_that) {
case _DuesBuckets() when $default != null:
return $default(_that.bucket0_30,_that.bucket31_60,_that.bucket61_90,_that.bucket90Plus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DuesBuckets implements DuesBuckets {
  const _DuesBuckets({@JsonKey(name: '0_30') required this.bucket0_30, @JsonKey(name: '31_60') required this.bucket31_60, @JsonKey(name: '61_90') required this.bucket61_90, @JsonKey(name: '90_plus') required this.bucket90Plus});
  factory _DuesBuckets.fromJson(Map<String, dynamic> json) => _$DuesBucketsFromJson(json);

@override@JsonKey(name: '0_30') final  AgingBucket bucket0_30;
@override@JsonKey(name: '31_60') final  AgingBucket bucket31_60;
@override@JsonKey(name: '61_90') final  AgingBucket bucket61_90;
@override@JsonKey(name: '90_plus') final  AgingBucket bucket90Plus;

/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DuesBucketsCopyWith<_DuesBuckets> get copyWith => __$DuesBucketsCopyWithImpl<_DuesBuckets>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DuesBucketsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DuesBuckets&&(identical(other.bucket0_30, bucket0_30) || other.bucket0_30 == bucket0_30)&&(identical(other.bucket31_60, bucket31_60) || other.bucket31_60 == bucket31_60)&&(identical(other.bucket61_90, bucket61_90) || other.bucket61_90 == bucket61_90)&&(identical(other.bucket90Plus, bucket90Plus) || other.bucket90Plus == bucket90Plus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bucket0_30,bucket31_60,bucket61_90,bucket90Plus);

@override
String toString() {
  return 'DuesBuckets(bucket0_30: $bucket0_30, bucket31_60: $bucket31_60, bucket61_90: $bucket61_90, bucket90Plus: $bucket90Plus)';
}


}

/// @nodoc
abstract mixin class _$DuesBucketsCopyWith<$Res> implements $DuesBucketsCopyWith<$Res> {
  factory _$DuesBucketsCopyWith(_DuesBuckets value, $Res Function(_DuesBuckets) _then) = __$DuesBucketsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '0_30') AgingBucket bucket0_30,@JsonKey(name: '31_60') AgingBucket bucket31_60,@JsonKey(name: '61_90') AgingBucket bucket61_90,@JsonKey(name: '90_plus') AgingBucket bucket90Plus
});


@override $AgingBucketCopyWith<$Res> get bucket0_30;@override $AgingBucketCopyWith<$Res> get bucket31_60;@override $AgingBucketCopyWith<$Res> get bucket61_90;@override $AgingBucketCopyWith<$Res> get bucket90Plus;

}
/// @nodoc
class __$DuesBucketsCopyWithImpl<$Res>
    implements _$DuesBucketsCopyWith<$Res> {
  __$DuesBucketsCopyWithImpl(this._self, this._then);

  final _DuesBuckets _self;
  final $Res Function(_DuesBuckets) _then;

/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bucket0_30 = null,Object? bucket31_60 = null,Object? bucket61_90 = null,Object? bucket90Plus = null,}) {
  return _then(_DuesBuckets(
bucket0_30: null == bucket0_30 ? _self.bucket0_30 : bucket0_30 // ignore: cast_nullable_to_non_nullable
as AgingBucket,bucket31_60: null == bucket31_60 ? _self.bucket31_60 : bucket31_60 // ignore: cast_nullable_to_non_nullable
as AgingBucket,bucket61_90: null == bucket61_90 ? _self.bucket61_90 : bucket61_90 // ignore: cast_nullable_to_non_nullable
as AgingBucket,bucket90Plus: null == bucket90Plus ? _self.bucket90Plus : bucket90Plus // ignore: cast_nullable_to_non_nullable
as AgingBucket,
  ));
}

/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<$Res> get bucket0_30 {
  
  return $AgingBucketCopyWith<$Res>(_self.bucket0_30, (value) {
    return _then(_self.copyWith(bucket0_30: value));
  });
}/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<$Res> get bucket31_60 {
  
  return $AgingBucketCopyWith<$Res>(_self.bucket31_60, (value) {
    return _then(_self.copyWith(bucket31_60: value));
  });
}/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<$Res> get bucket61_90 {
  
  return $AgingBucketCopyWith<$Res>(_self.bucket61_90, (value) {
    return _then(_self.copyWith(bucket61_90: value));
  });
}/// Create a copy of DuesBuckets
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AgingBucketCopyWith<$Res> get bucket90Plus {
  
  return $AgingBucketCopyWith<$Res>(_self.bucket90Plus, (value) {
    return _then(_self.copyWith(bucket90Plus: value));
  });
}
}


/// @nodoc
mixin _$DuesAgingReport {

 DuesBuckets get buckets;@JsonKey(name: 'total_outstanding') String get totalOutstanding;
/// Create a copy of DuesAgingReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuesAgingReportCopyWith<DuesAgingReport> get copyWith => _$DuesAgingReportCopyWithImpl<DuesAgingReport>(this as DuesAgingReport, _$identity);

  /// Serializes this DuesAgingReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuesAgingReport&&(identical(other.buckets, buckets) || other.buckets == buckets)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buckets,totalOutstanding);

@override
String toString() {
  return 'DuesAgingReport(buckets: $buckets, totalOutstanding: $totalOutstanding)';
}


}

/// @nodoc
abstract mixin class $DuesAgingReportCopyWith<$Res>  {
  factory $DuesAgingReportCopyWith(DuesAgingReport value, $Res Function(DuesAgingReport) _then) = _$DuesAgingReportCopyWithImpl;
@useResult
$Res call({
 DuesBuckets buckets,@JsonKey(name: 'total_outstanding') String totalOutstanding
});


$DuesBucketsCopyWith<$Res> get buckets;

}
/// @nodoc
class _$DuesAgingReportCopyWithImpl<$Res>
    implements $DuesAgingReportCopyWith<$Res> {
  _$DuesAgingReportCopyWithImpl(this._self, this._then);

  final DuesAgingReport _self;
  final $Res Function(DuesAgingReport) _then;

/// Create a copy of DuesAgingReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buckets = null,Object? totalOutstanding = null,}) {
  return _then(_self.copyWith(
buckets: null == buckets ? _self.buckets : buckets // ignore: cast_nullable_to_non_nullable
as DuesBuckets,totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of DuesAgingReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DuesBucketsCopyWith<$Res> get buckets {
  
  return $DuesBucketsCopyWith<$Res>(_self.buckets, (value) {
    return _then(_self.copyWith(buckets: value));
  });
}
}


/// Adds pattern-matching-related methods to [DuesAgingReport].
extension DuesAgingReportPatterns on DuesAgingReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DuesAgingReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DuesAgingReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DuesAgingReport value)  $default,){
final _that = this;
switch (_that) {
case _DuesAgingReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DuesAgingReport value)?  $default,){
final _that = this;
switch (_that) {
case _DuesAgingReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DuesBuckets buckets, @JsonKey(name: 'total_outstanding')  String totalOutstanding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DuesAgingReport() when $default != null:
return $default(_that.buckets,_that.totalOutstanding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DuesBuckets buckets, @JsonKey(name: 'total_outstanding')  String totalOutstanding)  $default,) {final _that = this;
switch (_that) {
case _DuesAgingReport():
return $default(_that.buckets,_that.totalOutstanding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DuesBuckets buckets, @JsonKey(name: 'total_outstanding')  String totalOutstanding)?  $default,) {final _that = this;
switch (_that) {
case _DuesAgingReport() when $default != null:
return $default(_that.buckets,_that.totalOutstanding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DuesAgingReport implements DuesAgingReport {
  const _DuesAgingReport({required this.buckets, @JsonKey(name: 'total_outstanding') required this.totalOutstanding});
  factory _DuesAgingReport.fromJson(Map<String, dynamic> json) => _$DuesAgingReportFromJson(json);

@override final  DuesBuckets buckets;
@override@JsonKey(name: 'total_outstanding') final  String totalOutstanding;

/// Create a copy of DuesAgingReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DuesAgingReportCopyWith<_DuesAgingReport> get copyWith => __$DuesAgingReportCopyWithImpl<_DuesAgingReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DuesAgingReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DuesAgingReport&&(identical(other.buckets, buckets) || other.buckets == buckets)&&(identical(other.totalOutstanding, totalOutstanding) || other.totalOutstanding == totalOutstanding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buckets,totalOutstanding);

@override
String toString() {
  return 'DuesAgingReport(buckets: $buckets, totalOutstanding: $totalOutstanding)';
}


}

/// @nodoc
abstract mixin class _$DuesAgingReportCopyWith<$Res> implements $DuesAgingReportCopyWith<$Res> {
  factory _$DuesAgingReportCopyWith(_DuesAgingReport value, $Res Function(_DuesAgingReport) _then) = __$DuesAgingReportCopyWithImpl;
@override @useResult
$Res call({
 DuesBuckets buckets,@JsonKey(name: 'total_outstanding') String totalOutstanding
});


@override $DuesBucketsCopyWith<$Res> get buckets;

}
/// @nodoc
class __$DuesAgingReportCopyWithImpl<$Res>
    implements _$DuesAgingReportCopyWith<$Res> {
  __$DuesAgingReportCopyWithImpl(this._self, this._then);

  final _DuesAgingReport _self;
  final $Res Function(_DuesAgingReport) _then;

/// Create a copy of DuesAgingReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buckets = null,Object? totalOutstanding = null,}) {
  return _then(_DuesAgingReport(
buckets: null == buckets ? _self.buckets : buckets // ignore: cast_nullable_to_non_nullable
as DuesBuckets,totalOutstanding: null == totalOutstanding ? _self.totalOutstanding : totalOutstanding // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of DuesAgingReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DuesBucketsCopyWith<$Res> get buckets {
  
  return $DuesBucketsCopyWith<$Res>(_self.buckets, (value) {
    return _then(_self.copyWith(buckets: value));
  });
}
}

// dart format on
