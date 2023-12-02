import 'package:ebla/domain/models/models.dart';
import 'package:ebla/domain/models/requests/broker_requests/request_broker_values.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class BrokerTransactionUseCase
    implements BaseUseCase<RequestBrokerValues, RealEstateBrokerTransactions> {
  final Repository repository;

  BrokerTransactionUseCase(this.repository);

  @override
  Future<Result<RealEstateBrokerTransactions, FailureModel>> execute(
      RequestBrokerValues input) async {
    return await repository.getBrokerTransactions(input);
  }
}
