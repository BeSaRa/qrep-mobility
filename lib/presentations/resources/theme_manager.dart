import 'package:ebla/presentations/widgets/range_slider_widget.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'values_manager.dart';

class FontConstants {
  static const String fontFamily = "Lusail";
}

ThemeData lightTheme() {
  return ThemeData(
    // colorSchemeSeed: const Color(0xFF8A1538),
    colorScheme: ColorScheme.light(
      primary: ColorManager.primary,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorManager.primary,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
    sliderTheme: SliderThemeData(
      rangeTrackShape: CustomRangeSliderTrackShape(
          mainTrackHeight: AppSizeH.s1,
          rangeTrackHeight: AppSizeH.s4,
          betweenThumbsColor: ColorManager.golden),
      thumbColor: ColorManager.white,
      disabledThumbColor: ColorManager.white,
      trackHeight: AppSizeH.s10,
      rangeThumbShape: CustomThumbShape(
          borderColor: ColorManager.golden,
          borderThickness: 2,
          thumbRadius: AppSizeR.s6),
      activeTrackColor: ColorManager.golden,
      inactiveTrackColor: ColorManager.lightSilver,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.white,
      elevation: 0,
      showDragHandle: true,
      modalElevation: 0,
      modalBackgroundColor: ColorManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(AppSizeR.s30),
            topEnd: Radius.circular(AppSizeR.s30)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(ColorManager.white),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.white,
          fontSize: AppSizeSp.s16,
          fontWeight: FontWeight.w400,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(ColorManager.primary),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSizeR.s5),
          ),
        ),
      ),
    )),
    iconTheme: IconThemeData(color: ColorManager.primary),
    scaffoldBackgroundColor: const Color(0xFFF9F9F9),
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
      displayMedium: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorManager.white,
          fontSize: AppSizeSp.s33,
          fontWeight: FontWeight.w700),
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
      // colorSchemeSeed: const Color(0xFF8A1538),
      colorScheme: ColorScheme.dark(
        primary: ColorManager.primary,
        brightness: Brightness.dark,
      ),
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(ColorManager.white),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s16,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(ColorManager.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizeR.s5),
            ),
          ),
        ),
      )),
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
