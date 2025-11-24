import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/data/models/user_model.dart';
import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart';
import 'package:easy_stock/app/core/infra/storage/secure_storage_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._iAuthRepository,
  ) : super(AuthState());

  final IAuthRepository _iAuthRepository;

  autenticate({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        loading: true,
        errorMessage: null,
      ),
    );

    try {
      final appCubit = getIt<AppCubit>();
      final credentials = {'email': email, 'password': password};

      final result = await _iAuthRepository.autenticate(
        credentials: credentials,
      );

      if (result.isError) {
        emit(state.copyWith(errorMessage: result.error));
      }

      if (result.isSuccess) {
        emit(state.copyWith(user: result.data));
        appCubit.setUserLogged(user: result.data);
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Ocorreu um erro inesperado: $e'));
    }

    emit(state.copyWith(loading: false));
  }
}
