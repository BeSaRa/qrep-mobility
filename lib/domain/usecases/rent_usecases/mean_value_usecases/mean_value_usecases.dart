import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/base_usecases/base_usecase.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../models/rent_models/rent_models.dart';
import '../../../models/requests/rent_requests/request_rent.dart';

class MeanValueUsecase
    implements BaseUseCase<RentRequest, List<BaseRentResponse>> {
  final Repository repository;

  MeanValueUsecase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RentRequest input) async {
    return await repository.meanValue(input);
  }
}
