import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/usecases/training_usecases/get_my_training_courses_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_my_training_courses_event.dart';
part 'get_my_training_courses_state.dart';
part 'get_my_training_courses_bloc.freezed.dart';

class GetMyTrainingCoursesBloc
    extends Bloc<GetMyTrainingCoursesEvent, GetMyTrainingCoursesState> {
  final GetMyTrainingCoursesUsecase getMyTrainingCoursesUsecase;
  bool _isFetching = false;

  GetMyTrainingCoursesBloc(
    this.getMyTrainingCoursesUsecase,
  ) : super(const GetMyTrainingCoursesState.initial()) {
    on<GetMyTrainingCoursesEvent>((event, emit) async {
      await event.map(
        started: (_Started value) async {
          emit(const GetMyTrainingCoursesState.loading());

          final myCoursesResult =
              await getMyTrainingCoursesUsecase.execute(value.request);
          final courses = myCoursesResult.tryGetSuccess();
          print("zak $courses");
          final coursesError = myCoursesResult.tryGetError();
          print("zak1 $coursesError");
          if (courses != null) {
            emit(GetMyTrainingCoursesState.done(courses, false));
          } else {
            emit(GetMyTrainingCoursesState.error(
                coursesError?.message ?? "Failed to load courses"));
          }
        },
        fetchNextPage: (value) async {
          final currentState = state;
          if (currentState is _Done && !_isFetching) {
            _isFetching = true;

            final result =
                await getMyTrainingCoursesUsecase.execute(value.request);
            final newCourses = result.tryGetSuccess();
            final error = result.tryGetError();

            _isFetching = false;

            if (newCourses != null) {
              final updatedCourses = currentState.coursesResponse.copyWith(
                data: currentState.coursesResponse.data!.copyWith(
                  trainingCourses: [
                    ...currentState.coursesResponse.data!.trainingCourses,
                    ...newCourses.data!.trainingCourses,
                  ],
                  pager: newCourses.data!.pager,
                ),
              );

              emit(GetMyTrainingCoursesState.done(updatedCourses, false));
            } else {
              emit(GetMyTrainingCoursesState.error(
                  error?.message ?? "Failed to fetch next page"));
            }
          }
        },
        applyFilters: (value) async {
          // Set loading flag to true while keeping existing data
          if (state is _Done) {
            emit((state as _Done).copyWith(isApplyFilterLoading: true));
          }

          final failureOrSuccess =
              await getMyTrainingCoursesUsecase.execute(value.request);

          final GetMyTrainingCoursesState result = await failureOrSuccess.when(
            (success) async {
              return GetMyTrainingCoursesState.done(success, false);
            },
            (error) => GetMyTrainingCoursesState.error(error.message),
          );
          emit(result);
        },
      );
    });
  }
}
