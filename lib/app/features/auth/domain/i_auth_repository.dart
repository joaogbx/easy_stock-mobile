import 'package:easy_stock/app/core/result/result.dart';

abstract class IAuthRepository {
  Future<Result> autenticate({required credentials});
  Future<Result> registerUser({required Map<String, dynamic> payload});
}
