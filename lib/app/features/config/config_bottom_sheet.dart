import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';

// Definições de cor Literais e Constantes para Autonomia
const Color primaryDark = Color.fromARGB(
  255,
  20,
  20,
  20,
); // Fundo: Cinza escuro específico (20, 20, 20)
const Color accentColor = Color(0xFF6F00FF); // Roxo principal
const Color secondaryAccent = Color(0xFF9E00FF); // Roxo secundário
const Color redColor = Color(0xFFDC3545); // Vermelho para ação perigosa
const Color textColor = Colors.white; // Branco
const Color subtitleColor = Colors.white70; // Branco 70% para subtítulos
const Color cardBackground = Color(
  0xFF2C2C2C,
); // Fundo para os blocos de opções

class SettingsScreenOption2 extends StatefulWidget {
  @override
  State<SettingsScreenOption2> createState() => _SettingsScreenOption2State();
}

class _SettingsScreenOption2State extends State<SettingsScreenOption2> {
  final _appCubit = getIt<AppCubit>();
  @override
  Widget build(BuildContext context) {
    final userName = _appCubit.state.userlogged!.name;
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 22, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Seção Usuário - Título
          Text(
            'Informações do Usuário',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          // Bloco de Perfil (Container)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: cardBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: accentColor.withOpacity(0.3),
                  child: Icon(
                    Icons.person_outline,
                    size: 35,
                    color: accentColor,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Administrador',
                        style: TextStyle(color: subtitleColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          // Botão 'Editar Perfil' em destaque
          ElevatedButton(
            onPressed: () {
              print('Opção 2: Editar Perfil Clicado');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: accentColor, // Roxo principal
              foregroundColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              minimumSize: Size(double.infinity, 0),
            ),
            child: Text(
              'Editar Perfil',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 30),

          // Seção Conta - Título
          Text(
            'Configurações da Conta',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          // Opções da conta como TextButtons dentro de Contêineres
          Column(
            children: [
              // Mudar Senha
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                child: TextButton.icon(
                  onPressed: () {
                    print('Opção 2: Mudar Senha Clicado');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: textColor,
                    backgroundColor: cardBackground,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(
                    Icons.lock_outline,
                    color: secondaryAccent,
                  ), // Roxo secundário
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Mudar Senha', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
              // Sair da Conta
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {
                    _appCubit.logout();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: redColor, // Vermelho
                    backgroundColor: cardBackground,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(Icons.logout, color: redColor),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sair da Conta',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Leia nossos', style: TextStyle(color: Colors.white)),
              TextButton(
                child: Text(
                  'Termos de uso',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
