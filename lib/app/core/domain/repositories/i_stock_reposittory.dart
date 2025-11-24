import 'package:easy_stock/app/core/result/result.dart';

abstract class IStockRepository {
  Future<Result> createMovement({
    required int productId,
    required int quantity,
  });

  Future<Result> gettAllStockMovements({
    Map<String, dynamic> query,
  });
}
