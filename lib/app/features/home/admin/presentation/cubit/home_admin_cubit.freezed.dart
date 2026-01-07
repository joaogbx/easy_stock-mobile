// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_admin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeAdminState {

 DashboardModel? get dashBoardData; bool get loading;
/// Create a copy of HomeAdminState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeAdminStateCopyWith<HomeAdminState> get copyWith => _$HomeAdminStateCopyWithImpl<HomeAdminState>(this as HomeAdminState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAdminState&&(identical(other.dashBoardData, dashBoardData) || other.dashBoardData == dashBoardData)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode => Object.hash(runtimeType,dashBoardData,loading);

@override
String toString() {
  return 'HomeAdminState(dashBoardData: $dashBoardData, loading: $loading)';
}


}

/// @nodoc
abstract mixin class $HomeAdminStateCopyWith<$Res>  {
  factory $HomeAdminStateCopyWith(HomeAdminState value, $Res Function(HomeAdminState) _then) = _$HomeAdminStateCopyWithImpl;
@useResult
$Res call({
 DashboardModel? dashBoardData, bool loading
});




}
/// @nodoc
class _$HomeAdminStateCopyWithImpl<$Res>
    implements $HomeAdminStateCopyWith<$Res> {
  _$HomeAdminStateCopyWithImpl(this._self, this._then);

  final HomeAdminState _self;
  final $Res Function(HomeAdminState) _then;

/// Create a copy of HomeAdminState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dashBoardData = freezed,Object? loading = null,}) {
  return _then(_self.copyWith(
dashBoardData: freezed == dashBoardData ? _self.dashBoardData : dashBoardData // ignore: cast_nullable_to_non_nullable
as DashboardModel?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeAdminState].
extension HomeAdminStatePatterns on HomeAdminState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeAdminState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeAdminState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeAdminState value)  $default,){
final _that = this;
switch (_that) {
case _HomeAdminState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeAdminState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeAdminState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DashboardModel? dashBoardData,  bool loading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeAdminState() when $default != null:
return $default(_that.dashBoardData,_that.loading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DashboardModel? dashBoardData,  bool loading)  $default,) {final _that = this;
switch (_that) {
case _HomeAdminState():
return $default(_that.dashBoardData,_that.loading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DashboardModel? dashBoardData,  bool loading)?  $default,) {final _that = this;
switch (_that) {
case _HomeAdminState() when $default != null:
return $default(_that.dashBoardData,_that.loading);case _:
  return null;

}
}

}

/// @nodoc


class _HomeAdminState implements HomeAdminState {
   _HomeAdminState({this.dashBoardData, this.loading = false});
  

@override final  DashboardModel? dashBoardData;
@override@JsonKey() final  bool loading;

/// Create a copy of HomeAdminState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeAdminStateCopyWith<_HomeAdminState> get copyWith => __$HomeAdminStateCopyWithImpl<_HomeAdminState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeAdminState&&(identical(other.dashBoardData, dashBoardData) || other.dashBoardData == dashBoardData)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode => Object.hash(runtimeType,dashBoardData,loading);

@override
String toString() {
  return 'HomeAdminState(dashBoardData: $dashBoardData, loading: $loading)';
}


}

/// @nodoc
abstract mixin class _$HomeAdminStateCopyWith<$Res> implements $HomeAdminStateCopyWith<$Res> {
  factory _$HomeAdminStateCopyWith(_HomeAdminState value, $Res Function(_HomeAdminState) _then) = __$HomeAdminStateCopyWithImpl;
@override @useResult
$Res call({
 DashboardModel? dashBoardData, bool loading
});




}
/// @nodoc
class __$HomeAdminStateCopyWithImpl<$Res>
    implements _$HomeAdminStateCopyWith<$Res> {
  __$HomeAdminStateCopyWithImpl(this._self, this._then);

  final _HomeAdminState _self;
  final $Res Function(_HomeAdminState) _then;

/// Create a copy of HomeAdminState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dashBoardData = freezed,Object? loading = null,}) {
  return _then(_HomeAdminState(
dashBoardData: freezed == dashBoardData ? _self.dashBoardData : dashBoardData // ignore: cast_nullable_to_non_nullable
as DashboardModel?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
