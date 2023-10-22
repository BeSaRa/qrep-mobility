import 'package:ebla/domain/models/sell_models/sell_models.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../data/newtwok/failure_model/failure.dart';
import '../../../models/requests/rent_requests/request_mean_value.dart';
import '../../../repository/repository.dart';
import '../../usecases.dart';

class SellTransactionUseCase
    implements BaseUseCase<RequestMeanValue, SellTransactionResponse> {
  final Repository repository;

  SellTransactionUseCase(this.repository);

  @override
  Future<Result<SellTransactionResponse, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.getSellTransaction(input);
  }
}
