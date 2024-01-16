import 'package:multiple_result/multiple_result.dart';

import '../../../../data/newtwok/failure_model/failure.dart';
import '../../../models/rent_models/rent_models.dart';
import '../../../models/requests/rent_requests/request_rent.dart';
import '../../../repository/repository.dart';
import '../../base_usecases/base_usecase.dart';

class MeanAreaUsecase
    implements BaseUseCase<RentRequest, List<MeanAreaResponse>> {
  final Repository repository;

  MeanAreaUsecase(this.repository);

  @override
  Future<Result<List<MeanAreaResponse>, FailureModel>> execute(
      RentRequest input) async {
    return await repository.meanArea(input);
  }
}
