import 'package:easy_stock/app/core/models/user_model.dart';
import 'package:easy_stock/app/shared/theme/colors_pallete.dart'; // Import da Paleta
import 'package:easy_stock/constants.dart';
import 'package:flutter/material.dart';

class CompanyExplicationStep extends StatelessWidget {
  final String companyName;
  final PageController pageController;
  final User user;
  final Function() createCompany;

  const CompanyExplicationStep({
    super.key,
    required this.companyName,
    required this.pageController,
    required this.user,
    required this.createCompany,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),

          // Ícone com a cor primária
          Icon(
            Icons.storefront,
            size: 80,
            color: ColorsPallete.primaryPurple,
          ),

          const SizedBox(height: 30),

          // Título Principal com a cor primária
          Text(
            'Criar: $companyName',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: ColorsPallete.primaryPurple,
            ),
          ),

          const SizedBox(height: 40),
          Text(
            'Ao confirmar, a empresa "$companyName" será criada. Você será definido como o **único RESPONSÁVEL ** por este novo espaço.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              height: 1.4,
              color: Colors.white.withOpacity(0.9),
            ),
          ),

          const SizedBox(height: 25),
          const Divider(color: Colors.white10),
          const SizedBox(height: 25),

          // Subtítulo com a cor primária
          Text(
            'Próximos Passos:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorsPallete.primaryPurple,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '1. Você será levado(a) direto para o seu Dashboard.\n' +
                '2. Poderá começar a cadastrar seus produtos e estoque.\n' +
                '3. Convidar e gerenciar outros usuários (Administradores ou Funcionários) para a sua equipe.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              height: 1.5,
              color: Colors.white.withOpacity(0.9),
            ),
          ),

          const Spacer(flex: 2),

          // Botão (O ThemeData já deve definir o fundo como roxo)
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                createCompany();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'SIM, CONFIRMAR E COMEÇAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
