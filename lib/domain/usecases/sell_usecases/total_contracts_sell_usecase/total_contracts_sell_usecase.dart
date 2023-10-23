import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';

import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/multiple_result.dart';

class TotalContractsSellUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  TotalContractsSellUseCase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.getTotalContractsSell(input);
  }
}
