// lib/app/shared/components/skeleton_register_button.dart

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonRegisterButton extends StatelessWidget {
  const SkeletonRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withOpacity(0.05),
      highlightColor: Colors.white.withOpacity(0.1),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 40, 40, 40),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
