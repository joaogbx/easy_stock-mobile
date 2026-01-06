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
import 'package:easy_stock/app/core/infra/storage/i_secure_storage_service.dart'
    as _i144;
import 'package:easy_stock/app/core/infra/storage/secure_storage_service.dart'
    as _i916;
import 'package:easy_stock/app/core/network/network_module.dart' as _i323;
import 'package:easy_stock/app/core/usecases/get_product_list_uc.dart' as _i816;
import 'package:easy_stock/app/features/auth/data/datasources/auth_datasource.dart'
    as _i94;
import 'package:easy_stock/app/features/auth/data/repository/auth_repository.dart'
    as _i65;
import 'package:easy_stock/app/features/auth/domain/i_auth_repository.dart'
    as _i494;
import 'package:easy_stock/app/features/auth/presentation/create_user/cubit/create_user_cubit.dart'
    as _i826;
import 'package:easy_stock/app/features/auth/presentation/login/cubit/auth_cubit.dart'
    as _i193;
import 'package:easy_stock/app/features/auth/utils/auth_interceptor.dart'
    as _i557;
import 'package:easy_stock/app/features/company/cubit/create_company_cubit.dart'
    as _i278;
import 'package:easy_stock/app/features/company/data/datasource/company_datasource.dart'
    as _i1059;
import 'package:easy_stock/app/features/company/data/repository/company_repository.dart'
    as _i570;
import 'package:easy_stock/app/features/company/domain/i_company_repository.dart'
    as _i934;
import 'package:easy_stock/app/features/home/admin/cubit/home_admin_cubit.dart'
    as _i952;
import 'package:easy_stock/app/features/home/admin/data/datasource/dashboard_datasource.dart'
    as _i836;
import 'package:easy_stock/app/features/home/admin/data/repository/dashboard_repository.dart'
    as _i346;
import 'package:easy_stock/app/features/home/admin/domain/i_dashboard_repository.dart'
    as _i76;
import 'package:easy_stock/app/features/home/employee/cubit/home_cubit.dart'
    as _i484;
import 'package:easy_stock/app/features/product/data/datasource/product_datasource.dart'
    as _i118;
import 'package:easy_stock/app/features/product/data/repository/product_repository.dart'
    as _i858;
import 'package:easy_stock/app/features/product/domain/i_product_repository.dart'
    as _i621;
import 'package:easy_stock/app/features/product/presentation/product_management_screen/cubit/product_management_cubit.dart'
    as _i684;
import 'package:easy_stock/app/features/stock/data/datasources/stock_datasource.dart'
    as _i945;
import 'package:easy_stock/app/features/stock/data/repository/stock_repository.dart'
    as _i278;
import 'package:easy_stock/app/features/stock/domain/repositories/i_stock_reposittory.dart'
    as _i648;
import 'package:easy_stock/app/features/stock/presentation/bottom_sheets/register_movement/cubit/register_movement_cubit.dart'
    as _i897;
import 'package:easy_stock/app/features/stock/presentation/cubit/stock_cubit.dart'
    as _i969;
import 'package:easy_stock/app/features/user/data/datasource/user_datasource.dart'
    as _i1052;
import 'package:easy_stock/app/features/user/data/repository/user_repository.dart'
    as _i491;
import 'package:easy_stock/app/features/user/domain/i_user_repository.dart'
    as _i471;
import 'package:easy_stock/app/shared/screen/movements_screen/cubit/historical_cubit.dart'
    as _i1023;
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
    gh.factory<_i557.AuthInterceptor>(
      () => _i557.AuthInterceptor(gh<_i144.ISecureStorageService>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(gh<_i557.AuthInterceptor>()),
    );
    gh.factory<_i94.AuthDatasource>(() => _i94.AuthDatasource(gh<_i361.Dio>()));
    gh.factory<_i1059.CompanyDatasource>(
      () => _i1059.CompanyDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i836.DashboardDatasource>(
      () => _i836.DashboardDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i118.ProductDatasource>(
      () => _i118.ProductDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i945.StockDatasource>(
      () => _i945.StockDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i1052.UserDatasource>(
      () => _i1052.UserDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i76.IDashboardRepository>(
      () => _i346.DashboardRepository(gh<_i836.DashboardDatasource>()),
    );
    gh.factory<_i494.IAuthRepository>(
      () => _i65.AuthRepository(gh<_i94.AuthDatasource>()),
    );
    gh.factory<_i952.HomeAdminCubit>(
      () => _i952.HomeAdminCubit(gh<_i76.IDashboardRepository>()),
    );
    gh.factory<_i193.AuthCubit>(
      () => _i193.AuthCubit(gh<_i494.IAuthRepository>()),
    );
    gh.factory<_i648.IStockRepository>(
      () => _i278.StockRepository(gh<_i945.StockDatasource>()),
    );
    gh.factory<_i621.IProductRepository>(
      () => _i858.ProductRepository(gh<_i118.ProductDatasource>()),
    );
    gh.factory<_i471.IUserRepository>(
      () => _i491.UserRepository(gh<_i1052.UserDatasource>()),
    );
    gh.factory<_i934.ICompanyRepository>(
      () => _i570.CompanyRepository(gh<_i1059.CompanyDatasource>()),
    );
    gh.factory<_i816.GetProductListUc>(
      () => _i816.GetProductListUc(gh<_i621.IProductRepository>()),
    );
    gh.factory<_i684.ProductManagementCubit>(
      () => _i684.ProductManagementCubit(gh<_i621.IProductRepository>()),
    );
    gh.factory<_i969.StockCubit>(
      () => _i969.StockCubit(gh<_i621.IProductRepository>()),
    );
    gh.factory<_i484.HomeCubit>(
      () => _i484.HomeCubit(gh<_i648.IStockRepository>()),
    );
    gh.factory<_i1023.HistoricalCubit>(
      () => _i1023.HistoricalCubit(gh<_i648.IStockRepository>()),
    );
    gh.lazySingleton<_i375.AppCubit>(
      () => _i375.AppCubit(
        gh<_i144.ISecureStorageService>(),
        gh<_i494.IAuthRepository>(),
      ),
    );
    gh.factory<_i897.RegisterMovementCubit>(
      () => _i897.RegisterMovementCubit(
        gh<_i816.GetProductListUc>(),
        gh<_i648.IStockRepository>(),
      ),
    );
    gh.factory<_i826.CreateUserCubit>(
      () => _i826.CreateUserCubit(
        gh<_i471.IUserRepository>(),
        gh<_i494.IAuthRepository>(),
      ),
    );
    gh.factory<_i278.CreateCompanyCubit>(
      () => _i278.CreateCompanyCubit(
        gh<_i934.ICompanyRepository>(),
        gh<_i471.IUserRepository>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i323.NetworkModule {}
