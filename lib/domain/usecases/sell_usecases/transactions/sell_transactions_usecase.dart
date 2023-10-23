import 'package:ebla/domain/models/sell_models/sell_models.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../data/newtwok/failure_model/failure.dart';
import '../../../models/requests/sell_requests/request_sell_values.dart';
import '../../../repository/repository.dart';
import '../../usecases.dart';

class SellTransactionUseCase
    implements BaseUseCase<RequestSellValues, SellTransactionResponse> {
  final Repository repository;

  SellTransactionUseCase(this.repository);

  @override
  Future<Result<SellTransactionResponse, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.getSellTransaction(input);
  }
}
