import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/auth/logged_in_user_cubit.dart';
import 'package:ebla/presentations/features/main/blocs/main_menu_bloc/main_menu_bloc.dart';
import 'package:ebla/presentations/features/main/cubit/bottom_nav_cubit.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentations/features/main/blocs/lookup_bloc/lookup_bloc.dart';
import '../presentations/features/more/blocs/user_bloc/user_bloc.dart';
import '../utils/global_functions.dart';
import 'app_preferences.dart';
import 'depndency_injection.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => instance<LookupBloc>(),
        ),
        BlocProvider(
          create: (context) => instance<MainMenuBloc>(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => instance<UserBloc>(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => instance<BottomNavCubit>(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => instance<LoggedInUserCubit>(),
          lazy: true,
        ),
      ],
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: MediaQuery.of(context).textScaler == TextScaler.noScaling
              ? TextScaler.linear(isTablet ? 1.5 : 1.0)
              : getScalarRatio(),
        ),
        child: ScreenUtilInit(
          designSize: isTablet ? const Size(1194, 834) : const Size(390, 844),
          minTextAdapt: false,
          splitScreenMode: false,
          builder: (context, child) => ThemeProvider(
            initTheme: instance<AppPreferences>().getTheme(),
            builder: (p0, theme) => GestureDetector(
              behavior: HitTestBehavior.opaque, // allows taps on empty space
              onTap: () {
                FocusScope.of(context).unfocus(); // dismiss the keyboard
              },
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                title: 'Real State Qatar',
                themeMode: theme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
                theme: theme,
                //zak
                // routerConfig: AppRouter.router,
                routerDelegate: AppRouter.router.routerDelegate,
                routeInformationParser: AppRouter.router.routeInformationParser,
                routeInformationProvider:
                    AppRouter.router.routeInformationProvider,
                backButtonDispatcher: RootBackButtonDispatcher(), // ✅ allows WillPopScope to work
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextScaler getScalarRatio() {
    TextScaler scalar = MediaQuery.of(context).textScaler;
    String scaleString = scalar.toString();

    // Extract the scale factor using a regular expression
    RegExp regex = RegExp(r'linear \(([\d.]+)x\)');
    Match? match = regex.firstMatch(scaleString);

    if (match != null) {
      String scaleFactorString = match.group(1)!;
      double scaleFactor = double.parse(scaleFactorString);

      if (scaleFactor < 1.0) {
        return TextScaler.linear(isTablet ? 1.5 : 1.0);
      } else {
        return TextScaler.linear(isTablet ? 1.6 : 1.15);
      }
    } else {
      // Handle cases where the scale factor cannot be extracted
      return TextScaler.linear(isTablet ? 1.5 : 1.0); // Or a default value
    }
  }
}
