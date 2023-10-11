import 'package:ebla/presentations/features/home/home_view.dart';
import 'package:ebla/presentations/features/main_scaffold.dart';
import 'package:ebla/presentations/features/more/more_view.dart';
import 'package:ebla/presentations/features/mortagage/mortgage_view.dart';
import 'package:ebla/presentations/features/rent/rent_view.dart';
import 'package:ebla/presentations/features/sell/sell_view.dart';
import 'package:ebla/presentations/features/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesNames {
  static const String splash = 'splash';
  static const String main = 'main';
  static const String home = 'home';
  static const String rent = 'rent';
  static const String sales = 'sales';
  static const String mortgage = 'mortgage';
  static const String more = 'more';
}

class RoutesPaths {
  static const String splash = '/';
  static const String main = '/main';
  static const String home = '/home';
  static const String rent = '/rent';
  static const String sales = '/sales';
  static const String mortgage = '/mortgage';
  static const String more = '/more';
}

class NavigationKeys {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
}

class AppRouter {
  static final router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: NavigationKeys.rootNavigatorKey,
      initialLocation: RoutesPaths.splash,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainScaffold(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutesPaths.home,
                name: RoutesNames.home,
                builder: (context, state) => const HomeView(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutesPaths.rent,
                name: RoutesNames.rent,
                builder: (context, state) => RentView(
                  key: UniqueKey(),
                ),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutesPaths.sales,
                name: RoutesNames.sales,
                builder: (context, state) => const SalesView(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutesPaths.mortgage,
                name: RoutesNames.mortgage,
                builder: (context, state) => const MortgageView(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutesPaths.more,
                name: RoutesNames.more,
                builder: (context, state) => const MoreView(),
              ),
            ]),
          ],
        ),
        GoRoute(
          name: RoutesNames.splash,
          path: RoutesPaths.splash,
          builder: (context, state) => const SplashView(),
        ),
      ]);
}
