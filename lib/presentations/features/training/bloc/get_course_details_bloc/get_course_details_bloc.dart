import 'package:bloc/bloc.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/usecases/training_usecases/get_course_attachments_usecase.dart';
import 'package:ebla/domain/usecases/training_usecases/get_course_details_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_course_details_event.dart';
part 'get_course_details_state.dart';
part 'get_course_details_bloc.freezed.dart';

class GetCourseDetailsBloc extends Bloc<GetCourseDetailsEvent, GetCourseDetailsState> {
  final GetCourseDetailsUsecase getCourseDetailsUsecase;
  final GetCourseAttachmentsUsecase getCourseAttachmentsUsecase;


  GetCourseDetailsBloc(
    this.getCourseDetailsUsecase,
    this.getCourseAttachmentsUsecase,
  ) : super(const GetCourseDetailsState.initial()) {
    on<GetCourseDetailsEvent>((event, emit) async {
      await event.map(
        started: (_Started value) async {
          emit(const GetCourseDetailsState.loading());
          final courseDetailsResult = await getCourseDetailsUsecase.execute(GetCourseDetailsRequestModel(id:value.id),);

          final courseDetails = courseDetailsResult.tryGetSuccess();
          final courseDetailsError = courseDetailsResult.tryGetError();

          if (courseDetails != null) {
            // Then fetched courses
            final attachmentsResult = await getCourseAttachmentsUsecase.execute(GetCourseDetailsRequestModel(id:value.id));
            final attachments = attachmentsResult.tryGetSuccess();
            final attachmentsError = attachmentsResult.tryGetError();

            if (attachments != null) {
              emit(GetCourseDetailsState.done( courseDetails,attachments));
            } else {
              emit(GetCourseDetailsState.error(
                  attachmentsError?.message ?? "Failed to load courses"));
            }
          } else {
            emit(GetCourseDetailsState.error(
                courseDetailsError?.message ?? "Failed to load categories"));
          }
          // emit(const GetCourseDetailsState.loading());
          // final request =  GetCourseDetailsRequestModel(id:value.id);
          // final failureOrSuccess = await getCourseDetailsUsecase.execute(request);
          // failureOrSuccess.when((success) async {
          //   emit(GetCourseDetailsState.done(success));
          // }, (error) {
          //   emit( GetCourseDetailsState.error(error.message));
          // });
        
        },
      );
    });
  }
}
