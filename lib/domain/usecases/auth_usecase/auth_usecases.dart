import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/models.dart';

class LoginUsecases
    implements BaseUseCaseFailureResponse<RequestAuth, AuthResponse> {
  final Repository repository;

  LoginUsecases({required this.repository});

  @override
  Future<Result<AuthResponse, FailureResponse>> execute(
      RequestAuth input) async {
    return await repository.login(input);
  }
}
