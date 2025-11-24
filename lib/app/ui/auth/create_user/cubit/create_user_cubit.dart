import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/data/models/user_model.dart';
import 'package:easy_stock/app/core/domain/repositories/i_auth_repository.dart';
import 'package:easy_stock/app/core/domain/repositories/i_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_state.dart';
part 'create_user_cubit.freezed.dart';

@Injectable()
class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this._iUserRepository, this._iAuthRepository)
    : super(CreateUserState());

  final IUserRepository _iUserRepository;
  final IAuthRepository _iAuthRepository;

  createUser({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final payload = {
      'email': email,
      'password': password,
      'name': name,
      'role': 'ADMIN',
    };

    final result = await _iAuthRepository.registerUser(payload: payload);

    if (result.isError) {
      emit(state.copyWith(errorMessage: result.error, loading: false));

      print(state.errorMessage);

      return false;
    }

    emit(
      state.copyWith(loading: false, user: result.data),
    );

    return true;
  }
}
