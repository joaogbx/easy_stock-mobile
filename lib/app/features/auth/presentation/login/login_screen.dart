import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/infra/storage/secure_storage_service.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/features/home/admin/home/home_admin_screen.dart';
import 'package:easy_stock/app/features/company/presentation/screens/create_company/create_company_screen.dart';
import 'package:easy_stock/app/features/home/employee/home/home_employee.dart';
import 'package:easy_stock/app/features/auth/presentation/login/cubit/auth_cubit.dart';
import 'package:easy_stock/app/features/auth/presentation/create_user/create_account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _cubit = getIt<AuthCubit>();
  final _appCubit = getIt<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
          child: BlocProvider(
            create: (context) => _cubit,
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.errorMessage != null) {
                  showSnackBarFeedback(
                    context: context,
                    message: state.errorMessage!,
                    feedbackType: FeedbackType.error,
                  );
                }

                if (_appCubit.state.userlogged != null) {
                  if (_appCubit.state.userlogged?.companyId != null) {
                    showSnackBarFeedback(
                      context: context,
                      message: 'Usuário logado com sucesso',
                      feedbackType: FeedbackType.success,
                    );

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => HomeAdmin(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => CreateCompanyScreen(
                          user: _appCubit.state.userlogged!,
                        ),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  }
                }
              },
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  bool loading = state.loading;
                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        const Text(
                          'Easy Stock',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(hintText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira seu email';
                            }
                            if (!value.contains('@')) {
                              return 'Por favor, insira um email válido';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Senha'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira sua senha';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              //  if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().autenticate(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              // }
                            },
                            child: loading
                                ? CircularProgressIndicator()
                                : const Text(
                                    'Entrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Center(
                          child: Text(
                            'ou',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const SizedBox(height: 15),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Não tem uma conta?",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => CreateAccountScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Crie agora',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
