import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException dioException, ErrorInterceptorHandler handler) {
    final String errorMessage = _extractErrorMessage(dioException);

    final customError = dioException.copyWith(
      message: errorMessage,
    );

    return handler.next(customError);
  }

  String _extractErrorMessage(DioException dioException) {
    final data = dioException.response?.data;

    if (data == null) {
      return _handleConnectivityError(dioException);
    }

    if (data['error'] is String) {
      return data['error'];
    }

    final nestedMessage = data['error']?['message'];
    if (nestedMessage is List) {
      return nestedMessage.map((msg) => "• $msg").join('\n');
    }

    if (nestedMessage is String) {
      return nestedMessage;
    }

    return "Ocorreu um erro inesperado.";
  }

  String _handleConnectivityError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return "Conexão lenta. Verifique sua internet.";
      case DioExceptionType.connectionError:
        return "Não foi possível conectar ao servidor.";
      default:
        return "Erro de rede desconhecido.";
    }
  }
}
