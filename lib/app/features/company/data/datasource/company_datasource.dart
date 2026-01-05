import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class CompanyDatasource {
  CompanyDatasource(this._dioHttp);

  final Dio _dioHttp;

  Future<Map<String, dynamic>> createCompany({
    required Map<String, dynamic> payload,
  }) async {
    final result = await _dioHttp.post('/company', data: payload);

    return jsonDecode(result.toString());
  }
}
