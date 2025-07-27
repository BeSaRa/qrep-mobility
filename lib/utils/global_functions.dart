import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/models/cms_models/main_menu_models/main_menu_models.dart';
import '../domain/models/cms_models/news/news_model.dart';
import '../domain/models/rent_models/rent_models.dart';
import '../presentations/resources/resources.dart';

LookupModel? getObjectById(List<LookupModel> objects, int id) {
  LookupModel item = objects.firstWhere((item) => item.id == id,
      orElse: () => const LookupModel());
  if (item != const LookupModel()) {
    return item;
  } else {
    return null;
  }
}

LookupModel? getObjectByLookupKey(List<LookupModel> objects, int id) {
  LookupModel item = objects.firstWhere((item) => item.lookupKey == id,
      orElse: () => const LookupModel());
  if (item != const LookupModel()) {
    return item;
  } else {
    return null;
  }
}

PeriodTimeDetails? getObjectByList(
    List<PeriodTimeDetails> objects, List<int> value) {
  PeriodTimeDetails item = objects.firstWhere((item) => item.value == value,
      orElse: () => const PeriodTimeDetails());
  // ignore: unrelated_type_equality_checks
  if (item != const LookupModel()) {
    return item;
  } else {
    return null;
  }
}

List<LookupModel> filterDataBymunicipalityId(
    int id, List<LookupModel> dataList) {
  return dataList
      .where((item) => item.municipalityId == id || item.lookupKey == -1)
      .toList();
}

List<int> generateYears(int startYear, int endYear) {
  List<int> years = [];

  for (int year = startYear; year <= endYear; year++) {
    years.add(year);
  }

  return years;
}

List<PeriodTimeDetails> getAllMonthsInYear(BuildContext context) {
  List<PeriodTimeDetails> months = [];
  for (int i = 1; i <= 12; i++) {
    DateTime date = DateTime(DateTime.now().year, i);
    String enMonthName = DateFormat('MMMM').format(date);
    String monthName = DateFormat('MMMM', ARABIC_LOCAL.toString()).format(date);
    months.add(
        PeriodTimeDetails(name: monthName, value: [i], enName: enMonthName));
  }
  return months;
}

List<PeriodTimeDetails> getFromAprilMonths(BuildContext context) {
  List<PeriodTimeDetails> months = [];
  for (int i = 4; i <= 12; i++) {
    DateTime date = DateTime(DateTime.april, i);
    String enMonthName = DateFormat('MMMM').format(date);
    String monthName = DateFormat('MMMM', ARABIC_LOCAL.toString()).format(date);
    months.add(
        PeriodTimeDetails(name: monthName, value: [i], enName: enMonthName));
  }
  return months;
}

NewsModel? getObjectByIdNewsModel(List<NewsModel> objects, int id) {
  NewsModel item = objects.firstWhere((item) => item.id == id,
      orElse: () => const NewsModel());
  if (item != const NewsModel()) {
    return item;
  } else {
    return null;
  }
}

LinkModel? getObjectLinkModelById(List<LinkModel> objects, int id) {
  LinkModel item = objects.firstWhere((item) => item.id == id,
      orElse: () => const LinkModel());
  if (item != const LinkModel()) {
    return item;
  } else {
    return null;
  }
}

// Future sendAnalyticsEvent({String eventName, String? clickevent}) async {
//   await _analytics.logEvent(
//     name: '${eventName}',
//     parameters: <String, dynamic>{'clickEvent': clickevent},
//   );
// }
bool get isTablet {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  final logicalShortestSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  return logicalShortestSide > 600;
}


  Future<void> openPdf(
      {required String base64String, required String fileName}) async {
    try {
      // Decode base64 string
      final bytes = base64.decode(base64String);

      // Get temporary directory
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/$fileName');

      // Write to temporary file
      await file.writeAsBytes(bytes);

      // Open the file
      await OpenFile.open(file.path);
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<void> downloadPdf(
  //     {required String base64String, required String fileName}) async {
  //   try {
  //     // Check storage permission
  //     final status = await Permission.storage.request();
  //     if (!status.isGranted) {
  //       log('Storage permission denied');
  //       return;
  //     }
  //     // Decode base64 string
  //     final bytes = base64.decode(base64String);
  //     // Get downloads directory (Android) or documents directory (iOS)
  //     Directory? directory;
  //     if (Platform.isAndroid) {
  //       directory = await getExternalStorageDirectory();
  //       // For Android, we need to use a specific path for downloads
  //       directory = Directory('${directory?.path}/Download');
  //       if (!await directory.exists()) {
  //         await directory.create(recursive: true);
  //       }
  //     } else if (Platform.isIOS) {
  //       directory = await getApplicationDocumentsDirectory();
  //     }

  //     if (directory == null) {
  //       log('Cannot access download directory');
  //       return;
  //     }

  //     final file = File('${directory.path}/$fileName');

  //     // Check if file already exists
  //     if (await file.exists()) {
  //       log('File already exists in downloads');
  //       return;
  //     }

  //     // Write the file
  //     await file.writeAsBytes(bytes);

  //     log('PDF downloaded to ${file.path}');
  //   } catch (e) {
  //     log('Failed to download PDF: ${e.toString()}');
  //   }
  // }