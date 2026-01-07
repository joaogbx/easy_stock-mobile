import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// --- SKELETON STAT CARD ---
class SkeletonStatCard extends StatelessWidget {
  const SkeletonStatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 24,
      child: Card(
        // Cor do Card visível (cinza escuro para tema dark)
        color: Colors.grey[900],
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Shimmer.fromColors(
          // Cor do brilho que passa por cima
          baseColor: Colors.white.withOpacity(0.05),
          highlightColor: Colors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ícone Placeholder
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                // Valor Placeholder
                Container(
                  width: 60,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 4),
                // Título Placeholder
                Container(
                  width: 80,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// --- SKELETON DASHBOARD VIEW ---
class SkeletonDashboardView extends StatelessWidget {
  const SkeletonDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título "Resumo Geral"
        Shimmer.fromColors(
          baseColor: Colors.white.withOpacity(0.1),
          highlightColor: Colors.white.withOpacity(0.2),
          child: Container(
            width: 150,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 16.0,
          runSpacing: 16.0,
          children: const [
            SkeletonStatCard(),
            SkeletonStatCard(),
            SkeletonStatCard(),
            SkeletonStatCard(),
          ],
        ),
      ],
    );
  }
}
