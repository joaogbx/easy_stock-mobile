// lib/app/shared/components/skeleton_card_action.dart

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonCardAction extends StatelessWidget {
  const SkeletonCardAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 40, 30, 50), // Tom roxo bem escuro
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(0.05),
        highlightColor: Colors.white.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const CircleAvatar(backgroundColor: Colors.white, radius: 20),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 120, height: 16, color: Colors.white),
                    const SizedBox(height: 6),
                    Container(width: 200, height: 12, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
