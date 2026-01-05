// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_management_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductManagementState {

 bool get loading; List<Product> get products; String? get errorMessage;
/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductManagementStateCopyWith<ProductManagementState> get copyWith => _$ProductManagementStateCopyWithImpl<ProductManagementState>(this as ProductManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductManagementState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(products),errorMessage);

@override
String toString() {
  return 'ProductManagementState(loading: $loading, products: $products, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProductManagementStateCopyWith<$Res>  {
  factory $ProductManagementStateCopyWith(ProductManagementState value, $Res Function(ProductManagementState) _then) = _$ProductManagementStateCopyWithImpl;
@useResult
$Res call({
 bool loading, List<Product> products, String? errorMessage
});




}
/// @nodoc
class _$ProductManagementStateCopyWithImpl<$Res>
    implements $ProductManagementStateCopyWith<$Res> {
  _$ProductManagementStateCopyWithImpl(this._self, this._then);

  final ProductManagementState _self;
  final $Res Function(ProductManagementState) _then;

/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? products = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductManagementState].
extension ProductManagementStatePatterns on ProductManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductManagementState value)  $default,){
final _that = this;
switch (_that) {
case _ProductManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  List<Product> products,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductManagementState() when $default != null:
return $default(_that.loading,_that.products,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  List<Product> products,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ProductManagementState():
return $default(_that.loading,_that.products,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  List<Product> products,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ProductManagementState() when $default != null:
return $default(_that.loading,_that.products,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ProductManagementState implements ProductManagementState {
   _ProductManagementState({this.loading = false, final  List<Product> products = const [], this.errorMessage}): _products = products;
  

@override@JsonKey() final  bool loading;
 final  List<Product> _products;
@override@JsonKey() List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  String? errorMessage;

/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductManagementStateCopyWith<_ProductManagementState> get copyWith => __$ProductManagementStateCopyWithImpl<_ProductManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductManagementState&&(identical(other.loading, loading) || other.loading == loading)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loading,const DeepCollectionEquality().hash(_products),errorMessage);

@override
String toString() {
  return 'ProductManagementState(loading: $loading, products: $products, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ProductManagementStateCopyWith<$Res> implements $ProductManagementStateCopyWith<$Res> {
  factory _$ProductManagementStateCopyWith(_ProductManagementState value, $Res Function(_ProductManagementState) _then) = __$ProductManagementStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, List<Product> products, String? errorMessage
});




}
/// @nodoc
class __$ProductManagementStateCopyWithImpl<$Res>
    implements _$ProductManagementStateCopyWith<$Res> {
  __$ProductManagementStateCopyWithImpl(this._self, this._then);

  final _ProductManagementState _self;
  final $Res Function(_ProductManagementState) _then;

/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? products = null,Object? errorMessage = freezed,}) {
  return _then(_ProductManagementState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
