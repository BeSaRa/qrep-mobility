// ignore_for_file: non_constant_identifier_names

import 'package:ebla/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentations/resources/language_manager.dart';
import '../presentations/resources/theme_manager.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
  String PREFS_KEY_TOKEN = 'PREFS_KEY_TOKEN';
  String PREFS_KEY_CMS_TOKEN = 'PREFS_KEY_CMS_TOKEN';
  String PREFS_KEY_REFRESH_TOKEN = 'PREFS_KEY_REFRESH_TOKEN';
  String PREFS_KEY_THEME = 'PREFS_KEY_THEME';
  String PREFS_KEY_FACE_ID = 'PREFS_KEY_FACE';
  String PREFS_KEY_IS_LOGGED_IN = 'PREFS_KEY_IS_LOGGED_IN';
  String PREFS_KEY_LOCALIZATIONS_LAST_UPDATE =
      'PREFS_KEY_LOCALIZATIONS_LAST_UPDATE';

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG) ?? '';
    if (language.isNotEmpty) {
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

  Future<DateTime?> getLocalizationsLastUpdate() async {
    String dateString =
        _sharedPreferences.getString(PREFS_KEY_LOCALIZATIONS_LAST_UPDATE) ?? '';
    DateTime? date = DateTime.tryParse(dateString);
    return date;
  }

  Future<void> setLocalizationsLastUpdate({required DateTime date}) async {
    _sharedPreferences.setString(
        PREFS_KEY_LOCALIZATIONS_LAST_UPDATE, date.toString());
  }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<void> setUserRefreshToken(String refreshToken) async {
    _sharedPreferences.setString(PREFS_KEY_REFRESH_TOKEN, refreshToken);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? Constant.guestToken;
  }

  String getUserRefreshToken() {
    return _sharedPreferences.getString(PREFS_KEY_REFRESH_TOKEN) ?? '';
  }

  Future<void> setCmsUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_CMS_TOKEN, token);
  }

  Future<String> getCmsUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_CMS_TOKEN) ??
        Constant.guestToken;
  }

  Future<void> setUserFaceId(bool val) async {
    _sharedPreferences.setBool(PREFS_KEY_FACE_ID, val);
  }

  bool getUserFaceId() {
    return _sharedPreferences.getBool(PREFS_KEY_FACE_ID) ?? true;
  }

  Future<void> setUserLoggedIn(bool val) async {
    _sharedPreferences.setBool(PREFS_KEY_IS_LOGGED_IN, val);
  }

  bool getUserLoggedIn() {
    return _sharedPreferences.getBool(PREFS_KEY_IS_LOGGED_IN) ?? false;
  }

//zak
  ThemeData getTheme() {
    String? theme = _sharedPreferences.getString(PREFS_KEY_THEME);
    if (theme == null) {
      // No saved theme, follow system brightness
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      //     final systemTheme = brightness == Brightness.dark ? ThemeDataType.dark.toString() : ThemeDataType.light.toString();
      // _sharedPreferences.setString(PREFS_KEY_THEME, systemTheme);
      return brightness == Brightness.dark ? darkTheme() : lightTheme();
    } else if (theme == ThemeDataType.dark.toString()) {
      return darkTheme();
    } else {
      return lightTheme();
    }
  }

  // ThemeData getTheme() {
  //   String? theme = _sharedPreferences.getString(PREFS_KEY_THEME);
  //   if (theme == ThemeDataType.dark.toString()) {
  //     return darkTheme();
  //   } else {
  //     return lightTheme();
  //   }
  // }

  setTheme({required ThemeData themeData}) {
    _sharedPreferences.setString(PREFS_KEY_THEME, themeData.getValue());
  }
}
