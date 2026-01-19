import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:easy_stock/app/features/user/presentation/bottom_sheets/edit_user_bottom_sheet/edit_user_bottom_sheet.dart';
import 'package:easy_stock/app/features/user/presentation/bottom_sheets/user_add_bottom_sheet/user_add_bottom_sheet.dart';
import 'package:easy_stock/app/features/user/presentation/cubit/user_management_cubit.dart';
import 'package:easy_stock/app/features/user/presentation/views/users_list_view.dart';
import 'package:easy_stock/app/shared/components/app_dialog.dart';
import 'package:easy_stock/app/shared/components/app_text_field.dart';
import 'package:easy_stock/app/shared/components/appbar_widget.dart';
import 'package:easy_stock/app/shared/components/button_widget.dart';
import 'package:easy_stock/app/shared/components/custom_refresh_indicator.dart';
import 'package:easy_stock/app/shared/components/drag_handle.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({
    super.key,
  });

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  final _cubit = getIt<UserManagementCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,

      child: BlocBuilder<UserManagementCubit, UserManagementState>(
        builder: (context, state) {
          final users = state.users;
          bool loading = state.loading;
          return Scaffold(
            backgroundColor: ColorsPallete.darkBackground,
            appBar: AppbarWidget(text: 'Gerenciar Usuários'),
            body: CustomRefreshIndicator(
              onRefresh: () async => _refreshUsers(),
              child: Column(
                children: [
                  Expanded(
                    child: loading
                        ? Center(child: CircularProgressIndicator())
                        : users.isEmpty
                        ? const Center(
                            child: Text(
                              'Nenhum usuário cadastrado.',
                              style: TextStyle(color: Colors.white70),
                            ),
                          )
                        : UsersListView(
                            users: users,
                            refresh: _refreshUsers,
                          ),
                  ),
                  Divider(height: 1, thickness: 0.6, color: Colors.white12),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                      left: 40,
                      right: 40,
                    ),
                    child: ButtonWidget(
                      onPressed: () => _showUserAddBottomSheet(context),

                      text: 'ADICIONAR',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showUserAddBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorsPallete.darkBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => UserAddBottomSheet(),
    ).then((value) {
      if (value) _refreshUsers();
    });
  }

  void _refreshUsers() async {
    _cubit.initData();
  }
}
