import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardDatasource {
  final Dio _dioHttp;

  DashboardDatasource(this._dioHttp);

  Future<Map<String, dynamic>> getDashboardData() async {
    final result = await _dioHttp.get(
      '/dashboard',
    );

    return jsonDecode(result.toString());
  }
}
