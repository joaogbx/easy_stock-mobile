// lib/app/features/home/admin/presentation/home_admin_skeleton_page.dart

import 'package:easy_stock/app/features/home/admin/presentation/components/skeleton_stat_card.dart';
import 'package:easy_stock/app/features/home/admin/presentation/components/skeleton_card_action.dart';
import 'package:easy_stock/app/features/home/admin/presentation/components/skeleton_register_button.dart';
import 'package:flutter/material.dart';
// Importe aqui onde estão suas classes já criadas:
// import 'package:easy_stock/.../skeleton_dashboard_view.dart';
// import 'package:easy_stock/.../skeleton_register_button.dart';
// import 'package:easy_stock/.../skeleton_card_action.dart';

class HomeAdminSkeleton extends StatelessWidget {
  const HomeAdminSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // NeverScrollable para o shimmer não "fugir" enquanto carrega
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),

            // 1. Título "Dashboard" (Skeleton estático)
            const Center(
              child: Text(
                'Dashboard',
                style: TextStyle(color: Colors.white24, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),

            // 2. Header (Avatar + Textos)
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white.withOpacity(0.05),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 150, height: 22, color: Colors.white10),
                    const SizedBox(height: 8),
                    Container(width: 100, height: 15, color: Colors.white10),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 3. O Dashboard que você já criou
            const SkeletonDashboardView(),

            const SizedBox(height: 30),

            // 4. Seção Ações Rápidas
            const Text(
              'Ações Rápidas',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Botões de Registro que você já criou
            const SkeletonRegisterButton(),
            const SizedBox(height: 12),
            const SkeletonRegisterButton(),

            const SizedBox(height: 20),

            // 5. Seção Gestão e Relatórios
            const Text(
              'Gestão e Relatórios',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Cards de Ação que você já criou
            const SkeletonCardAction(),
            const SizedBox(height: 20),
            const SkeletonCardAction(),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
