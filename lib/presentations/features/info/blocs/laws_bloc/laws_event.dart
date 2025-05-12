part of 'laws_bloc.dart';

@freezed
class LawsEvent with _$LawsEvent {
  const factory LawsEvent.getLaws() = _GetLaws;
  const factory LawsEvent.updateSelectedCategories(List<String> categories) = _UpdateSelectedCategories;

  // const factory LawsEvent.getLawById({required int id}) = _GetLawById;
}
