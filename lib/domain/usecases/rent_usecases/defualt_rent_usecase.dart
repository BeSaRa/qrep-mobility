import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class RentDefaultUseCase implements BaseUseCaseEmptyInput<RentDefault> {
  final Repository repository;

  RentDefaultUseCase(this.repository);

  @override
  Future<Result<RentDefault, FailureModel>> execute() async {
    return await repository.getRentDefault();
  }
}
