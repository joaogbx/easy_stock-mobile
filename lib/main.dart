import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/network/network_module.dart';
import 'package:easy_stock/app/shared/theme/theme.dart';
import 'package:easy_stock/app/features/auth/utils/auth_interceptor.dart';
import 'package:easy_stock/app/features/home/admin/home/home_admin_screen.dart';
import 'package:easy_stock/app/features/home/employee/home/home_employee.dart';
import 'package:easy_stock/app/features/auth/presentation/login/login_screen.dart';
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
      home: LoginScreen(),
    );
  }
}
