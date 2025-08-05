import 'package:ebla/domain/models/training/get_all_categories_response_model/get_all_categories_response_model.dart';
import 'package:ebla/domain/repository/service_and_training_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../base_usecases/base_usecase.dart';

class GetAllTrainingCatigoriesForGuestUsecase implements BaseUseCaseEmptyInput<GetAllCategoriesResponseModel> {
  final ServiceAndTrainingRepository repository;

  GetAllTrainingCatigoriesForGuestUsecase(this.repository);

  @override
  Future<Result<GetAllCategoriesResponseModel, FailureModel>> execute() async {
    return await repository.getAllTrainingGategoriesForGuest();
  }
}
