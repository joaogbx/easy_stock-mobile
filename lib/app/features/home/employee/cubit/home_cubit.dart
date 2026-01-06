import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/features/stock/data/model/stock_movement.dart';
import 'package:easy_stock/app/features/stock/domain/repositories/i_stock_reposittory.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final IStockRepository _iStockRepository;
  HomeCubit(this._iStockRepository) : super(HomeState()) {
    initData();
  }

  void initData() {
    emit(state.copyWith(loading: true, errorMessage: null));
    getStockMovements();
    emit(state.copyWith(loading: false));
  }

  void getStockMovements() async {
    final query = {'mine': true};
    final response = await _iStockRepository.gettAllStockMovements(
      query: query,
    );

    if (response.isSuccess) {
      final limitedMovements = (response.data as List<StockMovement>)
          .take(7)
          .toList();
      emit(state.copyWith(stockMovements: limitedMovements));
    }

    if (response.isError) {
      emit(state.copyWith(errorMessage: response.error));
    }
  }
}
