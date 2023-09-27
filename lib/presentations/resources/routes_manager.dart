import 'package:go_router/go_router.dart';


import '../home/home_view.dart';

class RoutesNames {
  static const String splashRoute = '/';
}

class RoutesPaths {
  static const String splashRoute = '/';
}

class AppRouter {
  static final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutesPaths.splashRoute,
      routes: [
        GoRoute(
          name: RoutesNames.splashRoute,
          path: RoutesPaths.splashRoute,
          builder: (context, state) => const HomeView(),
        )
      ]);
}
