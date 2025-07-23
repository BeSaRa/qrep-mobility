import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/usecases/training_usecases/get_training_course_sessions_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'get_training_course_sessions_event.dart';
part 'get_training_course_sessions_state.dart';
part 'get_training_course_sessions_bloc.freezed.dart';

class GetTrainingCourseSessionsBloc extends Bloc<GetTrainingCourseSessionsEvent, GetTrainingCourseSessionsState> {
  final GetTrainingCourseSessionsUsecase getTrainingCourseSessionsUsecase;

  // bool _isFetching = false;

  GetTrainingCourseSessionsBloc(
    this.getTrainingCourseSessionsUsecase,
  ) : super(const GetTrainingCourseSessionsState.initial()) {
    on<GetTrainingCourseSessionsEvent>((event, emit) async {
      await event.map(
        started: (_Started value) async {

          emit(const GetTrainingCourseSessionsState.loading());
          final request =  value.request;
          final failureOrSuccess = await getTrainingCourseSessionsUsecase.execute(request);
          failureOrSuccess.when((success) async {
            emit(GetTrainingCourseSessionsState.done(success,false));
          }, (error) {
            emit( GetTrainingCourseSessionsState.error(error.message));
          });

        },
        fetchNextPage: (value) async {
          // final currentState = state;
          // if (currentState is _Done && !_isFetching) {
          //   _isFetching = true;

          //   final result = await getTrainingCourseSessionsUsecase.execute(value.request);
          //   final newCourses = result.tryGetSuccess();
          //   final error = result.tryGetError();

          //   _isFetching = false;

          //   if (newCourses != null) {
          //     final updatedCourses = currentState.trainingCourseSessions.copyWith(
          //       data: currentState.trainingCourseSessions.data.copyWith(
          //           ...currentState.trainingCourseSessions.data,
                  
          //         // trainingCourses: [
          //         //   ...newCourses.data!.trainingCourses,
          //         // ],
          //         pager: newCourses.data.pager,
          //       ),
          //     );

          //     emit(GetTrainingCourseSessionsState.done(
          //       updatedCourses,
          //       false
                
          //     ));
          //   } else {
          //     emit(GetTrainingCourseSessionsState.error(
          //         error?.message ?? "Failed to fetch next page"));
          //   }
          // }
        },
        applyFilters: (value) async {
  //          // Set loading flag to true while keeping existing data
  // if (state is _Done) {
  //   emit((state as _Done).copyWith(isApplyFilterLoading: true));
  // }

  //         final failureOrSuccess =
  //             await getAllTrainingCoursesUsecase.execute(value.request);

  //         // Use pattern matching directly on the result
  //         final GetTrainingCourseSessionsState result = await failureOrSuccess.when(
  //           (success) async {
  //             final currentState = state;
  //             if (currentState is _Done) {
  //               return GetTrainingCourseSessionsState.done(
  //                 success,
  //                 currentState.categoriesResponse,
  //                 false
  //               );
  //             } else {
  //               // Handle case where we don't have categories yet
  //               final categoriesResult =
  //                   await getTrainingCourseSessionsUsecase.execute(
  //               );

  //               return categoriesResult.when(
  //                 (successCategories) => GetTrainingCourseSessionsState.done(
  //                     success, successCategories,false),
  //                 (error) => GetTrainingCourseSessionsState.error(error.message),
  //               );
  //             }
  //           },
  //           (error) => GetTrainingCourseSessionsState.error(error.message),
  //         );

  //         emit(result);
        },
      );
    });
  }
}
