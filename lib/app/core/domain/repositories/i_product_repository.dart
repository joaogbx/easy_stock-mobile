import 'package:easy_stock/app/core/result/result.dart';

abstract class IProductRepository {
  Future<Result> getAllProducts();

  Future<Result> createProduct({
    required int companyId,
    required Map<String, dynamic> payload,
  });

  Future<Result> updateProduct({
    required int productId,
    required Map<String, dynamic> payload,
  });

  Future<Result> deleteProduct(int productId);
}
