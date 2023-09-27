import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentations/resources/routes_manager.dart';
import '../presentations/resources/theme_cubit.dart';
import '../presentations/resources/theme_manager.dart';
import 'app_preferences.dart';
import 'depndency_injection.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>with WidgetsBindingObserver {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  late final CurrentThemeCubit themeCubit;
  var auto = ThemeDataObject();

  @override
  void initState() {
    auto.themeName = ThemeName.light;
    auto.firstTheme = lightTheme();
    auto.secondaryTheme = darkTheme();
    auto.themeMode = ThemeMode.light;
    auto.themeType = ThemeType.light;


    WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);
    themeCubit = CurrentThemeCubit(auto);
    // ignore: deprecated_member_use
    var window = WidgetsBinding.instance.window;
    // themeCubit.changeTheme(ThemeType.light);
    window.onPlatformBrightnessChanged = () {
      if (themeCubit.state.themeType == ThemeType.auto) {
        ThemeDataObject themes = ThemeDataObject();
        themes.firstTheme = themeCubit.firstTheme;
        themes.secondaryTheme = themeCubit.secondaryTheme;
        themes.themeName = themeCubit.getThemeName();
        themes.themeMode = themeCubit.state.themeMode;
        // ColorSchemeExtension.theme =
        //     themes.themeName.toString().replaceFirst(RegExp('ThemeName.'), '');
        // ImageAssets.theme =
        //     themes.themeName.toString().replaceFirst(RegExp('ThemeName.'), '');
      }
    };
    super.initState();
  }
  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) => MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'x-tech',
        theme: themeCubit.state.firstTheme,
        darkTheme: themeCubit.state.secondaryTheme,
        themeMode: themeCubit.state.themeMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
