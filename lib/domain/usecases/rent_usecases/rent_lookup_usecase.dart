import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/rent_models/rent_models.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class GetRentLookupUseCase implements BaseUseCaseEmptyInput<LookupResponse> {
  final Repository repository;

  GetRentLookupUseCase(this.repository);

  @override
  Future<Result<LookupResponse, FailureModel>> execute() async {
    return await repository.getLockupRent();
  }
}
