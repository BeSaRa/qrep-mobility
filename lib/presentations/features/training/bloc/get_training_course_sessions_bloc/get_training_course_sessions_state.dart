part of 'get_training_course_sessions_bloc.dart';

@freezed
class GetTrainingCourseSessionsState with _$GetTrainingCourseSessionsState {
  const factory GetTrainingCourseSessionsState.initial() = _Initial;
  const factory GetTrainingCourseSessionsState.loading() = _Loading;
  const factory GetTrainingCourseSessionsState.done(
    GetTrainingCourseSessionsResponseModel trainingCourseSessions,
    bool isApplyFilterLoading,
  ) = _Done;
  const factory GetTrainingCourseSessionsState.error(String message) = _Error;
}