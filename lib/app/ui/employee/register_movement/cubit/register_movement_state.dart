part of 'register_movement_cubit.dart';

@freezed
abstract class RegisterMovementState with _$RegisterMovementState {
  factory RegisterMovementState({
    @Default(false) bool loading,
    @Default(null) String? errorMessage,
    @Default([]) List<Product> products,
  }) = _RegisterMovementState;
}
