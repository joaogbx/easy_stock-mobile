import 'package:easy_stock/app/core/ui/theme/colors_pallete.dart';
import 'package:easy_stock/app/ui/auth/login/login_screen.dart';
import 'package:easy_stock/constants.dart';
import 'package:flutter/material.dart';

// Constantes de Cores (Ajuste os valores para os seus)
const Color kPrimaryColor = Color(0xFF7F00FF); // Roxo Vivo
const Color kTextColor = Colors.white;

class CompanyWelcomeStep extends StatelessWidget {
  // Recebe o nome do usuário como parâmetro para personalizar a tela.
  final String userName;

  // Recebe o PageController para permitir a navegação programática
  final PageController pageController;

  const CompanyWelcomeStep({
    super.key,
    required this.userName,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),

            // Ícone Visual para Reforço
            Icon(
              Icons.storefront,
              size: 100,
              color: ColorsPallete.primaryPurple,
            ),

            const SizedBox(height: 40),

            // Título Principal
            Text(
              'Bem-vindo(a), $userName!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: ColorsPallete.secondaryPurple,
                // Destaque com o roxo
              ),
            ),

            const SizedBox(height: 15),

            // Subtítulo / Explicação
            Text(
              'Para começar a gerenciar seu estoque, precisamos criar seu espaço de trabalho exclusivo para o seu negócio. É rápido!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: kTextColor.withOpacity(0.8),
              ),
            ),

            const Spacer(flex: 2),

            // Botão de Ação (Avançar, mas a navegação por seta é preferencial)
            // Se você quiser um botão extra na tela para iniciar, use este:
            /*
            ElevatedButton(
              onPressed: () => pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text('Começar Configuração'),
              ),
            ),
            */
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
