import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';

// --- SUA PALETA DE CORES EXATA ---

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO: QUADRADO ARREDONDADO MINIMALISTA
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: ColorsPallete.darkSecondary,
                borderRadius: BorderRadius.circular(28), // Quadrado Arredondado
                border: Border.all(
                  color: ColorsPallete.primaryPurple,
                  width: 3,
                ),
              ),
              child: Center(
                child: Text(
                  'E',
                  style: TextStyle(
                    color: ColorsPallete.primaryPurple,
                    fontSize: 70,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // NOME DO APP
            const Text(
              'Easy Stock',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
