import 'package:easy_stock/app/shared/components/drag_handle.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const BaseBottomSheet({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: padding ?? const EdgeInsets.fromLTRB(22, 0, 22, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DragHandle(),
            child,
          ],
        ),
      ),
    );
  }
}
