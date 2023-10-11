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
  return dataList.where((item) => item.municipalityId == id).toList();
}

List<int> generateYears(int startYear, int endYear) {
  List<int> years = [];

  for (int year = startYear; year <= endYear; year++) {
    years.add(year);
  }

  return years;
}
