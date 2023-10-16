import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';
import '../../models/requests/rent_requests/request_mean_value.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class RentDefaultUseCase
    implements BaseUseCase<RequestMeanValue, List<RentDefault>> {
  final Repository repository;

  RentDefaultUseCase(this.repository);

  @override
  Future<Result<List<RentDefault>, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.getRentDefault(input);
  }
}
