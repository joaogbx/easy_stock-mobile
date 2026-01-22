import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:easy_stock/app/core/routes/app_routes.dart';
import 'package:easy_stock/app/features/home/admin/presentation/cubit/home_admin_cubit.dart';
import 'package:easy_stock/app/features/home/admin/presentation/components/skeleton_stat_card.dart';
import 'package:easy_stock/app/features/home/admin/presentation/views/skeleton/home_skeleton.dart';
import 'package:easy_stock/app/features/home/admin/presentation/views/skeleton/skeleton_dashboard_view.dart';
import 'package:easy_stock/app/features/stock/presentation/bottom_sheets/register_movement/register_movement_bottom_sheet.dart';
import 'package:easy_stock/app/features/stock/presentation/components/register_movement_button.dart';
import 'package:easy_stock/app/features/home/admin/presentation/components/stat_card.dart';

import 'package:easy_stock/app/features/home/admin/presentation/views/dashboard_view.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/product_management_screen.dart';
import 'package:easy_stock/app/features/home/admin/presentation/components/card_action_widget.dart';
import 'package:easy_stock/app/features/stock/presentation/movements_screen/movements_screen.dart';
import 'package:easy_stock/app/features/user/presentation/user_management_screen.dart';
import 'package:easy_stock/app/shared/components/app_dialog.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/components/user_avatar.dart';
import 'package:easy_stock/app/features/user/presentation/bottom_sheets/config_bottom_sheet/config_bottom_sheet.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({
    super.key,
  });

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final _cubit = getIt<HomeAdminCubit>();
  final _appCubit = getIt<AppCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userLogged = _appCubit.state.userlogged;

    return PopScope(
      canPop: false, // Bloqueia a saída automática
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return; // Se já saiu, não faz nada

        // Exibe o diálogo de confirmação
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (modalContext) {
            return AppDialog(
              title: 'Excluir',
              subtitle: 'Deseja realmente sair do aplicativo?',
              confirmText: 'Excluir',
              confirmColor: Colors.redAccent,

              onConfirm: () {
                SystemNavigator.pop();
              },
            );
          },
        );

        // Se o usuário confirmou, fechamos o app manualmente
      },
      child: BlocProvider(
        create: (context) => _cubit, // Garante a carga inicial
        child: BlocBuilder<HomeAdminCubit, HomeAdminState>(
          builder: (context, state) {
            final dashboardData = state.dashBoardData;
            bool loading = state.loading;

            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 20, 20, 20),
              // 🚀 Início do RefreshIndicator
              body: RefreshIndicator(
                color: Colors.white,
                backgroundColor: const Color.fromARGB(255, 40, 40, 40),
                onRefresh: () async {
                  // Chama o método do seu cubit para atualizar os dados
                  _cubit.initData();
                },
                child: loading
                    ? HomeAdminSkeleton()
                    : SingleChildScrollView(
                        // 🚀 Physics obrigatório para o refresh funcionar sempre
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 40),
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      userLogged?.company?.name ?? 'Empresa',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  UserAvatar(
                                    name: userLogged!.name[0],
                                    radius: 35,
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userLogged?.name ?? 'Nome do usuário',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        userLogged?.role ?? 'Administrador',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          20,
                                          20,
                                          20,
                                        ),
                                        context: context,
                                        builder: (context) {
                                          return UserConfigSheet();
                                        },
                                      ).then((value) {
                                        if (value == true) {
                                          _cubit.initData();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              loading
                                  ? SkeletonDashboardView()
                                  : DashboardView(
                                      dashboardData: dashboardData,
                                    ),
                              const SizedBox(height: 30),
                              Text(
                                'Ações Rápidas',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 12),
                              RegisterMovementButton(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor:
                                        ColorsPallete.darkBackground,
                                    builder: (ctx) =>
                                        RegisterMovementBottomSheet(
                                          registerMode: RegisterMode.stockIn,
                                          refresh: _refresh,
                                        ),
                                  );
                                },
                                registerMode: RegisterMode.stockIn,
                              ),
                              SizedBox(height: 12),
                              RegisterMovementButton(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor:
                                        ColorsPallete.darkBackground,
                                    isScrollControlled: true,
                                    builder: (ctx) =>
                                        RegisterMovementBottomSheet(
                                          registerMode: RegisterMode.stockOut,
                                          refresh: _refresh,
                                        ),
                                  );
                                },
                                registerMode: RegisterMode.stockOut,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Gestão e Relatórios',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(221, 255, 255, 255),
                                ),
                              ),
                              const SizedBox(height: 12),
                              CardActionWidget(
                                icon: Icons.add_business,
                                title: 'Gerenciar Produtos',
                                subtitle: 'Adicionar, editar e remover itens.',
                                onTap: () {
                                  AppRoutes.router.push(
                                    AppRoutes.managementProduct,
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              CardActionWidget(
                                icon: Icons.bar_chart,
                                title: 'Relatório Completo',
                                subtitle:
                                    'Visualizar todas as movimentações e filtros.',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HistoricalMovementScreen(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              CardActionWidget(
                                icon: Icons.bar_chart,
                                title: 'Gerenciar Usuários',
                                subtitle: 'Adicionar, editar e remover itens.',
                                onTap: () async {
                                  await AppRoutes.router.push(
                                    AppRoutes.managementUsers,
                                  );
                                  _refresh();
                                },
                              ),
                              const SizedBox(height: 16),
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

  void _refresh() {
    _cubit.initData();
  }
}
