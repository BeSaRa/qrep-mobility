import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../data/network/failure_model/failure.dart';
import '../../../models/rent_models/rent_models.dart';
import '../../../repository/repository.dart';
import '../../base_usecases/base_usecase.dart';

class TotalTransactionSellUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  TotalTransactionSellUseCase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.getTotalTransactionsSell(input);
  }
}
