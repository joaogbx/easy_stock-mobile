part of 'product_management_cubit.dart';

@freezed
abstract class ProductManagementState with _$ProductManagementState {
  factory ProductManagementState({
    @Default(false) bool loading,
    @Default([]) List<Product> products,
    String? errorMessage,
  }) = _ProductManagementState;
}
