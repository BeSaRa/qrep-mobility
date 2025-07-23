import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/repository/phase2_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../base_usecases/base_usecase.dart';

class GetCourseDetailsUsecase implements BaseUseCase<GetCourseDetailsRequestModel, CourseDetailsResponseModel> {
  final Phase2Repository repository;

  GetCourseDetailsUsecase(this.repository);

  @override
  Future<Result<CourseDetailsResponseModel, FailureModel>> execute(GetCourseDetailsRequestModel request) async {
    return await repository.getCourseDetails(request);
  }
}