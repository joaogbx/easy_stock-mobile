import 'package:dio/dio.dart';
import 'package:easy_stock/app/features/company/data/datasource/company_datasource.dart';

import 'package:easy_stock/app/core/models/company_model.dart';
import 'package:easy_stock/app/features/company/domain/i_company_repository.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ICompanyRepository)
class CompanyRepository implements ICompanyRepository {
  CompanyRepository(this._companyDataSource);

  final CompanyDatasource _companyDataSource;

  @override
  Future<Result> createCompany({
    required String companyName,
    required int userId,
  }) async {
    final payload = {
      'name': companyName,
    };

    try {
      final response = await _companyDataSource.createCompany(payload: payload);

      return Result.success(Company.fromJson(response['data']));
    } on DioException catch (error) {
      print(error);
      return Result.error(
        error.response?.data['error']['message'] ?? 'Erro ao criar companhia',
      );
    } catch (error) {
      print(error);
      return Result.error('Erro ao Criar usuário, $error');
    }
  }
}
