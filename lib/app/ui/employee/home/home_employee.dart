import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/core/ui/components/card_action_widget.dart';
import 'package:easy_stock/app/core/ui/components/register_movement_button.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:easy_stock/app/core/ui/screen/historical_screen/historical_screen.dart';
import 'package:easy_stock/app/core/ui/theme/colors_pallete.dart';
import 'package:easy_stock/app/ui/config/config_bottom_sheet.dart';
import 'package:easy_stock/app/ui/employee/home/cubit/home_cubit.dart';
import 'package:easy_stock/app/ui/employee/register_movement/register_movement_bottom_sheet.dart';

import 'package:easy_stock/app/ui/employee/stock/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeEmployee extends StatefulWidget {
  final Function() onToggle;
  HomeEmployee({super.key, required this.onToggle});

  @override
  State<HomeEmployee> createState() => _HomeEmployeeState();
}

class _HomeEmployeeState extends State<HomeEmployee> {
  final List<Map<String, String>> historico = [
    {'data': '22/10', 'produto': 'Arroz', 'tipo': 'Saída', 'quantidade': '5'},
    {
      'data': '21/10',
      'produto': 'Leite',
      'tipo': 'Entrada',
      'quantidade': '10',
    },
    {
      'data': '21/10',
      'produto': 'Papel A4',
      'tipo': 'Saída',
      'quantidade': '20',
    },
    {
      'data': '20/10',
      'produto': 'Arroz',
      'tipo': 'Entrada',
      'quantidade': '50',
    },
    {'data': '20/10', 'produto': 'Caneta', 'tipo': 'Saída', 'quantidade': '2'},
  ];

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
                            builder: (context) => RegisterMovement(
                              registerMode: RegisterMode.stockIn,
                              onSuccess: () {},
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
                            builder: (context) => RegisterMovement(
                              registerMode: RegisterMode.stockOut,
                              onSuccess: () {},
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
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                              255,
                              35,
                              35,
                              35,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: stockMovements!.length,
                            itemBuilder: (context, index) {
                              final movement = stockMovements[index];
                              final product = movement.product;

                              final isStockIn = movement.type == 'STOCK_IN';
                              final color = isStockIn
                                  ? Colors.green.shade400
                                  : Colors.red.shade400;

                              final movementType = movement.type == 'STOCK_IN'
                                  ? 'Entrada'
                                  : 'Saída';

                              return Column(
                                children: [
                                  ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 2,
                                    ),
                                    leading: Icon(
                                      isStockIn
                                          ? Icons.arrow_downward
                                          : Icons.arrow_upward,
                                      color: color,
                                      size: 20,
                                    ),
                                    title: Text(
                                      product.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${movement.createdAt.day}/ ${movement.createdAt.month} | $movementType',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    trailing: Text(
                                      '${isStockIn ? '+' : '-'}${movement.quantity}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: color,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
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
                              builder: (context) => HistoricalScreen(),
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
