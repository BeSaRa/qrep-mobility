part of 'get_course_details_bloc.dart';

@freezed
class GetCourseDetailsState with _$GetCourseDetailsState {
  const factory GetCourseDetailsState.initial() = _Initial;
  const factory GetCourseDetailsState.loading() = _Loading;
  const factory GetCourseDetailsState.done(CourseDetailsResponseModel courseDetailsResponse,GetTrainingCourseAttachmentResponseModel courseAttachments) = _Done;
  const factory GetCourseDetailsState.error(String message) = _Error;
}
