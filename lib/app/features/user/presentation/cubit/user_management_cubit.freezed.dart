// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_management_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserManagementState {

 bool get loading; String? get errorMessage; List<User> get users;
/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserManagementStateCopyWith<UserManagementState> get copyWith => _$UserManagementStateCopyWithImpl<UserManagementState>(this as UserManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserManagementState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.users, users));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage,const DeepCollectionEquality().hash(users));

@override
String toString() {
  return 'UserManagementState(loading: $loading, errorMessage: $errorMessage, users: $users)';
}


}

/// @nodoc
abstract mixin class $UserManagementStateCopyWith<$Res>  {
  factory $UserManagementStateCopyWith(UserManagementState value, $Res Function(UserManagementState) _then) = _$UserManagementStateCopyWithImpl;
@useResult
$Res call({
 bool loading, String? errorMessage, List<User> users
});




}
/// @nodoc
class _$UserManagementStateCopyWithImpl<$Res>
    implements $UserManagementStateCopyWith<$Res> {
  _$UserManagementStateCopyWithImpl(this._self, this._then);

  final UserManagementState _self;
  final $Res Function(UserManagementState) _then;

/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loading = null,Object? errorMessage = freezed,Object? users = null,}) {
  return _then(_self.copyWith(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserManagementState].
extension UserManagementStatePatterns on UserManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserManagementState value)  $default,){
final _that = this;
switch (_that) {
case _UserManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool loading,  String? errorMessage,  List<User> users)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
return $default(_that.loading,_that.errorMessage,_that.users);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool loading,  String? errorMessage,  List<User> users)  $default,) {final _that = this;
switch (_that) {
case _UserManagementState():
return $default(_that.loading,_that.errorMessage,_that.users);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool loading,  String? errorMessage,  List<User> users)?  $default,) {final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
return $default(_that.loading,_that.errorMessage,_that.users);case _:
  return null;

}
}

}

/// @nodoc


class _UserManagementState implements UserManagementState {
   _UserManagementState({this.loading = false, this.errorMessage, final  List<User> users = const []}): _users = users;
  

@override@JsonKey() final  bool loading;
@override final  String? errorMessage;
 final  List<User> _users;
@override@JsonKey() List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserManagementStateCopyWith<_UserManagementState> get copyWith => __$UserManagementStateCopyWithImpl<_UserManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserManagementState&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,loading,errorMessage,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'UserManagementState(loading: $loading, errorMessage: $errorMessage, users: $users)';
}


}

/// @nodoc
abstract mixin class _$UserManagementStateCopyWith<$Res> implements $UserManagementStateCopyWith<$Res> {
  factory _$UserManagementStateCopyWith(_UserManagementState value, $Res Function(_UserManagementState) _then) = __$UserManagementStateCopyWithImpl;
@override @useResult
$Res call({
 bool loading, String? errorMessage, List<User> users
});




}
/// @nodoc
class __$UserManagementStateCopyWithImpl<$Res>
    implements _$UserManagementStateCopyWith<$Res> {
  __$UserManagementStateCopyWithImpl(this._self, this._then);

  final _UserManagementState _self;
  final $Res Function(_UserManagementState) _then;

/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loading = null,Object? errorMessage = freezed,Object? users = null,}) {
  return _then(_UserManagementState(
loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}


}

// dart format on
