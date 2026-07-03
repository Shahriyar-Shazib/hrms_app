// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Expense {

 String get id;@JsonKey(name: 'house_id') String get houseId; String get category; String get label; String get amount;@JsonKey(name: 'expense_date') String get expenseDate;@JsonKey(name: 'paid_to') String? get paidTo;@JsonKey(name: 'attachment_url') String? get attachmentUrl; String? get notes;@JsonKey(name: 'logged_by') String get loggedBy;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseCopyWith<Expense> get copyWith => _$ExpenseCopyWithImpl<Expense>(this as Expense, _$identity);

  /// Serializes this Expense to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.category, category) || other.category == category)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.paidTo, paidTo) || other.paidTo == paidTo)&&(identical(other.attachmentUrl, attachmentUrl) || other.attachmentUrl == attachmentUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.loggedBy, loggedBy) || other.loggedBy == loggedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,category,label,amount,expenseDate,paidTo,attachmentUrl,notes,loggedBy,createdAt);

@override
String toString() {
  return 'Expense(id: $id, houseId: $houseId, category: $category, label: $label, amount: $amount, expenseDate: $expenseDate, paidTo: $paidTo, attachmentUrl: $attachmentUrl, notes: $notes, loggedBy: $loggedBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ExpenseCopyWith<$Res>  {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) = _$ExpenseCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId, String category, String label, String amount,@JsonKey(name: 'expense_date') String expenseDate,@JsonKey(name: 'paid_to') String? paidTo,@JsonKey(name: 'attachment_url') String? attachmentUrl, String? notes,@JsonKey(name: 'logged_by') String loggedBy,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$ExpenseCopyWithImpl<$Res>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? houseId = null,Object? category = null,Object? label = null,Object? amount = null,Object? expenseDate = null,Object? paidTo = freezed,Object? attachmentUrl = freezed,Object? notes = freezed,Object? loggedBy = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as String,paidTo: freezed == paidTo ? _self.paidTo : paidTo // ignore: cast_nullable_to_non_nullable
as String?,attachmentUrl: freezed == attachmentUrl ? _self.attachmentUrl : attachmentUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,loggedBy: null == loggedBy ? _self.loggedBy : loggedBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Expense].
extension ExpensePatterns on Expense {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Expense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Expense value)  $default,){
final _that = this;
switch (_that) {
case _Expense():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Expense value)?  $default,){
final _that = this;
switch (_that) {
case _Expense() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId,  String category,  String label,  String amount, @JsonKey(name: 'expense_date')  String expenseDate, @JsonKey(name: 'paid_to')  String? paidTo, @JsonKey(name: 'attachment_url')  String? attachmentUrl,  String? notes, @JsonKey(name: 'logged_by')  String loggedBy, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.houseId,_that.category,_that.label,_that.amount,_that.expenseDate,_that.paidTo,_that.attachmentUrl,_that.notes,_that.loggedBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'house_id')  String houseId,  String category,  String label,  String amount, @JsonKey(name: 'expense_date')  String expenseDate, @JsonKey(name: 'paid_to')  String? paidTo, @JsonKey(name: 'attachment_url')  String? attachmentUrl,  String? notes, @JsonKey(name: 'logged_by')  String loggedBy, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Expense():
return $default(_that.id,_that.houseId,_that.category,_that.label,_that.amount,_that.expenseDate,_that.paidTo,_that.attachmentUrl,_that.notes,_that.loggedBy,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'house_id')  String houseId,  String category,  String label,  String amount, @JsonKey(name: 'expense_date')  String expenseDate, @JsonKey(name: 'paid_to')  String? paidTo, @JsonKey(name: 'attachment_url')  String? attachmentUrl,  String? notes, @JsonKey(name: 'logged_by')  String loggedBy, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Expense() when $default != null:
return $default(_that.id,_that.houseId,_that.category,_that.label,_that.amount,_that.expenseDate,_that.paidTo,_that.attachmentUrl,_that.notes,_that.loggedBy,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Expense implements Expense {
  const _Expense({required this.id, @JsonKey(name: 'house_id') required this.houseId, required this.category, required this.label, required this.amount, @JsonKey(name: 'expense_date') required this.expenseDate, @JsonKey(name: 'paid_to') this.paidTo, @JsonKey(name: 'attachment_url') this.attachmentUrl, this.notes, @JsonKey(name: 'logged_by') required this.loggedBy, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

@override final  String id;
@override@JsonKey(name: 'house_id') final  String houseId;
@override final  String category;
@override final  String label;
@override final  String amount;
@override@JsonKey(name: 'expense_date') final  String expenseDate;
@override@JsonKey(name: 'paid_to') final  String? paidTo;
@override@JsonKey(name: 'attachment_url') final  String? attachmentUrl;
@override final  String? notes;
@override@JsonKey(name: 'logged_by') final  String loggedBy;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseCopyWith<_Expense> get copyWith => __$ExpenseCopyWithImpl<_Expense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.houseId, houseId) || other.houseId == houseId)&&(identical(other.category, category) || other.category == category)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.expenseDate, expenseDate) || other.expenseDate == expenseDate)&&(identical(other.paidTo, paidTo) || other.paidTo == paidTo)&&(identical(other.attachmentUrl, attachmentUrl) || other.attachmentUrl == attachmentUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.loggedBy, loggedBy) || other.loggedBy == loggedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,houseId,category,label,amount,expenseDate,paidTo,attachmentUrl,notes,loggedBy,createdAt);

@override
String toString() {
  return 'Expense(id: $id, houseId: $houseId, category: $category, label: $label, amount: $amount, expenseDate: $expenseDate, paidTo: $paidTo, attachmentUrl: $attachmentUrl, notes: $notes, loggedBy: $loggedBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ExpenseCopyWith<$Res> implements $ExpenseCopyWith<$Res> {
  factory _$ExpenseCopyWith(_Expense value, $Res Function(_Expense) _then) = __$ExpenseCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'house_id') String houseId, String category, String label, String amount,@JsonKey(name: 'expense_date') String expenseDate,@JsonKey(name: 'paid_to') String? paidTo,@JsonKey(name: 'attachment_url') String? attachmentUrl, String? notes,@JsonKey(name: 'logged_by') String loggedBy,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$ExpenseCopyWithImpl<$Res>
    implements _$ExpenseCopyWith<$Res> {
  __$ExpenseCopyWithImpl(this._self, this._then);

  final _Expense _self;
  final $Res Function(_Expense) _then;

/// Create a copy of Expense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? houseId = null,Object? category = null,Object? label = null,Object? amount = null,Object? expenseDate = null,Object? paidTo = freezed,Object? attachmentUrl = freezed,Object? notes = freezed,Object? loggedBy = null,Object? createdAt = null,}) {
  return _then(_Expense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,houseId: null == houseId ? _self.houseId : houseId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,expenseDate: null == expenseDate ? _self.expenseDate : expenseDate // ignore: cast_nullable_to_non_nullable
as String,paidTo: freezed == paidTo ? _self.paidTo : paidTo // ignore: cast_nullable_to_non_nullable
as String?,attachmentUrl: freezed == attachmentUrl ? _self.attachmentUrl : attachmentUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,loggedBy: null == loggedBy ? _self.loggedBy : loggedBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
