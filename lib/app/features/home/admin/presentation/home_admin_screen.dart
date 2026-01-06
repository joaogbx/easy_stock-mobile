import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:easy_stock/app/features/stock/presentation/bottom_sheets/register_movement/register_movement_bottom_sheet.dart';
import 'package:easy_stock/app/shared/components/register_movement_button.dart';
import 'package:easy_stock/app/shared/components/stat_card.dart';
import 'package:easy_stock/app/features/home/admin/cubit/home_admin_cubit.dart';
import 'package:easy_stock/app/features/home/admin/presentation/dashboard/dashboard_view.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/product_management_screen.dart';
import 'package:easy_stock/app/shared/components/card_action_widget.dart';
import 'package:easy_stock/app/shared/screen/movements_screen/movements_screen.dart';
import 'package:easy_stock/app/features/user/presentation/config_bottom_sheet/config_bottom_sheet.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
              child: SingleChildScrollView(
                // 🚀 Physics obrigatório para o refresh funcionar sempre
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      const Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Dashboard',
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
                          const CircleAvatar(radius: 40),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nome do usuario',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'Administrador',
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
                            onPressed: () {
                              showModalBottomSheet(
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
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      loading
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(150.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
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
                            backgroundColor: ColorsPallete.darkBackground,
                            builder: (ctx) => RegisterMovementBottomSheet(
                              registerMode: RegisterMode.stockIn,
                              refresh: () {
                                _cubit.initData();
                              },
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
                            backgroundColor: ColorsPallete.darkBackground,
                            builder: (ctx) => RegisterMovementBottomSheet(
                              registerMode: RegisterMode.stockOut,
                              refresh: () {
                                _cubit.initData();
                              },
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              allowSnapshotting: false,
                              builder: (context) => ProductManagementScreen(),
                            ),
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
                      const SizedBox(height: 16),
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
}
