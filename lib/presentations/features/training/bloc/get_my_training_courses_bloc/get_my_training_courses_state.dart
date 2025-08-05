part of 'get_my_training_courses_bloc.dart';

@freezed
class GetMyTrainingCoursesState with _$GetMyTrainingCoursesState {
  const factory GetMyTrainingCoursesState.initial() = _Initial;
  const factory GetMyTrainingCoursesState.loading() = _Loading;
  const factory GetMyTrainingCoursesState.done(
    GetAllCoursesResponseModel coursesResponse,
    bool isApplyFilterLoading,
  ) = _Done;
  const factory GetMyTrainingCoursesState.error(String message) = _Error;
}