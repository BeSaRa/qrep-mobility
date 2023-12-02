import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/features/auth/blocs/cubits/logged_in_user_cubit.dart';
import 'package:ebla/presentations/features/main/blocs/main_menu_bloc/main_menu_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentations/features/main/blocs/lookup_bloc/lookup_bloc.dart';
import '../presentations/features/more/blocs/user_bloc/user_bloc.dart';
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
          create: (context) => instance<LoggedInUserCubit>(),
          lazy: true,
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) => ThemeProvider(
          initTheme: instance<AppPreferences>().getTheme(),
          builder: (p0, theme) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Real State Qatar',
            themeMode: theme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            theme: theme,
            routerConfig: AppRouter.router,
          ),
        ),
      ),
    );
  }
}
