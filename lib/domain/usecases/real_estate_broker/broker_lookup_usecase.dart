import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../models/broker_models/broker_models.dart';
import '../../repository/repository.dart';
import '../usecases.dart';

class BrokerLookUpUseCase
    implements BaseUseCaseEmptyInput<RealEstateBrokerLookUp> {
  final Repository repository;

  BrokerLookUpUseCase(this.repository);

  @override
  Future<Result<RealEstateBrokerLookUp, FailureModel>> execute() async {
    return await repository.getLockupBrokers();
  }
}

class BrokerLookOVUpUseCase
    implements BaseUseCaseEmptyInput<RealEstateBrokerLookUp> {
  final Repository repository;

  BrokerLookOVUpUseCase(this.repository);

  @override
  Future<Result<RealEstateBrokerLookUp, FailureModel>> execute() async {
    return await repository.getLockupOVBrokers();
  }
}
