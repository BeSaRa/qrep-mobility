import 'package:ebla/app/routing_observer.dart';
import 'package:ebla/presentations/features/home/home_view.dart';
import 'package:ebla/presentations/features/info/blocs/about_bloc/about_bloc.dart';
import 'package:ebla/presentations/features/info/blocs/faq/faq_bloc.dart';
import 'package:ebla/presentations/features/info/blocs/laws_bloc/laws_bloc.dart';
import 'package:ebla/presentations/features/info/views/about_us_view.dart';
import 'package:ebla/presentations/features/info/views/faq_view.dart';
import 'package:ebla/presentations/features/info/views/laws_details_view.dart';
import 'package:ebla/presentations/features/main_scaffold.dart';
import 'package:ebla/presentations/features/more/more_view.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_bloc.dart';
import 'package:ebla/presentations/features/mortagage/mortgage_view.dart';
import 'package:ebla/presentations/features/rent/rent_view.dart';
import 'package:ebla/presentations/features/sell/sell_view.dart';
import 'package:ebla/presentations/features/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../app/depndency_injection.dart';
import '../features/main/blocs/lookup_bloc/lookup_bloc.dart';
import '../features/main/cubit/bottom_nav_cubit.dart';
import '../features/info/blocs/news_bloc/news_bloc.dart';
import '../features/info/views/laws_decisions_view.dart';
import '../features/info/views/news/news_item_view.dart';
import '../features/info/views/news/news_view.dart';
import '../features/rent/blocs/rent_bloc/rent_bloc.dart';
import '../features/sell/blocs/sell_bloc/sell_bloc.dart';

class RoutesNames {
  static const String splash = 'splash';
  static const String main = 'main';
  static const String home = 'home';
  static const String rent = 'rent';
  static const String sales = 'sales';
  static const String mortgage = 'mortgage';
  static const String more = 'more';
  static const String about = 'about';
  static const String laws = 'laws and decisions';
  static const String lawsDetails = 'laws details';
  static const String faq = 'FAQ';
  static const String news = 'news';
  static const String newsbyId = 'news item';
}

class RoutesPaths {
  static const String splash = '/';
  static const String main = '/main';
  static const String home = '/home';
  static const String rent = '/rent';
  static const String sales = '/sales';
  static const String mortgage = '/mortgage';
  static const String more = '/more';
  static const String about = '/about';
  static const String laws = '/laws&decisions';
  static const String lawsDetails = 'laws_details/:id';
  static const String faq = '/FAQ';
  static const String news = '/news';
  static const String newsbyId = '/news/:id';
}

class NavigationKeys {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final shellNavigatorKey = GlobalKey<NavigatorState>();
}

final RoutingObserver routingObserver = RoutingObserver();

