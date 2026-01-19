import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/features/user/domain/i_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_add_state.dart';
part 'user_add_cubit.freezed.dart';

@Injectable()
class UserAddCubit extends Cubit<UserAddState> {
  UserAddCubit(
    this._iUserRepository,
  ) : super(UserAddState());

  final IUserRepository _iUserRepository;

  void createUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required Function() onSuccess,
  }) async {
    emit(state.copyWith(loading: true));
    final roleFormatted = role == 'Funcionário' ? 'USER' : 'ADMIN';
    final payload = {
      'name': name,
      'email': email,
      'password': password,
      'role': roleFormatted,
    };

    final result = await _iUserRepository.createUser(payload: payload);

    if (result.isError) {
      emit(state.copyWith(loading: false, errorMessage: result.error));
      return;
    }

    if (result.isSuccess) {
      emit(state.copyWith(loading: false));
      onSuccess();
    }
  }
}
