part of 'user_add_cubit.dart';

@freezed
abstract class UserAddState with _$UserAddState {
  factory UserAddState({
    @Default(false) bool loading,
    String? errorMessage,
  }) = _UserAddState;
}
