// Nome do arquivo: lib/app/features/product/data/repositories/product_repository.dart

import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/data/datasource/product_datasource.dart';
import 'package:easy_stock/app/core/data/models/product_model.dart';
import 'package:easy_stock/app/core/domain/repositories/i_product_repository.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final ProductDatasource _productDatasource;

  const ProductRepository(this._productDatasource);

  // --- Métodos de Listagem (GET) ---

  @override
  Future<Result> getAllProducts() async {
    try {
      final response = await _productDatasource.getAllProducts();

      final List<Product> products = (response['data'] as List)
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList();

      return Result.success(products);
    } on DioException catch (error) {
      return Result.error('Erro ao buscar produtos, ${error.response}');
    } catch (error) {
      return Result.error('Erro desconhecido ao buscar produtos, $error');
    }
  }

  @override
  Future<Result> createProduct({
    required int companyId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      // Converte o DTO para o mapa que será enviado no payload

      final response = await _productDatasource.createProduct(
        companyId: companyId,
        payload: payload,
      );

      return Result.success(Product.fromJson(response['data']['product']));
    } on DioException catch (error) {
      return Result.error('Erro ao criar produto, ${error.response}');
    } catch (error) {
      return Result.error('Erro desconhecido ao criar produto, $error');
    }
  }

  // --- Método de Atualização (PATCH) ---

  @override
  Future<Result> updateProduct({
    required int productId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await _productDatasource.updateProduct(
        productId: productId,
        payload: payload,
      );

      return Result.success(Product.fromJson(response['data']['product']));
    } on DioException catch (error) {
      return Result.error('Erro ao atualizar produto, ${error.response}');
    } catch (error) {
      return Result.error('Erro desconhecido ao atualizar produto, $error');
    }
  }

  @override
  Future<Result> deleteProduct(int productId) async {
    try {
      // Assume-se que a exclusão retorna uma confirmação de sucesso
      await _productDatasource.deleteProduct(productId);

      // Retorna sucesso com um valor booleano ou string de confirmação
      return Result.success('Produto deletado com sucesso');
    } on DioException catch (error) {
      return Result.error('Erro ao deletar produto, ${error.response}');
    } catch (error) {
      return Result.error('Erro desconhecido ao deletar produto, $error');
    }
  }
}
