import 'package:ebla/domain/models/auth/auth_models.dart';
import 'package:ebla/domain/repository/phase2_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';

import '../base_usecases/base_usecase.dart';

class AskForLoginUseCase implements BaseUseCaseEmptyInput<RequestLoginModel> {
  final Phase2Repository repository;

  AskForLoginUseCase(this.repository);

  @override
  Future<Result<RequestLoginModel, FailureModel>> execute() async {
    return await repository.askForLogin();
  }
}
