// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_movement_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterMovementState {

 bool get loading; String? get errorMessage; List<Product> get products;
/// Create a copy of RegisterMovementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterMovementStateCopyWith<RegisterMovementState> get copyWith => _$RegisterMovementStateCopyWithImpl<RegisterMovementState>(this as RegisterMovementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterMovementState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.products, products));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'RegisterMovementState(loading: $loading, errorMessage: $errorMessage, products: $products)';
}


}

/// @nodoc
abstract mixin class $RegisterMovementStateCopyWith<$Res>  {
  factory $RegisterMovementStateCopyWith(RegisterMovementState value, $Res Function(RegisterMovementState) _then) = _$RegisterMovementStateCopyWithImpl;
@useResult
$Res call({
 bool loading, String? errorMessage, List<Product> products
});




}
/// @nodoc
class _$RegisterMovementStateCopyWithImpl<$Res>
    implements $RegisterMovementStateCopyWith<$Res> {
  _$RegisterMovementStateCopyWithImpl(this._self, this._then);

  final RegisterMovementState _self;
  final $Res Function(RegisterMovementState) _then;

/// Create a copy of RegisterMovementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? errorMessage = freezed,Object? products = null,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterMovementState].
extension RegisterMovementStatePatterns on RegisterMovementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterMovementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterMovementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterMovementState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterMovementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterMovementState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterMovementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  String? errorMessage,  List<Product> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterMovementState() when $default != null:
return $default(_that.loading,_that.errorMessage,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  String? errorMessage,  List<Product> products)  $default,) {final _that = this;
switch (_that) {
case _RegisterMovementState():
return $default(_that.loading,_that.errorMessage,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  String? errorMessage,  List<Product> products)?  $default,) {final _that = this;
switch (_that) {
case _RegisterMovementState() when $default != null:
return $default(_that.loading,_that.errorMessage,_that.products);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterMovementState implements RegisterMovementState {
   _RegisterMovementState({this.loading = false, this.errorMessage = null, final  List<Product> products = const []}): _products = products;
  

@override@JsonKey() final  bool loading;
@override@JsonKey() final  String? errorMessage;
 final  List<Product> _products;
@override@JsonKey() List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of RegisterMovementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterMovementStateCopyWith<_RegisterMovementState> get copyWith => __$RegisterMovementStateCopyWithImpl<_RegisterMovementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterMovementState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'RegisterMovementState(loading: $loading, errorMessage: $errorMessage, products: $products)';
}


}

/// @nodoc
abstract mixin class _$RegisterMovementStateCopyWith<$Res> implements $RegisterMovementStateCopyWith<$Res> {
  factory _$RegisterMovementStateCopyWith(_RegisterMovementState value, $Res Function(_RegisterMovementState) _then) = __$RegisterMovementStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, String? errorMessage, List<Product> products
});




}
/// @nodoc
class __$RegisterMovementStateCopyWithImpl<$Res>
    implements _$RegisterMovementStateCopyWith<$Res> {
  __$RegisterMovementStateCopyWithImpl(this._self, this._then);

  final _RegisterMovementState _self;
  final $Res Function(_RegisterMovementState) _then;

/// Create a copy of RegisterMovementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? errorMessage = freezed,Object? products = null,}) {
  return _then(_RegisterMovementState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,
  ));
}


}

// dart format on
