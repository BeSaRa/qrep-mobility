import 'package:ebla/domain/models/training/get_all_categories_response_model/get_all_categories_response_model.dart';
import 'package:ebla/domain/repository/phase2_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../models/requests/training/get_all_courses_request_model.dart';
import '../base_usecases/base_usecase.dart';

class GetAllTrainingCatigoriesUsecase implements BaseUseCase<GetAllCategoriesRequestModel,GetAllCategoriesResponseModel> {
  final Phase2Repository repository;

  GetAllTrainingCatigoriesUsecase(this.repository);

  @override
  Future<Result<GetAllCategoriesResponseModel, FailureModel>> execute(GetAllCategoriesRequestModel request) async {
    return await repository.getAllTrainingGategories(request);
  }
}