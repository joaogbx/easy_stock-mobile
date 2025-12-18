import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/core/data/models/product_model.dart';
import 'package:easy_stock/app/core/domain/repositories/i_product_repository.dart';
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
    emit(state.copyWith(loading: true));
    final payload = {
      'name': name,
      'quantity': quantity,   
      'measure_unit': unitMeasure,
    };
    final result = await _iProductRepository.createProduct(payload: payload);

    if (result.isSuccess) {}
    if (result.isError) {
      emit(
        state.copyWith(
          errorMessage: result.error,
        ),
      );
      print(result.error);
    }
    emit(state.copyWith(loading: false));
  }
}
