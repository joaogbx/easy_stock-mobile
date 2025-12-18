import 'package:easy_stock/app/core/data/models/product_model.dart';
import 'package:easy_stock/app/core/domain/repositories/i_stock_reposittory.dart';
import 'package:easy_stock/app/core/domain/usecases/get_product_list_uc.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_movement_state.dart';
part 'register_movement_cubit.freezed.dart';

@injectable
class RegisterMovementCubit extends Cubit<RegisterMovementState> {
  final GetProductListUc _getProductListUc;
  final IStockRepository _iStockRepository;
  RegisterMovementCubit(this._getProductListUc, this._iStockRepository)
    : super(
        RegisterMovementState(),
      ) {
    initData();
  }

  void initData() async {
    final response = await _getProductListUc.call();

    if (response.isError) {
      emit(state.copyWith(errorMessage: response.error));
    }

    if (response.isSuccess) {
      emit(state.copyWith(products: response.data));
    }
  }

  void submitMovementForm(
    int productId,
    String quantity,
    Function() onSuccess,
    Function() onError,
    RegisterMode registerMode,
  ) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final response = await _iStockRepository.createMovement(
      productId: productId,
      quantity: int.parse(quantity),
      registerMode: registerMode,
    );

    if (response.isError) {
      emit(
        state.copyWith(errorMessage: response.error, loading: false),
      ); //
      onError(); // Chame onError() se houver erro
    }

    if (response.isSuccess) {
      onSuccess(); // Chame onSuccess() se houver sucesso
      // O onSuccess() cuidará de fechar a tela e exibir o SnackBar de sucesso.
    }
    emit(state.copyWith(loading: false));
  }
}
