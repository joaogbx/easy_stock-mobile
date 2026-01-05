import 'package:easy_stock/app/core/models/company_model.dart';
import 'package:easy_stock/app/core/result/result.dart';

abstract class ICompanyRepository {
  Future<Result> createCompany({
    required String companyName,
    required int userId,
  });
}
