import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomSplashScreen extends StatelessWidget {
  const MyCustomSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exemplo de Logo com animação ou Hero
            const FlutterLogo(size: 100),
            const SizedBox(height: 24),
            const CircularProgressIndicator(
              color: Color(0xFF6F00FF), // Seu roxo accentColor
            ),
          ],
        ),
      ),
    );
  }
}
