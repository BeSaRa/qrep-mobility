import 'package:ebla/presentations/features/home/home_view.dart';
import 'package:ebla/presentations/features/main_scaffold.dart';
import 'package:ebla/presentations/features/more/more_view.dart';
import 'package:ebla/presentations/features/mortagage/mortgage_view.dart';
import 'package:ebla/presentations/features/rent/rent_view.dart';
import 'package:ebla/presentations/features/sell/sell_view.dart';
import 'package:ebla/presentations/features/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/depndency_injection.dart';
import '../features/rent/blocs/rent_bloc/rent_bloc.dart';

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
          pageBuilder: (context, state, navigationShell) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1140),
              child: MainScaffold(
                navigationShell: navigationShell,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, -1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: const Cubic(0.74, 0.01, 0.01, 0.98),
                    ),
                  ),
                  child: child,
                );
              },
            );
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutesPaths.home,
                name: RoutesNames.home,
                // parentNavigatorKey: GlobalKey(),
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    transitionDuration: const Duration(milliseconds: 1140),
                    child: BlocProvider(
                      create: (context) => instance<RentBloc>()
                        ..add(const RentEvent.getRentLookupEvent()),
                      child: const HomeView(),
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.0, -1.0),
                          end: const Offset(0.0, 0.0),
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: const Cubic(0.74, 0.01, 0.01, 0.98),
                          ),
                        ),
                        child: child,
                      );
                    },
                  );
                },
                // builder: (context, state) {
                //   return BlocProvider(
                //     create: (context) => instance<RentBloc>()
                //       ..add(const RentEvent.getRentLookupEvent()),
                //     child: const HomeView(),
                //   );
                // },
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: RoutesPaths.rent,
                name: RoutesNames.rent,
                builder: (context, state) => BlocProvider(
                  create: (context) => instance<RentBloc>()
                    ..add(const RentEvent.getRentLookupEvent()),
                  child: const RentView(),
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
