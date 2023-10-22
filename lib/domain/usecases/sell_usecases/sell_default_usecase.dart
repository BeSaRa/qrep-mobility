import 'package:ebla/domain/repository/repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';
import '../../models/rent_models/rent_models.dart';
import '../../models/requests/rent_requests/request_mean_value.dart';
import '../base_usecases/base_usecase.dart';

class SellDefaultUseCase
    implements BaseUseCase<RequestMeanValue, List<RentDefault>> {
  final Repository repository;

  SellDefaultUseCase(this.repository);

  @override
  Future<Result<List<RentDefault>, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.getSellDefault(input);
  }
}
