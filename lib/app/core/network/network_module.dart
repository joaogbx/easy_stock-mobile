import 'package:dio/dio.dart';
import 'package:easy_stock/app/features/auth/utils/auth_interceptor.dart';
import 'package:easy_stock/constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: const Duration(seconds: 10),
      ),
    );
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
