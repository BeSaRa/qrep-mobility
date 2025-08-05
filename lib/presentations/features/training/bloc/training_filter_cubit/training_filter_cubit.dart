// training_filter_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';

class TrainingFilterCubit extends Cubit<GetAllCoursesRequestModel> {
  TrainingFilterCubit() : super(const GetAllCoursesRequestModel(
    pageIndex: 1,
    pageSize: 5,
  ));

  void updateFilters({
    int? pageIndex,
    int? pageSize,
    List<int>? categories,
    String? endDate,
    bool? inMorning,
    bool? isFree,
    int? language,
    int? location,
    String? numberOfDays,
    String? startDate,
    String? name,
    String? trainingCourseDate,
    String? trainingCourseProvider,
    int? track,//
    bool? isActive,//
  }) {
    emit(state.copyWith(
      pageIndex: pageIndex?? 1,
      pageSize: pageSize??5,
      name: name,
      track: track,
      startDate: startDate,
      endDate: endDate,
      isFree: isFree,
      inMorning: inMorning,
      language: language,
      location: location,
      numberOfDays: numberOfDays,
      trainingCourseDate: trainingCourseDate,
      trainingCourseProvider: trainingCourseProvider,
      categories: categories,
      isActive: isActive,
    ));
  }

  void resetFilters() {
    emit(const GetAllCoursesRequestModel(
      pageIndex: 1,
      pageSize: 5,
    )); 
  }
}