import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:easy_stock/app/features/home/admin/data/datasource/dashboard_datasource.dart';
import 'package:easy_stock/app/features/home/admin/data/model/dashboard_model.dart';
import 'package:easy_stock/app/features/home/admin/domain/i_dashboard_repository.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: IDashboardRepository)
class DashboardRepository implements IDashboardRepository {
  final DashboardDatasource _dashboardDatasource;

  DashboardRepository(this._dashboardDatasource);

  @override
  Future<Result> getDashboardData() async {
    try {
      final response = await _dashboardDatasource.getDashboardData();

      final dashboardData = DashboardModel.fromJson(
        response['data'] as Map<String, dynamic>,
      );

      return Result.success(dashboardData);
    } on DioException catch (error) {
      final errorMessage = error.response?.data?['message'];

      return Result.error(
        errorMessage?.toString() ?? 'Erro ao buscar dados do dashboard',
      );
    } catch (error) {
      return Result.error(
        'Erro desconhecido ao carregar dashboard: $error',
      );
    }
  }
}
