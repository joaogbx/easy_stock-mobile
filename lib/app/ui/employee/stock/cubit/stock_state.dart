part of 'stock_cubit.dart';

@freezed
abstract class StockState with _$StockState {
  factory StockState({
    @Default(false) bool loading,
    @Default([]) List<Product> products,
    String? errorMessage,
  }) = _StockState;
}
