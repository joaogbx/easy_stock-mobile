// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:easy_stock/app/core/cubit/app_cubit.dart' as _i375;
import 'package:easy_stock/app/core/data/datasource/auth_datasource.dart'
    as _i248;
import 'package:easy_stock/app/core/data/datasource/company_datasource.dart'
    as _i578;
import 'package:easy_stock/app/core/data/datasource/product_datasource.dart'
    as _i524;
import 'package:easy_stock/app/core/data/datasource/stock_datasource.dart'
    as _i820;
import 'package:easy_stock/app/core/data/datasource/user_datasource.dart'
    as _i258;
import 'package:easy_stock/app/core/data/repositories/auth_repository.dart'
    as _i263;
import 'package:easy_stock/app/core/data/repositories/company_repository.dart'
    as _i120;
import 'package:easy_stock/app/core/data/repositories/product_repository.dart'
    as _i96;
import 'package:easy_stock/app/core/data/repositories/stock_repository.dart'
    as _i603;
import 'package:easy_stock/app/core/data/repositories/user_repository.dart'
    as _i867;
import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart'
    as _i236;
import 'package:easy_stock/app/core/domain/repositories/i_company_repository.dart'
    as _i1056;
import 'package:easy_stock/app/core/domain/repositories/i_product_repository.dart'
    as _i778;
import 'package:easy_stock/app/core/domain/repositories/i_stock_reposittory.dart'
    as _i586;
import 'package:easy_stock/app/core/domain/repositories/i_user_repository.dart'
    as _i469;
import 'package:easy_stock/app/core/domain/usecases/get_product_list_uc.dart'
    as _i594;
import 'package:easy_stock/app/core/infra/storage/i_secure_storage_service.dart'
    as _i144;
import 'package:easy_stock/app/core/infra/storage/secure_storage_service.dart'
    as _i916;
import 'package:easy_stock/app/core/network/network_module.dart' as _i323;
import 'package:easy_stock/app/core/ui/screen/historical_screen/cubit/historical_cubit.dart'
    as _i143;
import 'package:easy_stock/app/core/utils/auth_interceptor.dart' as _i976;
import 'package:easy_stock/app/ui/admin/product_management_screen/cubit/product_management_cubit.dart'
    as _i633;
import 'package:easy_stock/app/ui/auth/create_user/cubit/create_user_cubit.dart'
    as _i384;
import 'package:easy_stock/app/ui/auth/login/cubit/auth_cubit.dart' as _i393;
import 'package:easy_stock/app/ui/company/cubit/create_company_cubit.dart'
    as _i292;
import 'package:easy_stock/app/ui/employee/home/cubit/home_cubit.dart' as _i238;
import 'package:easy_stock/app/ui/employee/register_movement/cubit/register_movement_cubit.dart'
    as _i729;
import 'package:easy_stock/app/ui/employee/stock/cubit/stock_cubit.dart'
    as _i42;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i144.ISecureStorageService>(() => _i916.SecureStorageService());
    gh.factory<_i976.AuthInterceptor>(
      () => _i976.AuthInterceptor(gh<_i144.ISecureStorageService>()),
    );
    gh.lazySingleton<_i375.AppCubit>(
      () => _i375.AppCubit(gh<_i144.ISecureStorageService>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i976.AuthInterceptor>()),
    );
    gh.factory<_i248.AuthDatasource>(
      () => _i248.AuthDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i578.CompanyDatasource>(
      () => _i578.CompanyDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i524.ProductDatasource>(
      () => _i524.ProductDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i820.StockDatasource>(
      () => _i820.StockDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i258.UserDatasource>(
      () => _i258.UserDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i778.IProductRepository>(
      () => _i96.ProductRepository(gh<_i524.ProductDatasource>()),
    );
    gh.factory<_i594.GetProductListUc>(
      () => _i594.GetProductListUc(gh<_i778.IProductRepository>()),
    );
    gh.factory<_i633.ProductManagementCubit>(
      () => _i633.ProductManagementCubit(gh<_i778.IProductRepository>()),
    );
    gh.factory<_i42.StockCubit>(
      () => _i42.StockCubit(gh<_i778.IProductRepository>()),
    );
    gh.factory<_i586.IStockRepository>(
      () => _i603.StockRepository(gh<_i820.StockDatasource>()),
    );
    gh.factory<_i729.RegisterMovementCubit>(
      () => _i729.RegisterMovementCubit(
        gh<_i594.GetProductListUc>(),
        gh<_i586.IStockRepository>(),
      ),
    );
    gh.factory<_i236.IAuthRepository>(
      () => _i263.AuthRepository(gh<_i248.AuthDatasource>()),
    );
    gh.factory<_i1056.ICompanyRepository>(
      () => _i120.CompanyRepository(gh<_i578.CompanyDatasource>()),
    );
    gh.factory<_i469.IUserRepository>(
      () => _i867.UserRepository(gh<_i258.UserDatasource>()),
    );
    gh.factory<_i143.HistoricalCubit>(
      () => _i143.HistoricalCubit(gh<_i586.IStockRepository>()),
    );
    gh.factory<_i238.HomeCubit>(
      () => _i238.HomeCubit(gh<_i586.IStockRepository>()),
    );
    gh.factory<_i393.AuthCubit>(
      () => _i393.AuthCubit(gh<_i236.IAuthRepository>()),
    );
    gh.factory<_i384.CreateUserCubit>(
      () => _i384.CreateUserCubit(
        gh<_i469.IUserRepository>(),
        gh<_i236.IAuthRepository>(),
      ),
    );
    gh.factory<_i292.CreateCompanyCubit>(
      () => _i292.CreateCompanyCubit(
        gh<_i1056.ICompanyRepository>(),
        gh<_i469.IUserRepository>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i323.NetworkModule {}
