import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'values_manager.dart';

class FontConstants {
  static const String fontFamily = "NotoSans";
}

ThemeData lightTheme() {
  return ThemeData(
    colorSchemeSeed: const Color(0xFF8A1538),
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.primary,
          fontSize: AppSizeSp.s20,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.primary,
          fontSize: AppSizeSp.s16,
          fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.golden,
          fontSize: AppSizeSp.s13,
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.primary,
          fontSize: AppSizeSp.s23,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.cloudyGrey,
          fontSize: AppSizeSp.s13,
          fontWeight: FontWeight.w700),
      bodyLarge: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.black,
          fontSize: AppSizeSp.s23,
          fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.black,
          fontSize: AppSizeSp.s13,
          fontWeight: FontWeight.w700),
      bodySmall: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.black,
          fontSize: AppSizeSp.s14,
          fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.black,
          fontSize: AppSizeSp.s16,
          fontWeight: FontWeight.w400),
      labelSmall: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.darkGrey,
          fontSize: AppSizeSp.s13,
          fontWeight: FontWeight.w400),
      displaySmall: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.white,
          fontSize: AppSizeSp.s16,
          fontWeight: FontWeight.w400),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
      colorSchemeSeed: const Color(0xFF8A1538),
      brightness: Brightness.dark,
      useMaterial3: true);
}

enum ThemeDataType { light, dark }

extension ThemeDataValueExtension on ThemeData {
  String getValue() {
    if (isDarkTheme) {
      return ThemeDataType.dark.toString();
    } else {
      return ThemeDataType.light.toString();
    }
  }
}

extension ThemeDataTypeExtension on ThemeData {
  bool get isDarkTheme {
    return brightness == Brightness.dark;
  }
}
