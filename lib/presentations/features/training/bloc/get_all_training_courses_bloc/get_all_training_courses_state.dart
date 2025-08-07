part of 'get_all_training_courses_bloc.dart';

@freezed
class GetAllTrainingCoursesState with _$GetAllTrainingCoursesState {
  const factory GetAllTrainingCoursesState.initial() = _Initial;
  const factory GetAllTrainingCoursesState.loading() = _Loading;
  const factory GetAllTrainingCoursesState.done(
    GetAllCoursesResponseModel coursesResponse,
    GetAllCategoriesResponseModel categoriesResponse,
    GetTrainingCourseProvidersResponseModel providersResponse,
    bool isApplyFilterLoading,
  ) = _Done;
  const factory GetAllTrainingCoursesState.error(String message) = _Error;
}