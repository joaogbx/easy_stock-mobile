import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDatasource {
  UserDatasource(this._dioHttp);
  final Dio _dioHttp;

  Future<Map<String, dynamic>> createUser({
    required Map<String, dynamic> payload,
  }) async {
    final result = await _dioHttp.post('user', data: payload);

    return jsonDecode(result.toString());
  }

  Future<Map<String, dynamic>> updateUser({
    required Map<String, dynamic> payload,
    required int userId,
  }) async {
    final result = await _dioHttp.patch('$apiUrl/user/$userId', data: payload);

    return jsonDecode(result.toString());
  }
}
