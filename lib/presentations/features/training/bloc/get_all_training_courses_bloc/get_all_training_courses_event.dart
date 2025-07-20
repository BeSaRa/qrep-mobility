part of 'get_all_training_courses_bloc.dart';

@freezed
class GetAllTrainingCoursesEvent with _$GetAllTrainingCoursesEvent {
  const factory GetAllTrainingCoursesEvent.started(GetAllCoursesRequestModel request) = _Started;
  const factory GetAllTrainingCoursesEvent.fetchNextPage(GetAllCoursesRequestModel request) = _FetchNextPage;
   const factory GetAllTrainingCoursesEvent.applyFilters(GetAllCoursesRequestModel request) = _ApplyFilters;
}
