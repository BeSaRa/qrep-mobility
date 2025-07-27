part of 'get_training_course_sessions_bloc.dart';

@freezed
class GetTrainingCourseSessionsEvent with _$GetTrainingCourseSessionsEvent {
  const factory GetTrainingCourseSessionsEvent.started(GetTrainingCourseSessionsRequestModel request) = _Started;
  const factory GetTrainingCourseSessionsEvent.fetchNextPage(GetTrainingCourseSessionsRequestModel request) = _FetchNextPage;
  const factory GetTrainingCourseSessionsEvent.applyFilters(GetTrainingCourseSessionsRequestModel request) = _ApplyFilters;
}
