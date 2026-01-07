import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/features/user/domain/i_user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_user_state.dart';
part 'edit_user_cubit.freezed.dart';

@Injectable()
class EditUserCubit extends Cubit<EditUserState> {
  EditUserCubit(this._iUserRepository) : super(EditUserState());

  final IUserRepository _iUserRepository;

  Future<void> editUser({
    String? name,
    String? email,
    required Function() onSuccess,
  }) async {
    emit(state.copyWith(errorMessage: null));
    final userLogged = getIt<AppCubit>().state.userlogged;
    emit(state.copyWith(loading: true));

    final data = {'name': name, 'email': email};

    final result = await _iUserRepository.updateUser(
      userId: userLogged!.id,
      payload: data,
    );

    if (result.isSuccess) {
      onSuccess();
    }

    if (result.isError) {
      emit(state.copyWith(errorMessage: result.error));
    }

    emit(
      state.copyWith(
        loading: false,
      ),
    );
  }
}
