// Nome do arquivo: add_product_button.dart (ou similar)

import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';

// Este widget é o seu botão de ação primário global para adicionar produtos.
class ButtonWidget extends StatelessWidget {
  // Define a função de callback (ação a ser executada ao clicar).
  final Function() onPressed;

  // Permite que o texto seja customizado, mas mantém 'ADICIONAR' como padrão.
  final String text;
  final bool loading;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.loading = false,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsetsGeometry.all(0),
      child: ElevatedButton(
        // Ação a ser executada
        onPressed: onPressed,

        // Estilo visual global definido aqui
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? ColorsPallete.primaryPurple,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: loading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
