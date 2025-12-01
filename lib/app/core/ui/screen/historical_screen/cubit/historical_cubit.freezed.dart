// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historical_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoricalState {

 bool get loading; List<StockMovement> get stockMovements; String? get errorMessage;
/// Create a copy of HistoricalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoricalStateCopyWith<HistoricalState> get copyWith => _$HistoricalStateCopyWithImpl<HistoricalState>(this as HistoricalState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoricalState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.stockMovements, stockMovements)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(stockMovements),errorMessage);

@override
String toString() {
  return 'HistoricalState(loading: $loading, stockMovements: $stockMovements, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoricalStateCopyWith<$Res>  {
  factory $HistoricalStateCopyWith(HistoricalState value, $Res Function(HistoricalState) _then) = _$HistoricalStateCopyWithImpl;
@useResult
$Res call({
 bool loading, List<StockMovement> stockMovements, String? errorMessage
});




}
/// @nodoc
class _$HistoricalStateCopyWithImpl<$Res>
    implements $HistoricalStateCopyWith<$Res> {
  _$HistoricalStateCopyWithImpl(this._self, this._then);

  final HistoricalState _self;
  final $Res Function(HistoricalState) _then;

/// Create a copy of HistoricalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? stockMovements = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,stockMovements: null == stockMovements ? _self.stockMovements : stockMovements // ignore: cast_nullable_to_non_nullable
as List<StockMovement>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoricalState].
extension HistoricalStatePatterns on HistoricalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoricalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoricalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoricalState value)  $default,){
final _that = this;
switch (_that) {
case _HistoricalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoricalState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoricalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  List<StockMovement> stockMovements,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoricalState() when $default != null:
return $default(_that.loading,_that.stockMovements,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  List<StockMovement> stockMovements,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoricalState():
return $default(_that.loading,_that.stockMovements,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  List<StockMovement> stockMovements,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoricalState() when $default != null:
return $default(_that.loading,_that.stockMovements,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoricalState implements HistoricalState {
   _HistoricalState({this.loading = false, final  List<StockMovement> stockMovements = const [], this.errorMessage}): _stockMovements = stockMovements;
  

@override@JsonKey() final  bool loading;
 final  List<StockMovement> _stockMovements;
@override@JsonKey() List<StockMovement> get stockMovements {
  if (_stockMovements is EqualUnmodifiableListView) return _stockMovements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stockMovements);
}

@override final  String? errorMessage;

/// Create a copy of HistoricalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoricalStateCopyWith<_HistoricalState> get copyWith => __$HistoricalStateCopyWithImpl<_HistoricalState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoricalState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other._stockMovements, _stockMovements)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(_stockMovements),errorMessage);

@override
String toString() {
  return 'HistoricalState(loading: $loading, stockMovements: $stockMovements, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoricalStateCopyWith<$Res> implements $HistoricalStateCopyWith<$Res> {
  factory _$HistoricalStateCopyWith(_HistoricalState value, $Res Function(_HistoricalState) _then) = __$HistoricalStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, List<StockMovement> stockMovements, String? errorMessage
});




}
/// @nodoc
class __$HistoricalStateCopyWithImpl<$Res>
    implements _$HistoricalStateCopyWith<$Res> {
  __$HistoricalStateCopyWithImpl(this._self, this._then);

  final _HistoricalState _self;
  final $Res Function(_HistoricalState) _then;

/// Create a copy of HistoricalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? stockMovements = null,Object? errorMessage = freezed,}) {
  return _then(_HistoricalState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,stockMovements: null == stockMovements ? _self._stockMovements : stockMovements // ignore: cast_nullable_to_non_nullable
as List<StockMovement>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
