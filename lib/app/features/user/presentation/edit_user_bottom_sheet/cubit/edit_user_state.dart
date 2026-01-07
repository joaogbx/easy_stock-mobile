part of 'edit_user_cubit.dart';

@freezed
abstract class EditUserState with _$EditUserState {
  factory EditUserState({
    @Default(false) bool loading,
    String? errorMessage,
  }) = _EditUserState;
}
