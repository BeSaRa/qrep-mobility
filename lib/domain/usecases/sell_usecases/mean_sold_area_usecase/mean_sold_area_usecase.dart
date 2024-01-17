import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/base_usecases/base_usecase.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../models/rent_models/rent_models.dart';

class MeanSoldAreaUsecase
    implements
        BaseUseCase<RequestSellValues, List<BaseRentResponsePerAreaUnitType>> {
  final Repository repository;

  MeanSoldAreaUsecase(this.repository);

  @override
  Future<Result<List<BaseRentResponsePerAreaUnitType>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.getMeanSoldArea(input);
  }
}
