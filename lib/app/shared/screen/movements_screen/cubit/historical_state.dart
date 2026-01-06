part of 'historical_cubit.dart';

@freezed
abstract class HistoricalState with _$HistoricalState {
  factory HistoricalState({
    @Default(false) bool loading,
    @Default([]) List<StockMovement> stockMovements,
    String? errorMessage,
  }) = _HistoricalState;
}
