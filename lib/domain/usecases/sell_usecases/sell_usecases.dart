import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';
import '../../models/rent_models/rent_models.dart';
import '../../repository/repository.dart';
import '../usecases.dart';

class GetSellLookupUseCase
    implements BaseUseCaseEmptyInput<RentLookupResponse> {
  final Repository repository;

  GetSellLookupUseCase(this.repository);
  @override
  Future<Result<RentLookupResponse, FailureModel>> execute() async {
    return await repository.getLockupSell();
  }
}
