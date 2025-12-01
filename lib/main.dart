import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/network/network_module.dart';
import 'package:easy_stock/app/core/ui/theme/theme.dart';
import 'package:easy_stock/app/core/utils/auth_interceptor.dart';
import 'package:easy_stock/app/ui/admin/home/home_admin_screen.dart';
import 'package:easy_stock/app/ui/employee/home/home_employee.dart';
import 'package:easy_stock/app/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
    debugPrint('⚠️ FlutterError capturado: ${details.exception}');
  };

  runZonedGuarded(
    () => runApp(MyApp()),
    (error, stack) {
      debugPrint('🔥 Erro não tratado: $error');
      debugPrint('📍 StackTrace: $stack');
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Estoque Fácil',
      theme: getAppTheme(),
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  @override
  createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  // Alterado para iniciar como Funcionário para fins de teste rápido
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
      //HomeEmploye()
    );
  }
}
