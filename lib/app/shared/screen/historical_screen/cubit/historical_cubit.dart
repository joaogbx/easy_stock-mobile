import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/core/models/stock_movement.dart';
import 'package:easy_stock/app/features/stock/domain/repositories/i_stock_reposittory.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'historical_state.dart';

part 'historical_cubit.freezed.dart';

@injectable
class HistoricalCubit extends Cubit<HistoricalState> {
  final IStockRepository _iStockRepository;
  HistoricalCubit(this._iStockRepository) : super(HistoricalState()) {
    initData();
  }

  void initData() {
    getAllStockMovements();
  }

  void getAllStockMovements({String? startDate, String? endDate}) async {
    emit(state.copyWith(loading: true));
    final Map<String, dynamic> query = {
      'mine': true,
    };
    if (startDate != null && endDate != null) {
      query['startDate'] = startDate;
      query['endDate'] = endDate;
    }
    final response = await _iStockRepository.gettAllStockMovements(
      query: query,
    );

    if (response.isError) {
      emit(state.copyWith(errorMessage: response.error, stockMovements: []));
    }

    if (response.isSuccess) {
      emit(state.copyWith(stockMovements: response.data));
    }
    emit(state.copyWith(loading: false));
  }
}
