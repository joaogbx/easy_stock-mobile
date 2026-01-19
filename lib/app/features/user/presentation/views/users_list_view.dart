import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:easy_stock/app/features/user/presentation/bottom_sheets/edit_user_bottom_sheet/edit_user_bottom_sheet.dart';
import 'package:easy_stock/app/features/user/presentation/bottom_sheets/user_add_bottom_sheet/user_add_bottom_sheet.dart';
import 'package:easy_stock/app/shared/components/app_dialog.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/components/user_avatar.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';

class UsersListView extends StatefulWidget {
  final List<User> users;
  final Function() refresh;

  const UsersListView({super.key, required this.users, required this.refresh});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.users.length,
      separatorBuilder: (context, index) =>
          Divider(color: Colors.white12, height: 1),
      itemBuilder: (context, index) {
        final user = widget.users[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          leading: UserAvatar(
            name: user.name[0],
            radius: 25,
          ),
          title: Text(
            user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            '${user.email}\n${user.role}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          trailing: PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white70,
            ),
            color: ColorsPallete.darkSecondary,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'edit',
                child: Text(
                  'Editar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text(
                  'Excluir',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'edit')
                _showEditUserBottomSheet(context: context, user: user);
              if (value == 'delete')
                _onConfirmDelete(context: context, user: user);
            },
          ),
        );
      },
    );
  }

  void _onConfirmDelete({required BuildContext context, required User user}) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: 'Excluir',
        subtitle: 'Deseja realmente excluir ${user.name}?',
        cancelText: 'Cancelar',
        confirmText: 'Excluir',
        onConfirm: () => null,
      ),
    );
  }

  void _showEditUserBottomSheet({
    required BuildContext context,
    required User user,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorsPallete.darkBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => UserEditBottomSheet(
        user: user,
        onSuccess: onSuccess,
      ),
    );
  }

  void onSuccess() {
    widget.refresh();

    Navigator.of(context).pop();
    showSnackBarFeedback(
      context: context,
      message: 'Usuário atualizado com sucesso!',
      feedbackType: FeedbackType.success,
    );
  }
}
