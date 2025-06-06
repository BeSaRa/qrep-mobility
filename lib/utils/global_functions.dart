import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

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
  print("month change ");
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
