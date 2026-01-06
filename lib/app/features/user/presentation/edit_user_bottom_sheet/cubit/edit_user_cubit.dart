import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_user_state.dart';
part 'edit_user_cubit.freezed.dart';

class EditUserCubit extends Cubit<EditUserState> {
  EditUserCubit() : super(EditUserState());
}
