import 'package:easy_stock/app/ui/components/stat_card.dart';
import 'package:easy_stock/app/ui/admin/product_management_screen/product_management_screen.dart';
import 'package:easy_stock/app/core/ui/components/card_action_widget.dart';
import 'package:easy_stock/app/core/ui/screen/historical_screen/historical_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatelessWidget {
  final VoidCallback onToggle;
  const HomeAdmin({super.key, required this.onToggle});

  // Função auxiliar para construir Cards de Admin

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Dashboard',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton.icon(
                      label: Text(
                        'Funcionário',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.swap_horiz, color: Colors.white),
                      onPressed: onToggle,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  CircleAvatar(radius: 40),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome do usuario',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        'Administrador',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Resumo Geral',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(221, 255, 255, 255),
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 16.0, // Espaço horizontal entre os cards
                runSpacing: 16.0, // Espaço vertical entre as linhas
                children: [
                  // Simulação de Card de Indicador 1
                  StatCard(
                    title: 'Total de Itens',
                    value: '1.245',
                    icon: Icons.storage,
                    color: Colors.teal,
                  ),
                  StatCard(
                    title: 'Último Mês',
                    value: '+120 Saídas',
                    icon: Icons.trending_down,
                    color: Colors.red,
                  ),
                  StatCard(
                    title: 'Produtos Cad.',
                    value: '45',
                    icon: Icons.category,
                    color: Colors.indigo,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Gestão e Relatórios',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(221, 255, 255, 255),
                ),
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 20),
              CardActionWidget(
                icon: Icons.bar_chart,
                title: 'Relatório Completo',
                subtitle: 'Visualizar todas as movimentações e filtros.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoricalScreen()),
                  );
                },
              ),

              SizedBox(height: 16),

              // Card para Relatórios Completos
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildStatCard(
  //   BuildContext context,
  //   String title,
  //   String value,
  //   IconData icon,
  //   Color color,
  // ) {}
}
