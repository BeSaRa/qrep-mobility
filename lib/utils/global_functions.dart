import '../domain/models/rent_models/rent_models.dart';

RentLookupModel? getObjectById(List<RentLookupModel> objects, int id) {
  RentLookupModel item = objects.firstWhere((item) => item.id == id,
      orElse: () => RentLookupModel());
  if (item != RentLookupModel()) {
    return item;
  } else {
    return null;
  }
}

RentLookupModel? getObjectByLookupKey(List<RentLookupModel> objects, int id) {
  RentLookupModel item = objects.firstWhere((item) => item.lookupKey == id,
      orElse: () => RentLookupModel());
  if (item != RentLookupModel()) {
    return item;
  } else {
    return null;
  }
}

List<RentLookupModel> filterDataBymunicipalityId(
    int id, List<RentLookupModel> dataList) {
  return dataList.where((item) => item.municipalityId == id).toList();
}
