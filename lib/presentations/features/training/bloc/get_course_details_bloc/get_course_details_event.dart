part of 'get_course_details_bloc.dart';

@freezed
class GetCourseDetailsEvent with _$GetCourseDetailsEvent {
  const factory GetCourseDetailsEvent.started(int id) = _Started;
}
