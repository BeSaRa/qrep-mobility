import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = 'ar';
const String ENGLISH = 'en';
const String ASSETS_PATH_LOCALISATION = "assets/lang";
const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL =Locale("en", "US");

const List<Locale> supportedLocales = [
  ENGLISH_LOCAL,
  ARABIC_LOCAL,
];

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}

extension LanguageTypeLocalExtension on LanguageType {
  Locale getLocal() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH_LOCAL;
      case LanguageType.ARABIC:
        return ARABIC_LOCAL;
    }
  }
}
