import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../models/broker_models/broker_models.dart';
import '../../models/requests/broker_requests/request_broker_values.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class BrokerCountUseCase
    implements BaseUseCase<RequestBrokerValues, RealEstateBrokerKpi1> {
  final Repository repository;

  BrokerCountUseCase(this.repository);

  @override
  Future<Result<RealEstateBrokerKpi1, FailureModel>> execute(
      RequestBrokerValues input) async {
    return await repository.getBrokersCount(input);
  }
}
