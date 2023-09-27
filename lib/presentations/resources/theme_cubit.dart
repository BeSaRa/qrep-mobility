
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:ebla/presentations/resources/theme_manager.dart';
import 'package:flutter/material.dart';


import '../../app/app_preferences.dart';
import '../../app/depndency_injection.dart';

enum ThemeType {
  auto,
  dark,
  light,
} //1 for auto,2 for dark ,3 for light

enum ThemeName { dark, light } //1 for auto,2 for dark ,3 for light

class ThemeDataObject {
  ThemeData firstTheme = lightTheme();
  ThemeData secondaryTheme = darkTheme();
  ThemeMode themeMode = ThemeMode.system;
  ThemeName themeName = ThemeName.light;
  ThemeType themeType = ThemeType.auto;
}

class CurrentThemeCubit extends Cubit<ThemeDataObject> {
  ThemeData firstTheme = lightTheme();
  ThemeData secondaryTheme = darkTheme();

  CurrentThemeCubit(ThemeDataObject initialState) : super(initialState);

  Future<void> changeTheme(ThemeType theme) async {
    final AppPreferences appPreferences = instance<AppPreferences>();
    ThemeDataObject themes = ThemeDataObject();
    switch (theme) {
      case ThemeType.dark:
        {
          themes.firstTheme = darkTheme();
          themes.secondaryTheme = darkTheme();
          themes.themeMode = ThemeMode.dark;
          themes.themeName = ThemeName.dark;
          themes.themeType = ThemeType.dark;
          firstTheme = darkTheme();
          secondaryTheme = darkTheme();
          // ColorSchemeExtension.theme = 'dark';
          // ImageAssets.theme = 'dark';

          emit(themes);
          appPreferences.setUserTheme(2);
        }
        break;
      case ThemeType.auto:
        {
          var brightness = PlatformDispatcher.instance.platformBrightness;
          // SchedulerBinding.instance.window.platformBrightness;
          bool isDarkMode = brightness == Brightness.dark;
          if (isDarkMode) {
            themes.firstTheme = lightTheme();
            themes.secondaryTheme = darkTheme();
            themes.themeMode = ThemeMode.system;
            themes.themeName = ThemeName.dark;
            themes.themeType = ThemeType.auto;

            // this.firstTheme = lightTheme;
            // this.secendryTheme = darkTheme;
            // ColorSchemeExtension.theme = themes;

            // ColorSchemeExtension.theme = 'dark';
            // ImageAssets.theme = 'dark';

            emit(themes);
          } else {
            themes.firstTheme = lightTheme();
            themes.secondaryTheme = darkTheme();
            themes.themeMode = ThemeMode.system;
            themes.themeName = ThemeName.light;
            themes.themeType = ThemeType.auto;
            // ColorSchemeExtension.theme = themes;
            // ColorSchemeExtension.theme = 'light';
            // ImageAssets.theme = 'light';

            emit(themes);
          }
          appPreferences.setUserTheme(1);
        }
        break;
      case ThemeType.light:
        {
          themes.firstTheme = lightTheme();
          themes.secondaryTheme = lightTheme();
          themes.themeMode = ThemeMode.light;
          themes.themeName = ThemeName.light;
          themes.themeType = ThemeType.light;
          // ColorSchemeExtension.theme = themes;
          // ColorSchemeExtension.theme = 'light';
          // ImageAssets.theme = 'light';

          emit(themes);
          appPreferences.setUserTheme(3);
        }
        break;
    }
    // emit(null);
  }

  ThemeName getThemeName() {
    var brightness = PlatformDispatcher.instance.platformBrightness;
    // SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return ThemeName.dark;
    }
    return ThemeName.light;
  }
}
