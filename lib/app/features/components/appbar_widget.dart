import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppbarWidget({
    super.key,
    this.backgroundColor = const Color.fromARGB(255, 20, 20, 20),
    this.textColor = Colors.white,
    required this.text,
    this.actions,
  });

  Color backgroundColor;
  Color textColor;
  final String text;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, // Remove a sombra ao rolar
      scrolledUnderElevation: 0,
      title: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
      // AppBar transparente/escura para manter o fundo homogêneo
      backgroundColor: backgroundColor,
      actions: actions,
      iconTheme: IconThemeData(color: textColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
