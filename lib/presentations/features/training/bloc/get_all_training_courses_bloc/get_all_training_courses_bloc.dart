import 'package:bloc/bloc.dart';
import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_categories_response_model/get_all_categories_response_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/models/training/get_training_course_providers_response_model/get_training_course_providers_response_model.dart';
import 'package:ebla/domain/usecases/training_usecases/get_all_training_catigories_for_guest_usecase.dart';
import 'package:ebla/domain/usecases/training_usecases/get_all_training_courses_usecase.dart';
import 'package:ebla/domain/usecases/training_usecases/get_training_course_providers_usecase.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../domain/usecases/training_usecases/get_all_training_catigories_usecase.dart';

part 'get_all_training_courses_event.dart';
part 'get_all_training_courses_state.dart';
part 'get_all_training_courses_bloc.freezed.dart';

class GetAllTrainingCoursesBloc
    extends Bloc<GetAllTrainingCoursesEvent, GetAllTrainingCoursesState> {
  final GetAllTrainingCoursesUsecase getAllTrainingCoursesUsecase;
  final GetAllTrainingCatigoriesUsecase getAllTrainingCatigoriesUsecase;
  final GetAllTrainingCatigoriesForGuestUsecase getAllTrainingCatigoriesForGuestUsecase;
  final GetTrainingCourseProvidersUsecase getTrainingCourseProvidersUsecase;
  bool _isFetching = false;

  GetAllTrainingCoursesBloc(
    this.getAllTrainingCoursesUsecase,
    this.getAllTrainingCatigoriesUsecase,
    this.getAllTrainingCatigoriesForGuestUsecase,
    this.getTrainingCourseProvidersUsecase,
  ) : super(const GetAllTrainingCoursesState.initial()) {
    on<GetAllTrainingCoursesEvent>((event, emit) async {
      await event.map(
        started: (_Started value) async {
          emit(const GetAllTrainingCoursesState.loading());

          // First fetch categories with proper pagination
          Result<GetAllCategoriesResponseModel, FailureModel> categoriesResult;

          // if(user is NOT logged in){
          categoriesResult = await getAllTrainingCatigoriesForGuestUsecase.execute();
          // }
          // else{
          //   categoriesResult =
          //       await getAllTrainingCatigoriesUsecase.execute(
          //     const GetAllCategoriesRequestModel(),
          //   );
          // } 

          final categories = categoriesResult.tryGetSuccess();
          final categoriesError = categoriesResult.tryGetError();

          if (categories != null) {
              final providersResult = await getTrainingCourseProvidersUsecase.execute(const GetAllCoursesRequestModel(pageIndex: 0,pageSize: 0));
              final providers = providersResult.tryGetSuccess();
              final providersError = providersResult.tryGetError();

            if(providers!=null){

              final coursesResult = await getAllTrainingCoursesUsecase.execute(value.request);
              final courses = coursesResult.tryGetSuccess();
              final coursesError = coursesResult.tryGetError();
              if (courses != null) {
                emit(GetAllTrainingCoursesState.done(courses, categories,providers,false));
              } else {
                emit(GetAllTrainingCoursesState.error(
                    coursesError?.message ?? "Failed to load courses"));
              }
            }
            else{
              emit(GetAllTrainingCoursesState.error(
                providersError?.message ?? "Failed to load providers"));
            }
            
          
          } else {
            emit(GetAllTrainingCoursesState.error(
                categoriesError?.message ?? "Failed to load categories"));
          }
        },
        fetchNextPage: (value) async {
          final currentState = state;
          if (currentState is _Done && !_isFetching) {
            _isFetching = true;

            final result =
                await getAllTrainingCoursesUsecase.execute(value.request);
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

              emit(GetAllTrainingCoursesState.done(
                updatedCourses,
                currentState.categoriesResponse,
                currentState.providersResponse,
                false
              ));
            } else {
              emit(GetAllTrainingCoursesState.error(
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
              await getAllTrainingCoursesUsecase.execute(value.request);

          final GetAllTrainingCoursesState result = await failureOrSuccess.when(
            (success) async {
              final currentState = state;
              if (currentState is _Done) {
                return GetAllTrainingCoursesState.done(
                  success,
                  currentState.categoriesResponse,
                  currentState.providersResponse,
                  false
                );
              }
              else{
                return GetAllTrainingCoursesState.error(
                  AppStrings().defaultError
                );
              }
              // else {
              //   Result<GetAllCategoriesResponseModel, FailureModel>categoriesResult;
              //   // if(user is NOT logged in){
              //     categoriesResult =await getAllTrainingCatigoriesForGuestUsecase.execute();
              //   // }
              //   // else{
              //   //   categoriesResult =
              //   //       await getAllTrainingCatigoriesUsecase.execute(
              //   //     const GetAllCategoriesRequestModel(),
              //   //   );
              //   // }

              //   return categoriesResult.when(
              //     (successCategories) {
              //       return
              //      GetAllTrainingCoursesState.done(
              //         success, successCategories,false),
              //     },
              //     (error) => GetAllTrainingCoursesState.error(error.message),
              //   );
              // }
            },
            (error) => GetAllTrainingCoursesState.error(error.message),
          );

          emit(result);
        },
      );
    });
  }
}
