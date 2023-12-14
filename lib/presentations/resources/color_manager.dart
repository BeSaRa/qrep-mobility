import 'package:flutter/material.dart';

class ColorManager {
  static Color white = Hex16Color.fromHex("#FFFFFF");
  static Color whiteSmoke = Hex16Color.fromHex("#F4F4F4");
  static Color porcelain = Hex16Color.fromHex("#F0F0F0");
  static Color mercury = Hex16Color.fromHex("#E9E9E9");
  static Color grey = Hex16Color.fromHex("#E1E1E1");
  static Color lightBlue = Hex16Color.fromHex("#EBF7FF");
  static Color platinum = Hex16Color.fromHex("#CECECE");
  static Color silver = Hex16Color.fromHex("#C1C1C1");
  static Color lightSilver = Hex16Color.fromHex("#BDBDBD");
  static Color greyCloud = Hex16Color.fromHex("#B7B7B7");
  static Color golden = Hex16Color.fromHex("#A29475");
  static Color cloudyGrey = Hex16Color.fromHex("#676767");
  static Color textFieldGrey = Hex16Color.fromHex("#434343");
  static Color primary = Hex16Color.fromHex("#8A1538");
  static Color textBlack = Hex16Color.fromHex("#000000");
  static Color red = Hex16Color.fromHex("#FF0000");
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
