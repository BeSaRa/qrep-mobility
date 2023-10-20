import 'dart:convert';
import 'dart:ui';

import 'package:multiple_result/multiple_result.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/app_preferences.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/translations_model/translations_model.dart';
import 'package:ebla/domain/usecases/translations_usecase/translations_usecase.dart';
import 'package:ebla/utils/file_utils.dart';

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
      if (await FileUtils.fileExists(localizationFileName) &&
          (!await shouldUpdate())) {
        // get the localization file from the application documents directory
        String fileContents =
            await FileUtils.readFromFile(localizationFileName);
        remoteTranslations = json.decode(fileContents);
      } else {
        // get the local from server
        remoteTranslations =
            await getTranslations(limit: 1000, selectedLocale: locale);
        // write it to application documents directory
        await FileUtils.writeToFile(
            localizationFileName, json.encode(remoteTranslations));
        await appPreferences.setLocalizationsLastUpdate(date: DateTime.now());
      }
      result.addAll(remoteTranslations);
    }

    return result;
  }

  // todo: agree on a versioning mechanism with the backend devs
  /// Determines whether remote localizations should be updated based on the last update timestamp.
  /// Returns `true` if the app is newly installed or if the last update is before [_updateInterval],
  /// indicating the need for an update; otherwise, returns `false`.
  Future<bool> shouldUpdate() async {
    DateTime? lastUpdate = await appPreferences.getLocalizationsLastUpdate();
    return lastUpdate == null || lastUpdate.isBefore(_updateInterval);
  }

  //--------------------------------------------------------
  Future<Map<String, dynamic>> getTranslations(
      {required int limit, required Locale selectedLocale}) async {
    Map<String, dynamic> translations = {};

    Result<TranslationsModel, FailureModel> result =
        await getRemoteTranslations(limit: limit);

    translations = result.when(
        (success) => extractSelectedLocale(
            locale: selectedLocale, translations: success),
        (error) => {});

    return translations;
  }

  Map<String, dynamic> extractSelectedLocale({
    required TranslationsModel translations,
    required Locale locale,
  }) {
    Map<String, dynamic> selectedLocale = {};
    for (var element in translations.data) {
      if (element.language == "${locale.languageCode}-${locale.countryCode}" &&
          element.key != null &&
          element.value != null) {
        selectedLocale[element.key ?? ''] = element.value ?? '';
      }
    }
    return selectedLocale;
  }

  Future<Result<TranslationsModel, FailureModel>> getRemoteTranslations(
      {required int limit}) async {
    return await translationsUseCase.execute(limit);
  }
}
