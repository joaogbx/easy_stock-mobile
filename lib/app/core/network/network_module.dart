import 'package:dio/dio.dart';

import 'package:easy_stock/app/core/utils/auth_interceptor.dart';
import 'package:easy_stock/app/core/utils/error_interceptor.dart';
import 'package:easy_stock/application.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor, ErrorInterceptor errorInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: Duration(seconds: apiTimeout),
      ),
    );
    dio.interceptors.add(authInterceptor);
    dio.interceptors.add(errorInterceptor);
    return dio;
  }
}
