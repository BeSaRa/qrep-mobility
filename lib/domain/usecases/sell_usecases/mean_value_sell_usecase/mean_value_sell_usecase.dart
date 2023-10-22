import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/base_usecases/base_usecase.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../models/rent_models/rent_models.dart';
import '../../../models/requests/rent_requests/request_mean_value.dart';

class MeanValueSellUsecase
    implements BaseUseCase<RequestMeanValue, List<BaseRentResponse>> {
  final Repository repository;

  MeanValueSellUsecase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.getMeanValueSell(input);
  }
}
