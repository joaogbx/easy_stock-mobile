import 'package:easy_stock/app/shared/theme/colors_pallete.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // 1. CORES E BRILHO
    // Esta é a configuração mais importante.
    // Ao definir o brilho como 'dark', o Flutter automaticamente
    // assume que o texto padrão deve ser BRANCO.
    // Isto resolve o teu requisito de "cor padrão dos textos tem que ser branca"
    // e permite-te remover a maioria das definições manuais de cor.
    brightness: Brightness.dark,

    // Cores principais
    primaryColor: ColorsPallete.primaryPurple,
    scaffoldBackgroundColor: ColorsPallete.darkBackground,

    // Cores de destaque e erros

    // 2. TEMA DE TEXTOS (TextTheme)
    // Define os estilos de texto padrão para a aplicação.
    // Agora não precisas de definir 'color: Colors.white' manualmente.
    textTheme: const TextTheme(
      // Usado para "Easy Stock" na tela de login
      displaySmall: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      // Usado para "Nome do usuario"
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      // Usado para títulos de secção "Ações Rápidas", "Consultas"
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      // Usado para o título do ListTile ("Arroz", "Leite")
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      // Usado para texto de corpo padrão
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      // Usado para "Funcionario"
      bodyMedium: TextStyle(fontSize: 15, color: Colors.white),
      // Usado para subtítulos de ListTile ("22/10 | Saída")

      // Usado para texto dentro de botões
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    // 3. TEMA DE INPUTS (InputDecorationTheme)
    // Define o estilo padrão para TextFormField e TextField.
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(
        255,
        35,
        35,
        35,
      ), // Cor de fundo do input (cinza escuro)
      hintStyle: const TextStyle(
        color: Color.fromARGB(174, 255, 255, 255),
      ), // Cor do texto 'hint' (branco suave)
      // Cor do texto que o utilizador digita
      // O input usa o TextTheme, mas podemos forçar aqui se necessário.
      // No entanto, 'brightness: Brightness.dark' já deve tratar disto.

      // Estilo do prefixo (ícones, etc.)

      // Bordas (como já definido)
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: ColorsPallete.primaryPurple, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: ColorsPallete.colorError, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: ColorsPallete.colorError, width: 2),
      ),
      errorStyle: TextStyle(
        color: ColorsPallete.colorError,
      ), // Cor da mensagem de erro
    ),

    // 4. TEMA DE BOTÕES (ButtonThemes)
    // --- ElevatedButton (Botão "Entrar") ---
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsPallete.primaryPurple, // Fundo roxo
        foregroundColor: Colors.white, // Texto branco
        minimumSize: const Size(double.infinity, 50), // Altura 50
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // --- TextButton (Botão "Admin", "Esqueceu a senha?", "Crie agora") ---
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, // Cor do texto padrão
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // --- IconButton (Botão "Settings") ---
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),

    // 5. TEMAS DE OUTROS WIDGETS
    // --- Cor dos ícones padrão ---
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    // --- Configurações (BottomSheet) ---
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorsPallete.darkBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    ),

    // --- RefreshIndicator ---

    // --- ListTile (Histórico) ---

    // --- AppBar (caso venhas a usar) ---
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsPallete.darkBackground,
      elevation: 0,
      foregroundColor: Colors.white, // Cor dos ícones e texto
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  // --- Card (base para CardActionWidget) --
}