class AppRouter {
  static final router = GoRouter(
      debugLogDiagnostics: true,
      observers: [routingObserver],
      navigatorKey: NavigationKeys.rootNavigatorKey,
      initialLocation: RoutesPaths.splash,
      routes: [
        ShellRoute(
          navigatorKey: NavigationKeys.shellNavigatorKey,
          // parentNavigatorKey: NavigationKeys.rootNavigatorKey,
          pageBuilder: (context, state, child) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1140),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => instance<BottomNavCubit>(),
                  ),
                  // BlocProvider(
                  //   create: (context) => instance<LookupBloc>(),
                  // ),
                ],
                child: MainScaffold(child: child),
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
          // builder: (context, state, child) {
          //   return MainScaffold(child: child);
          // },
          routes: [
            GoRoute(
                name: RoutesNames.home,
                path: RoutesPaths.home,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const HomeView(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc)
                            .animate(animation),
                        child: child,
                      );
                    },
                  );
                }),
            GoRoute(
              name: RoutesNames.rent,
              path: RoutesPaths.rent,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: BlocProvider(
                    create: (context) => instance<RentBloc>()
                      ..add(const RentEvent.getRentLookupEvent()),
                    child: const RentView(),
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
            GoRoute(
              name: RoutesNames.sales,
              path: RoutesPaths.sales,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: BlocProvider(
                    create: (context) => instance<SellBloc>()
                      ..add(const SellEvent.getSellLookupEvent()),
                    child: const SalesView(),
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
            GoRoute(
              name: RoutesNames.mortgage,
              path: RoutesPaths.mortgage,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: BlocProvider(
                    create: (context) => instance<MortgageBloc>()
                      ..add(const MortgageEvent.started()),
                    child: const MortgageView(),
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
            GoRoute(
              name: RoutesNames.more,
              path: RoutesPaths.more,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: const MoreView(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
        ),
        // StatefulShellRoute.indexedStac0k(
        //   pageBuilder: (context, state, navigationShell) {
        // return CustomTransitionPage(
        //   transitionDuration: const Duration(milliseconds: 1140),
        //   child: MainScaffold(
        //     navigationShell: navigationShell,
        //   ),
        //   transitionsBuilder:
        //       (context, animation, secondaryAnimation, child) {
        //     return SlideTransition(
        //       position: Tween<Offset>(
        //         begin: const Offset(0.0, -1.0),
        //         end: const Offset(0.0, 0.0),
        //       ).animate(
        //         CurvedAnimation(
        //           parent: animation,
        //           curve: const Cubic(0.74, 0.01, 0.01, 0.98),
        //         ),
        //       ),
        //       child: child,
        //     );
        //   },
        // );
        //   },
        //   branches: [
        //     StatefulShellBranch(routes: [
        //       GoRoute(
        //         path: RoutesPaths.home,
        //         name: RoutesNames.home,
        //         // parentNavigatorKey: GlobalKey(),
        //         pageBuilder: (context, state) {
        //           initHomeModule();

        // return CustomTransitionPage(
        //   transitionDuration: const Duration(milliseconds: 1140),
        //   child: const HomeView(),
        //   transitionsBuilder:
        //       (context, animation, secondaryAnimation, child) {
        //     return SlideTransition(
        //       position: Tween<Offset>(
        //         begin: const Offset(0.0, -1.0),
        //         end: const Offset(0.0, 0.0),
        //       ).animate(
        //         CurvedAnimation(
        //           parent: animation,
        //           curve: const Cubic(0.74, 0.01, 0.01, 0.98),
        //         ),
        //       ),
        //       child: child,
        //     );
        //   },
        // );
        //         },
        //       ),
        //     ]),
        //     StatefulShellBranch(routes: [
        //       GoRoute(
        //         path: RoutesPaths.rent,
        //         name: RoutesNames.rent,
        //         builder: (context, state) {
        // initRentModule();
        // return BlocProvider(
        //   create: (context) => instance<RentBloc>()
        //     ..add(const RentEvent.getRentLookupEvent()),
        //   child: const RentView(),
        // );
        //         },
        //       ),
        //     ]),
        //     StatefulShellBranch(routes: [
        //       GoRoute(
        //           path: RoutesPaths.sales,
        //           name: RoutesNames.sales,
        //           builder: (context, state) {
        // initSellModule();
        // return BlocProvider(
        //   create: (context) => instance<SellBloc>()
        //     ..add(const SellEvent.getSellLookupEvent()),
        //   child: const SalesView(),
        // );
        //           }),
        //     ]),
        //     StatefulShellBranch(routes: [
        //       GoRoute(
        //           path: RoutesPaths.mortgage,
        //           name: RoutesNames.mortgage,
        //           builder: (context, state) {
        // initMortgageModule();
        // return BlocProvider(
        //   create: (context) => instance<MortgageBloc>()
        //     ..add(const MortgageEvent.started()),
        //   child: const MortgageView(),
        // );
        //           }),
        //     ]),
        //     StatefulShellBranch(routes: [
        //       GoRoute(
        //           path: RoutesPaths.more,
        //           name: RoutesNames.more,
        //           builder: (context, state) {
        // initLoginModule();
        // return const MoreView();
        //           }),
        //     ]),
        //   ],
        // ),
        GoRoute(
          parentNavigatorKey: NavigationKeys.rootNavigatorKey,
          name: RoutesNames.about,
          path: RoutesPaths.about,
          builder: (context, state) => BlocProvider(
            create: (context) =>
                instance<AboutBloc>()..add(const AboutEvent.getAbout()),
            child: const AboutUsView(),
          ),
        ),
        GoRoute(
            parentNavigatorKey: NavigationKeys.rootNavigatorKey,
            name: RoutesNames.laws,
            path: RoutesPaths.laws,
            builder: (context, state) => BlocProvider(
                  create: (context) =>
                      instance<LawsBloc>()..add(const LawsEvent.getLaws()),
                  child: const LawsDecisionsView(),
                ),
            routes: [
              GoRoute(
                parentNavigatorKey: NavigationKeys.rootNavigatorKey,
                name: RoutesNames.lawsDetails,
                path: RoutesPaths.lawsDetails,
                builder: (context, state) {
                  // be careful when using state.extra because it might be _Map<String, dynamic> when pressing 'i' to inspect widgets
                  // because of issue: https://github.com/flutter/flutter/issues/99099
                  // if (state.extra is LawsModel) {
                  //   return LawsDetailsView(
                  //     law: state.extra as LawsModel,
                  //   );
                  // }
                  return BlocProvider(
                    create: (context) => instance<LawsBloc>(),
                    child: LawsDetailsView(
                        id: int.tryParse(state.pathParameters['id'] ?? '1') ??
                            1),
                  );
                },
              ),
            ]),
        GoRoute(
          parentNavigatorKey: NavigationKeys.rootNavigatorKey,
          name: RoutesNames.faq,
          path: RoutesPaths.faq,
          builder: (context, state) => BlocProvider(
            create: (context) =>
                instance<FaqBloc>()..add(const FaqEvent.getFaq()),
            child: const FAQView(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: NavigationKeys.rootNavigatorKey,
          name: RoutesNames.news,
          path: RoutesPaths.news,
          builder: (context, state) => BlocProvider.value(
            value: state.extra! as NewsBloc,
            child: const NewsView(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: NavigationKeys.rootNavigatorKey,
          name: RoutesNames.newsbyId,
          path: RoutesPaths.newsbyId,
          builder: (context, state) => BlocProvider.value(
            value: state.extra! as NewsBloc,
            child: NewsItemView(
              id: int.parse(state.pathParameters['id'] ?? '0'),
            ),
          ),
        ),
        GoRoute(
          name: RoutesNames.splash,
          path: RoutesPaths.splash,
          builder: (context, state) => const SplashView(),
        ),
      ]);
}
