import 'package:ebla/presentations/features/main_scaffold.dart';
import 'package:ebla/presentations/features/splash_screen/splash_view.dart';
import 'package:go_router/go_router.dart';



class RoutesNames {
  static const String splashRoute = 'splash';
  static const String homeRoute = 'home';
}

class RoutesPaths {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
}

class AppRouter {
  static final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutesPaths.splashRoute,
      routes: [
        // GoRoute(
        //   name: RoutesNames.splashRoute,
        //   path: RoutesPaths.splashRoute,
        //   builder: (context, state) => const HomeView(),
        // ),
        GoRoute(
          name: RoutesNames.splashRoute,
          path: RoutesPaths.splashRoute,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          name: RoutesNames.homeRoute,
          path: RoutesPaths.homeRoute,
          builder: (context, state) => const MainScaffold(),
        )
      ]);
}
