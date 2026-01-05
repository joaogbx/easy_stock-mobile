import 'package:flutter/material.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: const Color.fromARGB(255, 83, 22, 119),
      backgroundColor: const Color.fromARGB(
        255,
        31,
        31,
        31,
      ),
      displacement: 40.0,
      strokeWidth: 3.0,
      child: child,
    );
  }
}
