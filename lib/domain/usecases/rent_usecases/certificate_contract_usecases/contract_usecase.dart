import 'package:multiple_result/multiple_result.dart';

import '../../../../data/network/failure_model/failure.dart';
import '../../../models/rent_models/rent_models.dart';
import '../../../models/requests/rent_requests/request_rent.dart';
import '../../../repository/repository.dart';
import '../../base_usecases/base_usecase.dart';

class ContractCountUsecase
    implements BaseUseCase<RentRequest, List<BaseRentResponse>> {
  final Repository repository;

  ContractCountUsecase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RentRequest input) async {
    return await repository.contractCount(input);
  }
}
