import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/features/company/data/model/company_model.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:easy_stock/app/features/company/domain/i_company_repository.dart';
import 'package:easy_stock/app/features/user/domain/i_user_repository.dart';
import 'package:easy_stock/app/core/result/result.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_company_state.dart';
part 'create_company_cubit.freezed.dart';

@injectable
class CreateCompanyCubit extends Cubit<CreateCompanyState> {
  CreateCompanyCubit(
    this._iCompanyRepository,
    this._iUserRepository,
  ) : super(CreateCompanyState());

  final ICompanyRepository _iCompanyRepository;
  final IUserRepository _iUserRepository;

  createCompany({required String companyName, required User user}) async {
    final _appCubit = getIt<AppCubit>();

    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _iCompanyRepository.createCompany(
      companyName: companyName,
      userId: user.id,
    );

    if (result.isError) {
      emit(state.copyWith(errorMessage: result.error));
    }

    if (result.isSuccess) {
      print(result);
      final company = result.data as Company;
      final payload = {'company_id': company.id};
      final updateUser = await _iUserRepository.updateUser(
        userId: company.ownerId!,
        payload: payload,
      );

      if (updateUser.isSuccess) {
        _appCubit.setUserLogged(user: updateUser.data);
      } else {
        emit(state.copyWith(errorMessage: updateUser.error));
      }
    }

    emit(state.copyWith(loading: false));
  }

  //Future<Result<dynamic>> _updateUserForNewCompany(
  //  Company company,
  //) async {
  //  try {
  //    final response = await _iUserRepository.updateUser(
  //      userId: company.ownerId,
  //      payload: {'company_id': company.id},
  //    );
  //    return Result.success(response);
  //  } on DioException catch (error) {
  //    return Result.error(error.message);
  //  }
  //}
}
