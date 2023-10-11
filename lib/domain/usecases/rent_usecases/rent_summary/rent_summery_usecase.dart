import 'package:multiple_result/multiple_result.dart';

import '../../../../data/newtwok/failure_model/failure.dart';
import '../../../models/rent_models/rent_models.dart';
import '../../../models/requests/rent_requests/request_mean_value.dart';
import '../../../repository/repository.dart';
import '../../base_usecases/base_usecase.dart';

class RentSummeryUseCase
    implements BaseUseCase<RequestMeanValue, RentListSummary> {
  late final Repository repository;

  RentSummeryUseCase(this.repository);

  @override
  Future<Result<RentListSummary, FailureModel>> execute(
      RequestMeanValue input) async {
    return await repository.getRentSummary(input);
  }
}
