import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';
import '../../models/Auth/auth_models.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class ForgetPasswordUseCase
    implements BaseUseCaseFailureResponse<String, ResetPasswordModel> {
  final Repository repository;

  ForgetPasswordUseCase({required this.repository});

  @override
  Future<Result<ResetPasswordModel, FailureResponse>> execute(
      String input) async {
    return await repository.resetPassword(input);
  }
}
