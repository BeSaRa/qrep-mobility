import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/app_preferences.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/models/translations_model/translations_model.dart';
import 'package:ebla/domain/usecases/translations_usecase/translations_usecase.dart';
import 'package:ebla/utils/colored_printer.dart';
import 'package:ebla/utils/file_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:multiple_result/multiple_result.dart';

/// How it works:
///
/// The remote translations are updated in two cases:
///   1. If they have not been fetched for more than the specified updateInterval.
///   2. If they are not stored in applicationDocumentDirectory.
///
/// The [load] method performs the following steps:
///   1. Loads the bundled assets.
///   2. Loads the remote translations if [loadRemoteAssets] argument is true.
///   3. Combines the bundled and remote translations together.
///   4. Overrides the value of duplicated keys with the fetched values.
///   5. Returns the [Map<String, dynamic>] for the selected Locale.
class TranslationsAssetsLoader extends AssetLoader {
  // ignore: prefer_final_fields
  DateTime _updateInterval = DateTime.now().subtract(const Duration(days: 3));
  bool loadRemoteAssets = true;

  TranslationsAssetsLoader(
      {required Duration updateInterval, required this.loadRemoteAssets})
      : _updateInterval = DateTime.now().subtract(updateInterval);

  final TranslationsUseCase translationsUseCase =
      instance<TranslationsUseCase>();
  final RootBundleAssetLoader rootBundleAssetLoader =
      const RootBundleAssetLoader();
  final AppPreferences appPreferences = instance<AppPreferences>();

  final String localizationFileName = 'localizations.json';

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {
    Map<String, dynamic> result = {};
    Map<String, dynamic> remoteTranslations = {};
    final Map<String, dynamic> bundledTranslations =
        await rootBundleAssetLoader.load(path, locale) ?? {};
    result.addAll(bundledTranslations);

    if (loadRemoteAssets) {
      try {
        if ((!await shouldUpdate()) &&
            await FileUtils.fileExists(localizationFileName)) {
          // get the localization file from the application documents directory
          String fileContents =
              await FileUtils.readFromFile(localizationFileName);

          remoteTranslations = extractSelectedLocaleFromFile(
              fileContents: fileContents, locale: locale);
          ColoredPrinter.printColored(
              'using remote translations, selected Locale: $locale',
              AnsiColor.blue);
        } else {
          // get translations from server
          List<Map<String, dynamic>> translations =
              await getTranslations(limit: 1000);
          // get translations for selected locale
          remoteTranslations = extractSelectedLocaleFromList(
              translations: translations, locale: locale);

          // write it to application documents directory
          if (translations.isNotEmpty) {
            compareMaps(
                oldMap: bundledTranslations, newMap: remoteTranslations);
            await FileUtils.writeToFile(
                localizationFileName, json.encode(translations));
          }
          await appPreferences.setLocalizationsLastUpdate(date: DateTime.now());
        }

        result.addAll(remoteTranslations);
      } catch (e) {
        if (kDebugMode) {
        }
      }
    }
    return result;
  }

  void compareMaps({required Map oldMap, required Map newMap}) {
    int extraKeys = 0;
    int differentValues = 0;

    // Check extra keys in oldMap
    Set<dynamic> extraKeysSet =
        oldMap.keys.toSet().difference(newMap.keys.toSet());
    extraKeys = extraKeysSet.length;

    // Check different values for existing keys
    oldMap.forEach((key, value) {
      if (newMap.containsKey(key) && newMap[key] != value) {
        differentValues++;
      }
    });

    ColoredPrinter.printColored(
        'Number of extra keys: $extraKeys', AnsiColor.cyan);
    ColoredPrinter.printColored(
        'Number of different values for existing keys: $differentValues',
        AnsiColor.cyan);
  }

  // todo: agree on a versioning mechanism with the backend devs
  /// Determines whether remote localizations should be updated based on the last update timestamp.
  /// Returns `true` if the app is newly installed or if the last update is before [_updateInterval],
  /// indicating the need for an update; otherwise, returns `false`.
  Future<bool> shouldUpdate() async {
    DateTime? lastUpdate =
        await appPreferences.getLocalizationsLastUpdate() ?? DateTime.now();
    return lastUpdate.isBefore(_updateInterval);
  }

  //--------------------------------------------------------
  Future<List<Map<String, dynamic>>> getTranslations({
    required int limit,
  }) async {
    List<Map<String, dynamic>> translations = [];

    Result<TranslationsModel, FailureModel> result =
        await translationsUseCase.execute(limit);

    translations = result.when((success) {
      for (var element in success.data) {
        translations.add(element.toJson());
      }
      return translations;
    }, (error) => []);

    return translations;
  }

  Map<String, dynamic> extractSelectedLocaleFromList({
    required List<Map<String, dynamic>> translations,
    required Locale locale,
  }) {
    Map<String, dynamic> selectedLocale = {};
    for (var element in translations) {
      TranslationDataItem item = TranslationDataItem.fromJson(element);
      if (item.language == "${locale.languageCode}-${locale.countryCode}" &&
          item.key != null &&
          item.value != null) {
        selectedLocale[item.key ?? ''] = item.value ?? '';
      }
    }
    return selectedLocale;
  }

  Map<String, dynamic> extractSelectedLocaleFromFile(
      {required String fileContents, required Locale locale}) {
    Map<String, dynamic> selectedLocaleFromFile = {};
    var translations = json.decode(fileContents);
    try {
      if (translations is List) {
        for (var element in translations) {
          TranslationDataItem item = TranslationDataItem.fromJson(element);
          if (item.language == "${locale.languageCode}-${locale.countryCode}" &&
              item.key != null &&
              item.value != null) {
            selectedLocaleFromFile[item.key ?? ''] = item.value ?? '';
          }
        }
      }
    } catch (e) {}

    return selectedLocaleFromFile;
  }
}
