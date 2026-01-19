part of 'user_management_cubit.dart';

@freezed
abstract class UserManagementState with _$UserManagementState {
  factory UserManagementState({
    @Default(false) bool loading,
    String? errorMessage,
    @Default([]) List<User> users,
  }) = _UserManagementState;
}
