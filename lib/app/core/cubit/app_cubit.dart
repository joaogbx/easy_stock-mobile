import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/core/models/stock_movement.dart';
import 'package:easy_stock/app/core/models/user_model.dart';
import 'package:easy_stock/app/features/auth/data/repositories/auth_repository.dart';
import 'package:easy_stock/app/features/auth/domain/i_auth_repository.dart';
import 'package:easy_stock/app/features/stock/domain/repositories/i_stock_reposittory.dart';
import 'package:easy_stock/app/core/infra/storage/i_secure_storage_service.dart';
import 'package:easy_stock/app/core/infra/storage/secure_storage_service.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  final ISecureStorageService _iSecureStorageService;

  AppCubit(
    this._iSecureStorageService,
  ) : super(const AppState());

  void setUserLogged({required User user}) {
    emit(state.copyWith(userlogged: user));
  }

  void logout() async {
    await _iSecureStorageService.clear();
    emit(state.copyWith(userlogged: null));
  }
}
