// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateUserState {

 bool get loading; String? get errorMessage; User? get user;
/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserStateCopyWith<CreateUserState> get copyWith => _$CreateUserStateCopyWithImpl<CreateUserState>(this as CreateUserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage,user);

@override
String toString() {
  return 'CreateUserState(loading: $loading, errorMessage: $errorMessage, user: $user)';
}


}

/// @nodoc
abstract mixin class $CreateUserStateCopyWith<$Res>  {
  factory $CreateUserStateCopyWith(CreateUserState value, $Res Function(CreateUserState) _then) = _$CreateUserStateCopyWithImpl;
@useResult
$Res call({
 bool loading, String? errorMessage, User? user
});




}
/// @nodoc
class _$CreateUserStateCopyWithImpl<$Res>
    implements $CreateUserStateCopyWith<$Res> {
  _$CreateUserStateCopyWithImpl(this._self, this._then);

  final CreateUserState _self;
  final $Res Function(CreateUserState) _then;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? errorMessage = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateUserState].
extension CreateUserStatePatterns on CreateUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateUserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateUserState value)  $default,){
final _that = this;
switch (_that) {
case _CreateUserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateUserState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateUserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  String? errorMessage,  User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateUserState() when $default != null:
return $default(_that.loading,_that.errorMessage,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  String? errorMessage,  User? user)  $default,) {final _that = this;
switch (_that) {
case _CreateUserState():
return $default(_that.loading,_that.errorMessage,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  String? errorMessage,  User? user)?  $default,) {final _that = this;
switch (_that) {
case _CreateUserState() when $default != null:
return $default(_that.loading,_that.errorMessage,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _CreateUserState implements CreateUserState {
   _CreateUserState({this.loading = false, this.errorMessage = null, this.user});
  

@override@JsonKey() final  bool loading;
@override@JsonKey() final  String? errorMessage;
@override final  User? user;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateUserStateCopyWith<_CreateUserState> get copyWith => __$CreateUserStateCopyWithImpl<_CreateUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateUserState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage,user);

@override
String toString() {
  return 'CreateUserState(loading: $loading, errorMessage: $errorMessage, user: $user)';
}


}

/// @nodoc
abstract mixin class _$CreateUserStateCopyWith<$Res> implements $CreateUserStateCopyWith<$Res> {
  factory _$CreateUserStateCopyWith(_CreateUserState value, $Res Function(_CreateUserState) _then) = __$CreateUserStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, String? errorMessage, User? user
});




}
/// @nodoc
class __$CreateUserStateCopyWithImpl<$Res>
    implements _$CreateUserStateCopyWith<$Res> {
  __$CreateUserStateCopyWithImpl(this._self, this._then);

  final _CreateUserState _self;
  final $Res Function(_CreateUserState) _then;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? errorMessage = freezed,Object? user = freezed,}) {
  return _then(_CreateUserState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}


}

// dart format on
