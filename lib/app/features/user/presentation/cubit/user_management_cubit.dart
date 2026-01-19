import 'package:bloc/bloc.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:easy_stock/app/features/user/domain/i_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_management_state.dart';
part 'user_management_cubit.freezed.dart';

@Injectable()
class UserManagementCubit extends Cubit<UserManagementState> {
  final IUserRepository _iUserRepository;
  UserManagementCubit(this._iUserRepository) : super(UserManagementState()) {
    initData();
  }

  void initData() async {
    emit(state.copyWith(loading: true));

    final result = await _iUserRepository.getUsersList();

    if (result.isSuccess) {
      emit(state.copyWith(users: result.data));
    }

    if (result.isError) {
      emit(state.copyWith(errorMessage: result.error));
    }

    emit(state.copyWith(loading: false));
  }
}
