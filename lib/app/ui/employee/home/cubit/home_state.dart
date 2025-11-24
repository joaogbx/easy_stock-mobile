part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default(null) List<StockMovement>? stockMovements,
    @Default(false) bool loading,
    String? errorMessage,
  }) = _HomeState;
}
