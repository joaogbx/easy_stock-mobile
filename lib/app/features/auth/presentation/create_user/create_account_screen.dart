import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/features/company/presentation/screens/create_company/create_company_screen.dart';
import 'package:easy_stock/app/features/auth/presentation/create_user/cubit/create_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _cubit = getIt<CreateUserCubit>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<CreateUserCubit, CreateUserState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackBarFeedback(
              context: context,
              feedbackType: FeedbackType.error,
              message: state.errorMessage!,
            );
          }

          if (state.user != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CreateCompanyScreen(
                    user: state.user!,
                  );
                },
              ),
            );
          }
        },
        child: BlocBuilder<CreateUserCubit, CreateUserState>(
          builder: (context, state) {
            final isLoading = state.loading;
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text(
                          'Crie sua conta',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),

                        // --- Campo Nome ---
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'Nome',
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O nome é obrigatório.';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 15),

                        // --- Campo Email ---
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'O email é obrigatório.';
                            }
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return 'Insira um email válido';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 15),

                        // --- Campo Senha ---
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Senha (Mín. 8 caracteres)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'A senha é obrigatória.';
                            }
                            if (value.length < 6) {
                              return 'A senha deve ter no mínimo 6 caracteres';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 50),

                        // --- Botão de Registro ---
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await context.read<CreateUserCubit>().createUser(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'Registrar',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 20),

                        // --- Link para Login ---
                        TextButton(
                          onPressed: () {
                            // Implementar navegação de volta para a tela de login
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Já tem uma conta? Faça login.',
                            style: TextStyle(
                              color: Colors.white70,
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
      ),
    );
  }
}

// ----------------------------------------------------------------------------------
// Exemplo de como rodar (apenas para fins de teste no DartPad/projeto)
// ----------------------------------------------------------------------------------
/* void main() {
  // Você precisaria de um MaterialApp aqui, com um tema dark configurado
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _CreateAccountScreenState.darkBackground,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
      ).copyWith(
        primary: _CreateAccountScreenState.primaryPurple,
        background: _CreateAccountScreenState.darkBackground,
      ),
    ),
    home: const CreateAccountScreen(),
  ));
}
*/
