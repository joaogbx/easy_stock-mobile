import 'dart:ffi';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/features/home/admin/data/model/dashboard_model.dart';
import 'package:easy_stock/app/features/home/admin/domain/i_dashboard_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_admin_state.dart';
part 'home_admin_cubit.freezed.dart';

@Injectable()
class HomeAdminCubit extends Cubit<HomeAdminState> {
  HomeAdminCubit(this._dashboardRepository) : super(HomeAdminState()) {
    initData();
  }

  final IDashboardRepository _dashboardRepository;

  void initData() async {
    emit(state.copyWith(loading: true));
    final result = await _dashboardRepository.getDashboardData();

    if (result.isError) {
      emit(
        state.copyWith(
          loading: false,
        ),
      );
      return;
    }
    if (result.isSuccess) {
      emit(
        state.copyWith(dashBoardData: result.data, loading: false),
      );
    }
  }
}
