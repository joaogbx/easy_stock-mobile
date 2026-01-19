import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:easy_stock/app/features/user/presentation/bottom_sheets/user_add_bottom_sheet/cubit/user_add_cubit.dart';
import 'package:easy_stock/app/shared/components/app_text_field.dart';
import 'package:easy_stock/app/shared/components/base_bottom_sheet.dart';
import 'package:easy_stock/app/shared/components/button_widget.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/components/drag_handle.dart';
import 'package:easy_stock/app/shared/components/input_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAddBottomSheet extends StatefulWidget {
  const UserAddBottomSheet({
    super.key,
  });

  @override
  State<UserAddBottomSheet> createState() => _UserAddBottomSheetState();
}

class _UserAddBottomSheetState extends State<UserAddBottomSheet> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? role;

  final _formKey = GlobalKey<FormState>();
  final _cubit = getIt<UserAddCubit>();

  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
        child: BlocListener<UserAddCubit, UserAddState>(
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
          child: BlocBuilder<UserAddCubit, UserAddState>(
            builder: (context, state) {
              bool loading = state.loading;
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Adicionar Usuário',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // VALIDAÇÃO DE NOME
                    AppTextField(
                      controller: _nameController,
                      label: 'Nome',
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor, insira o nome';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // VALIDAÇÃO DE EMAIL
                    AppTextField(
                      controller: _emailController,
                      label: 'Email',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O email é obrigatório';
                        }
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value);
                        if (!emailValid) {
                          return 'Insira um email válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // VALIDAÇÃO DE FUNÇÃO (SELECT)
                    CustomSelectInput<String>(
                      labelText: 'Função',
                      prefixIcon: Icons.admin_panel_settings,
                      items: const ['Administrador', 'Funcionário'],
                      itemLabelBuilder: (item) => item,
                      value: role,
                      onItemSelected: (value) {
                        setState(() {
                          role = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Selecione uma função';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // VALIDAÇÃO DE SENHA
                    AppTextField(
                      controller: _passwordController,
                      label: 'Senha',
                      prefixIcon: Icons.password,
                      // Idealmente, seu AppTextField deveria ter um bool obscureText
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A senha é obrigatória';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // BOTÃO SALVAR
                    ButtonWidget(
                      loading: loading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _cubit.createUser(
                            name: _nameController.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passwordController.text,
                            role: role!,
                            onSuccess: _onSuccess,
                          );
                        }
                      },
                      text: 'SALVAR',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _onSuccess() {
    Navigator.of(context).pop(true);

    showSnackBarFeedback(
      context: context,
      message: 'Usuário criado com sucesso!',
      feedbackType: FeedbackType.success,
    );
  }
}
