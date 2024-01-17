import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/base_usecases/base_usecase.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/requests/mortgage_requests/request_mortgage_values.dart';

class TotalNumOfMortgageUnitsUsecase
    implements BaseUseCase<RequestMortgageValues, List<BaseRentResponse>> {
  final Repository repository;

  TotalNumOfMortgageUnitsUsecase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestMortgageValues input) async {
    return await repository.getTotalNumberOfMortgageUnits(input);
  }
}
