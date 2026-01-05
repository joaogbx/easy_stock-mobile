import 'package:easy_stock/app/core/result/result.dart';

abstract class IUserRepository {
  Future<Result> createUser({required Map<String, dynamic> payload});
  Future<Result> updateUser({
    required int userId,
    required Map<String, dynamic> payload,
  });
}
