import 'package:flutter/material.dart';

class ColorManager {
  // static const int _primaryValue = 0xFFFFFFF;
  static Color primary = Hex16Color.fromHex("#8A1538");
  static Color white = Hex16Color.fromHex("#FFFFFF");
  static Color black = Hex16Color.fromHex("#000000");
}

extension Hex16Color on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
