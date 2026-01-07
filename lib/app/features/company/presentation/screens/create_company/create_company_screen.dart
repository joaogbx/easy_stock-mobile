import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/routes/app_routes.dart';
import 'package:easy_stock/app/features/user/data/model/user_model.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:easy_stock/app/features/home/admin/presentation/home_admin_screen.dart';
import 'package:easy_stock/app/features/home/employee/presentation/home_employee.dart';
import 'package:easy_stock/app/features/company/cubit/create_company_cubit.dart';
import 'package:easy_stock/app/features/company/presentation/screens/create_company/steps/company_details_step.dart';
import 'package:easy_stock/app/features/company/presentation/screens/create_company/steps/company_explication_step.dart';
import 'package:easy_stock/app/features/company/presentation/screens/create_company/steps/company_welcome_step.dart';

import 'package:easy_stock/app/features/auth/presentation/login/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateCompanyScreen extends StatefulWidget {
  const CreateCompanyScreen({super.key, required this.user});

  final User user;

  @override
  State<CreateCompanyScreen> createState() => _CreateCompanyScreenState();
}

class _CreateCompanyScreenState extends State<CreateCompanyScreen> {
  final _cubit = getIt<CreateCompanyCubit>();
  final userLogged = getIt<AppCubit>().state.userlogged;
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  String companyName = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<CreateCompanyCubit, CreateCompanyState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackBarFeedback(
              context: context,
              message: state.errorMessage,
              feedbackType: FeedbackType.error,
            );
          }
        },
        child: BlocBuilder<CreateCompanyCubit, CreateCompanyState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 20, 20, 20),
              body: Padding(
                padding: EdgeInsetsGeometry.only(
                  left: 10,
                  right: 10,
                  bottom: 30,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (value) {
                          _currentIndex = value;
                          setState(() {});
                        },
                        children: [
                          CompanyWelcomeStep(
                            pageController: _pageController,
                            userName: widget.user.name,
                          ),
                          CompanyDetailsStep(
                            onNameChanged: (value) {
                              companyName = value;
                            },
                          ),
                          CompanyExplicationStep(
                            companyName: companyName,
                            user: widget.user,
                            pageController: _pageController,
                            createCompany: () {
                              context.read<CreateCompanyCubit>().createCompany(
                                companyName: companyName,
                                onSuccessCreateCompany: onSuccessCreateCompany,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        _currentIndex == 0
                            ? TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                  // ação ao clicar em "Mais tarde"
                                },
                                child: Text(
                                  'Criar mais tarde',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsPallete.primaryPurple,
                                  ),
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.linear,
                                  );
                                },

                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: ColorsPallete.primaryPurple,
                                ),
                              ),
                        Spacer(),
                        if (_currentIndex != 2)
                          IconButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear,
                              );
                            },

                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: ColorsPallete.primaryPurple,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void onSuccessCreateCompany() {
    AppRoutes.router.go(AppRoutes.homeAdmin);
  }
}
