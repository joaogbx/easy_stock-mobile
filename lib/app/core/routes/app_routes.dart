import 'dart:async';

import 'package:easy_stock/app/core/config/injection.dart';
import 'package:easy_stock/app/core/cubit/app_cubit.dart';
import 'package:easy_stock/app/features/home/admin/presentation/home_admin_screen.dart';
import 'package:easy_stock/app/features/home/employee/presentation/home_employee.dart';
import 'package:easy_stock/app/features/product/presentation/product_management_screen/product_management_screen.dart';
import 'package:easy_stock/app/features/stock/presentation/stock_screen.dart';
import 'package:easy_stock/app/shared/components/dialog_feedback.dart';
import 'package:easy_stock/app/shared/screen/movements_screen/movements_screen.dart';
import 'package:easy_stock/app/shared/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login/login_screen.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String homeAdmin = '/home-admin';
  static const String homeEmploye = '/home-employe';

  // IMPORTANTE: Rotas filhas no GoRouter não devem começar com "/" se forem relativas
  static const String movements = '/movements';
  static const String managementProduct = '/management-product';
  static const String productStock = '/product-stock';

  static final router = GoRouter(
    initialLocation: splash,
    refreshListenable: GoRouterRefreshStream(getIt<AppCubit>().stream),
    redirect: (context, state) {
      final appState = getIt<AppCubit>().state;

      if (appState.loading) return splash;
      if (appState.userlogged == null) return login;

      // Se logado e tentando ir para Splash ou Login, redireciona para a Home correta
      if (state.matchedLocation == splash || state.matchedLocation == login) {
        return appState.userlogged?.role == 'ADMIN' ? homeAdmin : homeEmploye;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const MyCustomSplashScreen(),
      ),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: homeAdmin, builder: (context, state) => const HomeAdmin()),
      GoRoute(
        path: homeEmploye,
        builder: (context, state) => HomeEmployee(onToggle: () => null),
      ),

      // COLOQUE AS ROTAS AQUI FORA (Nível superior)
      GoRoute(
        path: movements,
        builder: (context, state) => const HistoricalMovementScreen(),
      ),
      GoRoute(
        path: managementProduct,
        builder: (context, state) => ProductManagementScreen(),
      ),
      GoRoute(
        path: productStock,
        builder: (context, state) => StockScreen(),
      ),
    ],
  );
}
