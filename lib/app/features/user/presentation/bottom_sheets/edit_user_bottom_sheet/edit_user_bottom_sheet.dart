import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/routes/app_routes.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:easy_stock/app/features/user/presentation/bottom_sheets/edit_user_bottom_sheet/cubit/edit_user_cubit.dart';
import 'package:easy_stock/app/shared/components/app_text_field.dart';
import 'package:easy_stock/app/shared/components/base_bottom_sheet.dart';
import 'package:easy_stock/app/shared/components/button_widget.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/components/drag_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserEditBottomSheet extends StatefulWidget {
  final User user;
  final Function() onSuccess;

  const UserEditBottomSheet({
    super.key,
    required this.user,
    required this.onSuccess,
  });

  @override
  State<UserEditBottomSheet> createState() => _UserEditBottomSheetState();
}

class _UserEditBottomSheetState extends State<UserEditBottomSheet> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  final _cubit = getIt<EditUserCubit>();

  @override
  void initState() {
    _nameController.text = widget.user?.name ?? '';
    _emailController.text = widget.user?.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
        left: 20,
        right: 20,
      ),
      child: BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder<EditUserCubit, EditUserState>(
          builder: (context, state) {
            bool loading = state.loading;
            return Column(
              children: [
                Text(
                  widget.user == null ? 'Adicionar Usuário' : 'Editar Usuário',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                AppTextField(
                  controller: _nameController,

                  label: 'Nome',
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 10),
                AppTextField(
                  controller: _emailController,

                  label: 'Email',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 10),
                if (widget.user == null)
                  AppTextField(
                    controller: _emailController,
                    label: 'Senha',
                    prefixIcon: Icons.password,
                  ),
                const SizedBox(height: 20),
                ButtonWidget(
                  onPressed: () {
                    _cubit.editUser(
                      onSuccess: widget.onSuccess,
                      name: _nameController.text,
                      email: _emailController.text,
                    );
                  },
                  loading: loading,
                  text: 'SALVAR',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
