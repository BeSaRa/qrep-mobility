import 'package:ebla/domain/repository/repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../models/rent_models/rent_models.dart';
import '../../models/requests/sell_requests/request_sell_values.dart';
import '../base_usecases/base_usecase.dart';

class SellDefaultUseCase
    implements BaseUseCase<RequestSellValues, List<RentDefault>> {
  final Repository repository;

  SellDefaultUseCase(this.repository);

  @override
  Future<Result<List<RentDefault>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.getSellDefault(input);
  }
}
