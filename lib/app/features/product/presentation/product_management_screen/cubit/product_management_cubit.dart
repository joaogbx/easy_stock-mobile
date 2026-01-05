import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/core/models/product_model.dart';
import 'package:easy_stock/app/features/product/domain/i_product_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_management_state.dart';
part 'product_management_cubit.freezed.dart';

@Injectable()
class ProductManagementCubit extends Cubit<ProductManagementState> {
  ProductManagementCubit(this._iProductRepository)
    : super(ProductManagementState()) {
    initData();
  }
  final IProductRepository _iProductRepository;

  void initData() {
    _getAllProducts();
  }

  void _getAllProducts() async {
    final response = await _iProductRepository.getAllProducts();

    if (response.isSuccess) {
      emit(state.copyWith(products: response.data));
    }
  }

  void productRegistered(
    String name,
    String quantity,
    String unitMeasure,
  ) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final payload = {
      'name': name,
      'quantity': quantity,
      'measure_unit': unitMeasure,
    };
    final result = await _iProductRepository.createProduct(payload: payload);

    if (result.isError) {
      emit(
        state.copyWith(
          errorMessage: result.error,
        ),
      );
    }
    emit(state.copyWith(loading: false));
  }

  void productEdit(int productId, Map<String, dynamic> form) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final result = await _iProductRepository.updateProduct(
      productId: productId,
      payload: form,
    );

    if (result.isError) {
      emit(
        state.copyWith(
          errorMessage: result.error,
        ),
      );
    }

    emit(state.copyWith(loading: false));
  }

  void productDelete(int productId) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final result = await _iProductRepository.deleteProduct(productId);

    if (result.isError) {
      emit(
        state.copyWith(
          errorMessage: result.error,
        ),
      );
    }

    emit(state.copyWith(loading: false));
  }
}
