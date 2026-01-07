import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/features/user/presentation/edit_user_bottom_sheet/cubit/edit_user_cubit.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/components/drag_handle.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserEditBottomSheet extends StatefulWidget {
  final String currentName;
  final String currentEmail;

  const UserEditBottomSheet({
    super.key,
    required this.currentName,
    required this.currentEmail,
  });

  @override
  State<UserEditBottomSheet> createState() => _UserEditBottomSheetState();
}

class _UserEditBottomSheetState extends State<UserEditBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  final _cubit = getIt<EditUserCubit>();

  @override
  void initState() {
    super.initState();
    // Inicia os campos com os valores atuais do usuário
    _nameController = TextEditingController(text: widget.currentName);
    _emailController = TextEditingController(text: widget.currentEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Escutando o AppCubit ou o Cubit responsável pelo perfil

    return BlocProvider(
      create: (context) => _cubit,
      child: BlocBuilder<EditUserCubit, EditUserState>(
        builder: (context, state) {
          bool loading = state.loading;
          return BlocListener<EditUserCubit, EditUserState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                Navigator.of(context).pop();

                showSnackBarFeedback(
                  context: context,
                  message: state.errorMessage!,
                  feedbackType: FeedbackType.error,
                );
              }
            },
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      DragHandle(),
                      const Text(
                        'Editar Perfil',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      // Campo Nome
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Seu Nome',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.person, color: Colors.white70),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Insira seu nome';
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Campo Email
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.email, color: Colors.white70),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Insira seu e-mail';
                          if (!value.contains('@')) return 'E-mail inválido';
                          return null;
                        },
                      ),

                      const SizedBox(height: 40),

                      // Botão Salvar
                      ElevatedButton(
                        onPressed: () {
                          _cubit.editUser(
                            name: _nameController.text,
                            email: _emailController.text,
                            onSuccess: onSuccess,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsPallete.primaryPurple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: loading
                            ? CircularProgressIndicator()
                            : const Text(
                                'SALVAR ALTERAÇÕES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  onSuccess() {
    Navigator.of(context).pop(true);
    Navigator.of(context).pop(true);
    showSnackBarFeedback(
      context: context,
      message: 'Usuário editado com successo',
      feedbackType: FeedbackType.success,
    );
  }
}
