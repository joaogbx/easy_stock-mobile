import 'package:dio/dio.dart';
import 'package:easy_stock/app/features/company/data/datasource/company_datasource.dart';

import 'package:easy_stock/app/features/company/data/model/company_model.dart';
import 'package:easy_stock/app/features/company/domain/i_company_repository.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICompanyRepository)
class CompanyRepository implements ICompanyRepository {
  CompanyRepository(this._companyDataSource);

  final CompanyDatasource _companyDataSource;

  @override
  Future<Result> createCompany({
    required String companyName,
  }) async {
    final payload = {
      'name': companyName,
    };

    try {
      final response = await _companyDataSource.createCompany(payload: payload);

      return Result.success(User.fromJson(response['data']['user']));
    } on DioException catch (error) {
      print('REPOSITORY: ${error}');
      return Result.error(
        error.response?.data['error']['message'] ?? 'Erro ao criar companhia',
      );
    } catch (error) {
      print('REPOSITORY222222: ${error}');
      return Result.error('Erro ao Criar usuário, $error');
    }
  }
}
