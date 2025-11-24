import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:injectable/injectable.dart';

@injectable
class StockDatasource {
  StockDatasource(this._dioHttp);

  final Dio _dioHttp;

  Future<Map<String, dynamic>> createMovement({
    required Map<String, dynamic> payload,
  }) async {
    final result = await _dioHttp.post('/stock', data: payload);

    return jsonDecode(result.toString());
  }

  Future<Map<String, dynamic>> gettAllStockMovements(
    Map<String, dynamic>? query,
  ) async {
    final result = await _dioHttp.get(
      '/stock/movements',
      queryParameters: query,
    );

    return jsonDecode(result.toString());
  }
}
