import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthDatasource {
  AuthDatasource(this._dioHttp);
  final Dio _dioHttp;

  Future<Map<String, dynamic>> autenticate({
    required Map<String, dynamic> credentials,
  }) async {
    final result = await _dioHttp.post('/auth', data: credentials);

    return jsonDecode(result.toString());
  }

  Future<Map<String, dynamic>> registerUser({
    required Map<String, dynamic> payload,
  }) async {
    final result = await _dioHttp.post('/auth/register', data: payload);
    print(result);

    return jsonDecode(result.toString());
  }
}
