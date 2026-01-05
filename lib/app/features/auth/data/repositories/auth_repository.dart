import 'package:dio/dio.dart';
import 'package:easy_stock/app/features/auth/data/datasources/auth_datasource.dart';
import 'package:easy_stock/app/core/models/user_model.dart';

import 'package:easy_stock/app/features/auth/domain/i_auth_repository.dart';
import 'package:easy_stock/app/core/infra/storage/i_secure_storage_service.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository(
    this._dataSource,
  );
  final AuthDatasource _dataSource;

  final logger = Logger();

  @override
  Future<Result> autenticate({required credentials}) async {
    try {
      final response = await _dataSource.autenticate(credentials: credentials);

      return Result.success(User.fromMap(response['data']));
    } on DioException catch (error) {
      return Result.error(
        error.response?.data['error'] ?? 'Erro ao autenticar usuário',
      );
    } catch (error) {
      return Result.error('Erro ao autenticar: $error');
    }
  }

  @override
  Future<Result> registerUser({required Map<String, dynamic> payload}) async {
    try {
      final response = await _dataSource.registerUser(payload: payload);

      return Result.success(User.fromMap(response['data']));
    } on DioException catch (error) {
      logger.e(error);
      return Result.error('Erro ao Criar usuário, ${error.response}');
    } catch (error) {
      return Result.error('Erro ao Criar usuário, $error');
    }
  }
}
