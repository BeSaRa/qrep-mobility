import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_rent.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/base_usecases/base_usecase.dart';
import 'package:multiple_result/multiple_result.dart';

class TotalRentedSpaceUsecase
    implements BaseUseCase<RentRequest, List<BaseRentResponse>> {
  final Repository repository;

  TotalRentedSpaceUsecase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RentRequest input) async {
    return await repository.getTotalRentedSpace(input);
  }
}
