import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/infra/storage/i_secure_storage_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._iSecureStorageService);
  final ISecureStorageService _iSecureStorageService;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await _iSecureStorageService.read('token');

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final data = response.data['data'];

    if (data is Map<String, dynamic> && data.containsKey('token')) {
      final newToken = data['token'];
      if (newToken != null) {
        await _iSecureStorageService.write('token', newToken);
      }
    }

    super.onResponse(response, handler);
  }
}
