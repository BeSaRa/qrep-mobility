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
    String? name,
    int? track,
    bool? isFree,
    List<int>? categories,
    bool? isActive,
  }) {
    emit(state.copyWith(
      pageIndex: pageIndex?? 1,
      pageSize: pageSize??5,
      name: name,
      track: track,
      isFree: isFree,
      categories: categories,
      isActive: isActive,
    ));
  }

  void resetFilters() {
    emit(const GetAllCoursesRequestModel(
      pageIndex: 1,
      pageSize: 10,
    ));
  }
}