import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/repository/phase2_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../base_usecases/base_usecase.dart';

class GetCourseAttachmentsUsecase implements BaseUseCase<GetCourseDetailsRequestModel, GetTrainingCourseAttachmentResponseModel> {
  final Phase2Repository repository;

  GetCourseAttachmentsUsecase(this.repository);

  @override
  Future<Result<GetTrainingCourseAttachmentResponseModel, FailureModel>> execute(GetCourseDetailsRequestModel request) async {
    return await repository.getTrainingCourseAttachment(request);
  }
}