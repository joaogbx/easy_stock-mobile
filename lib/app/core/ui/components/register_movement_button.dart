import 'package:easy_stock/app/ui/employee/register_movement/register_movement_bottom_sheet.dart';
import 'package:easy_stock/app/core/enums/register_mode.dart';
import 'package:flutter/material.dart';

class RegisterMovementButton extends StatelessWidget {
  final Function() onTap;

  final RegisterMode registerMode;

  const RegisterMovementButton({
    super.key,
    required this.onTap,
    required this.registerMode,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        registerMode == RegisterMode.stockOut
            ? Icons.remove_circle_outline
            : Icons.add_circle_outline,
        size: 28,
      ),
      label: Text(
        registerMode == RegisterMode.stockOut
            ? 'REGISTRAR SAÍDA'
            : 'REGISTRAR ENTRADA',
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: registerMode == RegisterMode.stockOut
            ? Colors.redAccent
            : Colors.green,
        minimumSize: Size(double.infinity, 80),
      ),
      onPressed: onTap,
    );
  }
}
