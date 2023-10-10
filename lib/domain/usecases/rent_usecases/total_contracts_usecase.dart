import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/rent_models/rent_models.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class TotalContractsUseCase
    implements BaseUseCaseEmptyInput<List<BaseRentResponse>> {
  final Repository repository;

  TotalContractsUseCase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute() async {
    return await repository.getTotalContracts();
  }
}
