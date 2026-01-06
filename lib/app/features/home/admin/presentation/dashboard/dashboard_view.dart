import 'package:easy_stock/app/shared/components/stat_card.dart';
import 'package:easy_stock/app/features/home/admin/data/model/dashboard_model.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    super.key,
    this.dashboardData,
  });

  final DashboardModel? dashboardData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              value: dashboardData?.totalStockQuantity ?? 0,
              icon: Icons.storage,
              color: Colors.teal,
            ),
            StatCard(
              title: 'Último Mês',
              value: dashboardData?.stockOutCount ?? 0,
              icon: Icons.trending_down,
              color: Colors.red,
            ),

            StatCard(
              title: 'Produtos Cad.',
              value: dashboardData?.totalProducts ?? 0,
              icon: Icons.category,
              color: Colors.indigo,
            ),
            StatCard(
              title: 'Último Mês',
              value: dashboardData?.stockOutCount ?? 0,
              icon: Icons.trending_up,
              color: const Color.fromARGB(255, 54, 244, 95),
            ),
          ],
        ),
      ],
    );
  }
}
