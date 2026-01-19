// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_add_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserAddState {

 bool get loading; String? get errorMessage;
/// Create a copy of UserAddState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAddStateCopyWith<UserAddState> get copyWith => _$UserAddStateCopyWithImpl<UserAddState>(this as UserAddState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAddState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage);

@override
String toString() {
  return 'UserAddState(loading: $loading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $UserAddStateCopyWith<$Res>  {
  factory $UserAddStateCopyWith(UserAddState value, $Res Function(UserAddState) _then) = _$UserAddStateCopyWithImpl;
@useResult
$Res call({
 bool loading, String? errorMessage
});




}
/// @nodoc
class _$UserAddStateCopyWithImpl<$Res>
    implements $UserAddStateCopyWith<$Res> {
  _$UserAddStateCopyWithImpl(this._self, this._then);

  final UserAddState _self;
  final $Res Function(UserAddState) _then;

/// Create a copy of UserAddState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAddState].
extension UserAddStatePatterns on UserAddState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAddState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAddState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAddState value)  $default,){
final _that = this;
switch (_that) {
case _UserAddState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAddState value)?  $default,){
final _that = this;
switch (_that) {
case _UserAddState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAddState() when $default != null:
return $default(_that.loading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _UserAddState():
return $default(_that.loading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _UserAddState() when $default != null:
return $default(_that.loading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _UserAddState implements UserAddState {
   _UserAddState({this.loading = false, this.errorMessage});
  

@override@JsonKey() final  bool loading;
@override final  String? errorMessage;

/// Create a copy of UserAddState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAddStateCopyWith<_UserAddState> get copyWith => __$UserAddStateCopyWithImpl<_UserAddState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAddState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage);

@override
String toString() {
  return 'UserAddState(loading: $loading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$UserAddStateCopyWith<$Res> implements $UserAddStateCopyWith<$Res> {
  factory _$UserAddStateCopyWith(_UserAddState value, $Res Function(_UserAddState) _then) = __$UserAddStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, String? errorMessage
});




}
/// @nodoc
class __$UserAddStateCopyWithImpl<$Res>
    implements _$UserAddStateCopyWith<$Res> {
  __$UserAddStateCopyWithImpl(this._self, this._then);

  final _UserAddState _self;
  final $Res Function(_UserAddState) _then;

/// Create a copy of UserAddState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? errorMessage = freezed,}) {
  return _then(_UserAddState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
