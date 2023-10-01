// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentations/resources/language_manager.dart';
import '../presentations/resources/theme_manager.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
  String PREFS_KEY_TOKEN = 'PREFS_KEY_TOKEN';
  // String PREFS_KEY_USER_THEME = "Prefs_key_user_theme";
  String PREFS_KEY_THEME = 'PREFS_KEY_THEME';

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ARABIC.getValue();
    }
  }

  Future<void> setAppLanguage({required String lang}) async {
    String currentLanguage = await getAppLanguage();
    if (lang == currentLanguage) {
    } else {
      _sharedPreferences.setString(PREFS_KEY_LANG, lang);
    }
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();

    if (currentLanguage == LanguageType.ENGLISH.getValue()) {
      return ENGLISH_LOCAL;
    } else {
      return ARABIC_LOCAL;
    }
  }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? '';
  }

  ///theme
  // Future<void> setUserTheme(int token) async {
  //   _sharedPreferences.setInt(PREFS_KEY_USER_THEME, token);
  // }

  ThemeData getTheme() {
    String? theme = _sharedPreferences.getString(PREFS_KEY_THEME);
    if (theme == ThemeDataType.dark.toString()) {
      return darkTheme();
    } else {
      return lightTheme();
    }
  }

  setTheme({required ThemeData themeData}) {
    _sharedPreferences.setString(PREFS_KEY_THEME, themeData.getValue());
  }

  // Future<ThemeType> getUserTheme() async {
  //   int themeNum = _sharedPreferences.getInt(PREFS_KEY_USER_THEME) ?? 0;

  //   switch (themeNum) {
  //     case 1:
  //       {
  //         return ThemeType.auto;
  //       }
  //     case 2:
  //       {
  //         return ThemeType.dark;
  //       }
  //     case 3:
  //       {
  //         return ThemeType.light;
  //       }
  //     case 0:
  //       {
  //         return ThemeType.light;
  //       }
  //   }

  //   return ThemeType.light;
  // }
}
