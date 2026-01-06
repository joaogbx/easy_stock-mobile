import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/features/product/data/model/product_model.dart';
import 'package:easy_stock/app/features/product/domain/i_product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'stock_state.dart';
part 'stock_cubit.freezed.dart';

@Injectable()
class StockCubit extends Cubit<StockState> {
  StockCubit(
    this._iProductRepository,
  ) : super(StockState());

  final IProductRepository _iProductRepository;

  void initData() async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final response = await _iProductRepository.getAllProducts();

    if (response.isSuccess) {
      emit(state.copyWith(products: response.data));
    }

    if (response.isError) {
      emit(state.copyWith(errorMessage: response.error));
    }

    emit(state.copyWith(loading: false));
  }
}
