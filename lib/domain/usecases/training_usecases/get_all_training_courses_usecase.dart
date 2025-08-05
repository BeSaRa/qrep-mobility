import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/repository/service_and_training_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../base_usecases/base_usecase.dart';

class GetAllTrainingCoursesUsecase implements BaseUseCase<GetAllCoursesRequestModel, GetAllCoursesResponseModel> {
  final ServiceAndTrainingRepository repository;

  GetAllTrainingCoursesUsecase(this.repository);

  @override
  Future<Result<GetAllCoursesResponseModel, FailureModel>> execute(GetAllCoursesRequestModel body) async {
    return await repository.getTrainingCourses(body);
  }
}