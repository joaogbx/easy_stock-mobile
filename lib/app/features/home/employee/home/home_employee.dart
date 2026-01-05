import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/shared/components/card_action_widget.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/components/register_movement_button.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:easy_stock/app/shared/screen/historical_screen/historical_screen.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:easy_stock/app/features/config/config_bottom_sheet.dart';
import 'package:easy_stock/app/features/home/employee/home/cubit/home_cubit.dart';
import 'package:easy_stock/app/features/home/employee/home/views/movements_preview_widget.dart';
import 'package:easy_stock/app/features/stock/presentation/bottom_sheets/register_movement/register_movement_bottom_sheet.dart';

import 'package:easy_stock/app/features/stock/presentation/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeEmployee extends StatefulWidget {
  final Function() onToggle;
  HomeEmployee({super.key, required this.onToggle});

  @override
  State<HomeEmployee> createState() => _HomeEmployeeState();
}

class _HomeEmployeeState extends State<HomeEmployee> {
  final appCubit = getIt<AppCubit>();
  final _cubit = getIt<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    final userName = appCubit.state.userlogged!.name;
    final userRole = appCubit.state.userlogged!.role;

    return BlocProvider(
      create: (context) => _cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final stockMovements = state.stockMovements;
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 20, 20, 20),
            body: RefreshIndicator(
              color: const Color.fromARGB(255, 83, 22, 119),
              backgroundColor: const Color.fromARGB(
                255,
                31,
                31,
                31,
              ),
              displacement: 40,
              strokeWidth: 3,
              onRefresh: () async {
                _cubit.initData();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            label: Text(
                              'Admin',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(Icons.swap_horiz, color: Colors.white),
                            onPressed: widget.onToggle,
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 40),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    userRole,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.settings, color: Colors.white),
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
                                    return SettingsScreenOption2();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
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
                            ),
                          );
                        },
                        registerMode: RegisterMode.stockOut,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Consultas',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12),
                      CardActionWidget(
                        icon: Icons.inventory_2_outlined,
                        title: 'Estoque Atual',
                        subtitle: 'Visualize o saldo de todos os produtos.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StockScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      if (stockMovements != null)
                        MovementsPreviewWidget(stockMovements: stockMovements),
                      SizedBox(height: 16),
                      CardActionWidget(
                        icon: Icons.history_toggle_off,
                        title: 'Ver todas as movimentações',
                        subtitle:
                            'Acompanhe seus registros de Entrada e Saída.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoricalMovementScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 24),
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
