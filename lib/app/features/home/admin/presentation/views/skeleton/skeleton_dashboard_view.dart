import 'package:easy_stock/app/features/home/admin/presentation/components/skeleton_stat_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
