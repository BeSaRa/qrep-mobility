import 'package:ebla/presentations/widgets/range_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_manager.dart';
import 'values_manager.dart';

class FontConstants {
  static const String fontFamily = "Lusail";
}

ThemeData lightTheme() {
  return ThemeData(
    // colorSchemeSeed: const Color(0xFF8A1538),
      primaryColor: ColorManager.primary,
      cardTheme: CardTheme(color: ColorManager.white),
      cardColor: ColorManager.cloudyGrey,
      colorScheme: ColorScheme.light(
          primary: ColorManager.primary,
          brightness: Brightness.light,
          surfaceVariant: Colors.transparent,
          secondary: ColorManager.mercury,
          onSecondary: ColorManager.primary,
          tertiaryContainer: ColorManager.white,
          onSurface: ColorManager.textBlack,
          onTertiaryContainer: ColorManager.silver,
          tertiary: ColorManager.golden,
          secondaryContainer: ColorManager.lightBlue,
          onSecondaryContainer: ColorManager.platinum,
          onTertiary: ColorManager.grey,
          shadow: ColorManager.grey,
          onBackground: Hex16Color.fromHex('#FFE5FE')),
      shadowColor: ColorManager.grey,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.white,
          selectedIconTheme: IconThemeData(color: ColorManager.primary),
          unselectedIconTheme: IconThemeData(color: ColorManager.lightSilver),
          selectedLabelStyle: TextStyle(
              color: ColorManager.textBlack,
              fontSize: AppSizeSp.s10,
              fontFamily: FontConstants.fontFamily),
          unselectedLabelStyle: TextStyle(
              fontSize: AppSizeSp.s10,
              color: ColorManager.textBlack,
              fontFamily: FontConstants.fontFamily)),
      brightness: Brightness.light,
      useMaterial3: true,
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.transparent,
      ),
      dividerColor: ColorManager.mercury,
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
        constraints: const BoxConstraints(minWidth: double.infinity),
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
      buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.primary, //  <-- dark color
        textTheme:
        ButtonTextTheme.primary, //  <-- this auto selects the right color
      ),
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
            color: ColorManager.textBlack,
            fontSize: AppSizeSp.s23,
            fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.textBlack,
            fontSize: AppSizeSp.s15,
            fontWeight: FontWeight.w700),
        bodySmall: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.textBlack,
            fontSize: AppSizeSp.s14,
            fontWeight: FontWeight.w400),
        labelMedium: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.textBlack,
            fontSize: AppSizeSp.s16,
            fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.textFieldGrey,
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
        headlineLarge: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.primary,
            fontSize: AppSizeSp.s18,
            fontWeight: FontWeight.w700),
      ),
      dividerTheme: DividerThemeData(color: ColorManager.grey),
      canvasColor: ColorManager.whiteSmoke);
}

ThemeData darkTheme() {
  return ThemeData(
    // colorSchemeSeed: const Color(0xFF222222),
      scaffoldBackgroundColor: const Color(0xFF222222),
      cardTheme: CardTheme(color: ColorManager.textFieldGrey),
      cardColor: ColorManager.primary,

      colorScheme: ColorScheme.dark(
        primary: ColorManager.white,
        brightness: Brightness.dark,
        surfaceVariant: Colors.transparent,
        secondary: ColorManager.golden,
        onSecondary: ColorManager.golden,
        tertiaryContainer: ColorManager.primary,
        onTertiaryContainer: ColorManager.cloudyGrey,
        onSurface: ColorManager.white,
        tertiary: ColorManager.primary,
        onTertiary: ColorManager.textFieldGrey,
        secondaryContainer: const Color(0xFF222222),
        onSecondaryContainer: ColorManager.primary,
        onBackground: ColorManager.primary,
        shadow: ColorManager.golden,
      ),
      primaryColor: ColorManager.primary,
      shadowColor: Colors.transparent,
      dividerColor: Colors.transparent,
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.primary,
          selectedIconTheme: IconThemeData(color: ColorManager.golden),
          unselectedIconTheme: IconThemeData(color: ColorManager.white),
          selectedLabelStyle: TextStyle(
              color: ColorManager.white,
              fontSize: AppSizeSp.s10,
              fontFamily: FontConstants.fontFamily),
          unselectedLabelStyle: TextStyle(
              fontSize: AppSizeSp.s10,
              color: ColorManager.white,
              fontFamily: FontConstants.fontFamily)),
      iconTheme: IconThemeData(color: ColorManager.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(const Color(0xFF222222)),
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
          color: ColorManager.white,
          fontSize: AppSizeSp.s20,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s16,
            fontWeight: FontWeight.w700),
        titleSmall: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s13,
            fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s23,
            fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s13,
            fontWeight: FontWeight.w700),
        bodyLarge: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s23,
            fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s15,
            fontWeight: FontWeight.w700),
        bodySmall: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s14,
            fontWeight: FontWeight.w400),
        labelMedium: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s16,
            fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s13,
            fontWeight: FontWeight.w400),
        displaySmall: TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorManager.white,
            fontSize: AppSizeSp.s16,
            fontWeight: FontWeight.w400),
      ),
      dividerTheme:
      DividerThemeData(color: ColorManager.textBlack.withOpacity(0.6)),
      canvasColor: ColorManager.cloudyGrey,
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
