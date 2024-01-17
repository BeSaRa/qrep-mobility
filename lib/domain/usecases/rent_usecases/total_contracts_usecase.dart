import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/rent_models/rent_models.dart';
import '../../models/requests/rent_requests/request_rent.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class TotalContractsUseCase
    implements BaseUseCase<RentRequest, List<BaseRentResponse>> {
  final Repository repository;

  TotalContractsUseCase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RentRequest input) async {
    return await repository.getTotalContracts(input);
  }
}
