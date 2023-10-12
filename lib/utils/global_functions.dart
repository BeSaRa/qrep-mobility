import 'package:easy_localization/easy_localization.dart';

import '../domain/models/rent_models/rent_models.dart';

RentLookupModel? getObjectById(List<RentLookupModel> objects, int id) {
  RentLookupModel item = objects.firstWhere((item) => item.id == id,
      orElse: () => const RentLookupModel());
  if (item != const RentLookupModel()) {
    return item;
  } else {
    return null;
  }
}

RentLookupModel? getObjectByLookupKey(List<RentLookupModel> objects, int id) {
  RentLookupModel item = objects.firstWhere((item) => item.lookupKey == id,
      orElse: () => const RentLookupModel());
  if (item != const RentLookupModel()) {
    return item;
  } else {
    return null;
  }
}

List<RentLookupModel> filterDataBymunicipalityId(
    int id, List<RentLookupModel> dataList) {
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

List<PeriodTimeDetails> getAllMonthsInYear() {
  List<PeriodTimeDetails> months = [];
  for (int i = 1; i <= 12; i++) {
    DateTime date = DateTime(DateTime.now().year, i);
    String monthName = DateFormat('MMMM').format(date);
    months.add(PeriodTimeDetails(name: monthName, value: [i]));
  }
  return months;
}
