import 'package:dio/dio.dart';
import 'package:easy_stock/app/features/user/data/datasource/user_datasource.dart';
import 'package:easy_stock/app/core/models/user_model.dart';
import 'package:easy_stock/app/features/user/domain/i_user_repository.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {
  final UserDatasource _userDatasource;

  const UserRepository(this._userDatasource);
  @override
  Future<Result> createUser({required Map<String, dynamic> payload}) async {
    try {
      final response = await _userDatasource.createUser(payload: payload);

      return Result.success(User.fromMap(response['data']['user']));
    } on DioException catch (error) {
      return Result.error('Erro ao Criar usuário, ${error.response}');
    } catch (error) {
      return Result.error('Erro ao Criar usuário, $error');
    }
  }

  @override
  Future<Result> updateUser({
    required int userId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await _userDatasource.updateUser(
        payload: payload,
        userId: userId,
      );

      return Result.success(User.fromMap(response['data']));
    } on DioException catch (error) {
      return Result.error('Erro ao atualizar usuário, ${error.response}');
    } catch (error) {
      return Result.error('Erro ao atualizar usuário, $error');
    }
  }
}
