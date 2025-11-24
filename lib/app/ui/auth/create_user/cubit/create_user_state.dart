part of 'create_user_cubit.dart';

@freezed
abstract class CreateUserState with _$CreateUserState {
  factory CreateUserState({
    @Default(false) bool loading,
    @Default(null) String? errorMessage,
    User? user,
  }) = _CreateUserState;
}
