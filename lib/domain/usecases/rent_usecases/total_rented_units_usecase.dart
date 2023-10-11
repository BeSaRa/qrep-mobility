import 'package:ebla/data/newtwok/failure_model/failure.dart';

import 'package:multiple_result/multiple_result.dart';

import '../../models/rent_models/rent_models.dart';
import '../../models/requests/rent_requests/request_mean_value.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class TotalRentedUnitsUseCase
    implements BaseUseCase<RequestMeanValue, List<BaseRentResponse>> {
  final Repository repository;

  TotalRentedUnitsUseCase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.getTotalRentedUnits(input);
  }
}
