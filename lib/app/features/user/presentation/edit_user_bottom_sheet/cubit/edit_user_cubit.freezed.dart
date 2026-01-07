// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditUserState {

 bool get loading; String? get errorMessage;
/// Create a copy of EditUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditUserStateCopyWith<EditUserState> get copyWith => _$EditUserStateCopyWithImpl<EditUserState>(this as EditUserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditUserState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage);

@override
String toString() {
  return 'EditUserState(loading: $loading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $EditUserStateCopyWith<$Res>  {
  factory $EditUserStateCopyWith(EditUserState value, $Res Function(EditUserState) _then) = _$EditUserStateCopyWithImpl;
@useResult
$Res call({
 bool loading, String? errorMessage
});




}
/// @nodoc
class _$EditUserStateCopyWithImpl<$Res>
    implements $EditUserStateCopyWith<$Res> {
  _$EditUserStateCopyWithImpl(this._self, this._then);

  final EditUserState _self;
  final $Res Function(EditUserState) _then;

/// Create a copy of EditUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EditUserState].
extension EditUserStatePatterns on EditUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditUserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditUserState value)  $default,){
final _that = this;
switch (_that) {
case _EditUserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditUserState value)?  $default,){
final _that = this;
switch (_that) {
case _EditUserState() when $default != null:
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
case _EditUserState() when $default != null:
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
case _EditUserState():
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
case _EditUserState() when $default != null:
return $default(_that.loading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _EditUserState implements EditUserState {
   _EditUserState({this.loading = false, this.errorMessage});
  

@override@JsonKey() final  bool loading;
@override final  String? errorMessage;

/// Create a copy of EditUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditUserStateCopyWith<_EditUserState> get copyWith => __$EditUserStateCopyWithImpl<_EditUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditUserState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage);

@override
String toString() {
  return 'EditUserState(loading: $loading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$EditUserStateCopyWith<$Res> implements $EditUserStateCopyWith<$Res> {
  factory _$EditUserStateCopyWith(_EditUserState value, $Res Function(_EditUserState) _then) = __$EditUserStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, String? errorMessage
});




}
/// @nodoc
class __$EditUserStateCopyWithImpl<$Res>
    implements _$EditUserStateCopyWith<$Res> {
  __$EditUserStateCopyWithImpl(this._self, this._then);

  final _EditUserState _self;
  final $Res Function(_EditUserState) _then;

/// Create a copy of EditUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? errorMessage = freezed,}) {
  return _then(_EditUserState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
