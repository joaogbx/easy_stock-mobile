import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDatasource {
  ProductDatasource(this._dioHttp);
  final Dio _dioHttp;

  Future<Map<String, dynamic>> getAllProducts() async {
    final result = await _dioHttp.get(
      '/product',
    );

    return jsonDecode(result.toString());
  }

  Future<Map<String, dynamic>> createProduct({
    required Map<String, dynamic> payload,
  }) async {
    final result = await _dioHttp.post('/product', data: payload);

    return jsonDecode(result.toString());
  }

  Future<Map<String, dynamic>> updateProduct({
    required int productId,
    required Map<String, dynamic> payload,
  }) async {
    final result = await _dioHttp.patch('/product/$productId', data: payload);

    return jsonDecode(result.toString());
  }

  Future<Map<String, dynamic>> deleteProduct(int productId) async {
    final result = await _dioHttp.delete('/product/$productId');

    return jsonDecode(result.toString());
  }
}
