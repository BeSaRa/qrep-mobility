import 'package:ebla/data/newtwok/failure_model/failure.dart';

import 'package:multiple_result/src/result.dart';

import '../../models/rent_models/rent_models.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class GetRentLookupUseCase
    implements BaseUseCaseEmptyInput<RentLookupResponse> {
  final Repository repository;

  GetRentLookupUseCase(this.repository);
  @override
  Future<Result<RentLookupResponse, FailureModel>> execute() async {
    return repository.getLockupRent();
  }
}
