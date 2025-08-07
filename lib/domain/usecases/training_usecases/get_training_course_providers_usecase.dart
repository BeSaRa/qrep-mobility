import 'package:ebla/domain/models/training/get_training_course_providers_response_model/get_training_course_providers_response_model.dart';
import 'package:ebla/domain/repository/service_and_training_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../models/requests/training/get_all_courses_request_model.dart';
import '../base_usecases/base_usecase.dart';


class GetTrainingCourseProvidersUsecase implements BaseUseCase<GetAllCoursesRequestModel, GetTrainingCourseProvidersResponseModel> {
  final ServiceAndTrainingRepository repository;

  GetTrainingCourseProvidersUsecase(this.repository);

  @override
  Future<Result<GetTrainingCourseProvidersResponseModel, FailureModel>> execute(
      GetAllCoursesRequestModel request) async {
    return await repository.getTrainingCourseProviders(request);
  }
}
