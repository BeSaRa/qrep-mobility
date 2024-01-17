import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/sell_requests/request_sell_values.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/base_usecases/base_usecase.dart';
import 'package:multiple_result/multiple_result.dart';

class TotalSoldUnitsUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  TotalSoldUnitsUseCase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.getTotalSoldUnits(input);
  }
}
