import 'package:easy_stock/app/core/result/result.dart';
import 'package:easy_stock/app/features/home/admin/data/model/dashboard_model.dart';
import 'package:injectable/injectable.dart';

abstract class IDashboardRepository {
  Future<Result> getDashboardData();
}
