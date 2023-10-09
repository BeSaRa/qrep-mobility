import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/base_usecases/base_usecase.dart';
import 'package:multiple_result/src/result.dart';

import '../../../models/rent_models/rent_models.dart';
import '../../../models/requests/rent_requests/request_mean_value.dart';

class MeanValueUsecase
    implements BaseUseCase<RequestMeanValue, List<BaseRentResponse>> {
  final Repository repository;

  MeanValueUsecase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.meanValue(input);
  }
}

class MeanValuePurposeUsecase
    implements BaseUseCase<RequestMeanValue, List<BaseRentResponse>> {
  final Repository repository;

  MeanValuePurposeUsecase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.meanValuePurpose(input);
  }
}

class MeanValuePropertyUsecase
    implements BaseUseCase<RequestMeanValue, List<BaseRentResponse>> {
  final Repository repository;

  MeanValuePropertyUsecase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.meanValueProperty(input);
  }
}
