import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/features/auth/presentation/login/login_screen.dart';
import 'package:easy_stock/app/features/user/presentation/edit_user_bottom_sheet/edit_user_bottom_sheet.dart';
import 'package:flutter/material.dart';

// Constantes de estilo centralizadas
const kPrimaryDark = Color(0xFF141414);
const kAccentColor = Color(0xFF6F00FF);
const kSecondaryAccent = Color(0xFF9E00FF);
const kRedColor = Color(0xFFDC3545);
const kCardBackground = Color(0xFF2C2C2C);

class UserConfigSheet extends StatelessWidget {
  const UserConfigSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = getIt<AppCubit>();
    final user = appCubit.state.userlogged!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 30, 22, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Otimiza espaço para BottomSheet
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionHeader(title: 'Informações do Usuário'),
          const SizedBox(height: 15),

          // Bloco de Perfil
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kCardBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kAccentColor.withOpacity(0.1),
                  child: const Icon(
                    Icons.person_outline,
                    size: 35,
                    color: kAccentColor,
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      user.role.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),
          _ActionButton(
            label: 'Editar Perfil',
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return UserEditBottomSheet(
                  currentEmail: 'teste',
                  currentName: 'dads',
                );
              },
            ),
            color: kAccentColor,
          ),

          const SizedBox(height: 30),
          const _SectionHeader(title: 'Configurações da Conta'),
          const SizedBox(height: 15),

          _MenuOption(
            label: 'Mudar Senha',
            icon: Icons.lock_outline,
            iconColor: kSecondaryAccent,
            onPressed: () => print('Mudar Senha'),
          ),

          const SizedBox(height: 10),
          _MenuOption(
            label: 'Sair da Conta',
            icon: Icons.logout,
            iconColor: kRedColor,
            textColor: kRedColor,
            onPressed: () {
              appCubit.logout();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

// --- Sub-widgets para Otimização ---

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const _ActionButton({
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _MenuOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onPressed;

  const _MenuOption({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: kCardBackground,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.centerLeft,
        ),
        icon: Icon(icon, color: iconColor),
        label: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
