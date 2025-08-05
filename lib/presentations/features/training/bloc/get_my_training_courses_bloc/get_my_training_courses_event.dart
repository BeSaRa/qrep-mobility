part of 'get_my_training_courses_bloc.dart';

@freezed
class GetMyTrainingCoursesEvent with _$GetMyTrainingCoursesEvent {
  const factory GetMyTrainingCoursesEvent.started(GetAllCoursesRequestModel request) = _Started;
  const factory GetMyTrainingCoursesEvent.fetchNextPage(GetAllCoursesRequestModel request) = _FetchNextPage;
   const factory GetMyTrainingCoursesEvent.applyFilters(GetAllCoursesRequestModel request) = _ApplyFilters;
}
