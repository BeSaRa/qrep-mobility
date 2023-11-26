import 'package:ebla/domain/models/models.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';
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
