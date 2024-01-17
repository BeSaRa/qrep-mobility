import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class GetCmsTokenUseCase implements BaseUseCaseEmptyInput<String> {
  final Repository repository;

  GetCmsTokenUseCase(this.repository);

  @override
  Future<Result<String, FailureModel>> execute() async {
    return await repository.getCmsToken();
  }
}
