import 'package:flutter/material.dart';

class FontConstants {
  static const String fontFamily = "";
}

ThemeData lightTheme() {
  return ThemeData(

    colorSchemeSeed: Color(0xFF8A1538),
    brightness: Brightness.light,
    useMaterial3: true
  );
}

ThemeData darkTheme() {
  return ThemeData(

      colorSchemeSeed: Color(0xFF8A1538),
    brightness: Brightness.dark,
    useMaterial3: true
  );
}