import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/core/models/stock_movement.dart';
import 'package:easy_stock/app/core/models/user_model.dart';
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
  final IAuthRepository _iAuthRepository;

  AppCubit(this._iSecureStorageService, this._iAuthRepository)
    : super(const AppState()) {
    appStarted();
  }

  void appStarted() async {
    emit(state.copyWith(loading: true));
    // 1. Inicia o loading para a Splash Screen saber que deve esperar

    // 2. Tenta ler o token do storage seguro
    final token = await _iSecureStorageService.read('token');

    if (token != null) {
      // 3. Busca os dados do usuário na rota /me
      final result = await _iAuthRepository.me();

      if (result.isSuccess) {
        // Usuário autenticado com sucesso
        emit(state.copyWith(userlogged: result.data));
        emit(state.copyWith(loading: false));
        return; // Sai da função
      }
    }

    // 4. Se chegou aqui, é porque não tem token ou o token falhou/expirou
    emit(
      state.copyWith(userlogged: null, loading: false),
    );
  }

  void setUserLogged({required User user}) {
    emit(state.copyWith(userlogged: user));
  }

  void logout() async {
    await _iSecureStorageService.clear();
    emit(state.copyWith(userlogged: null));
  }
}
