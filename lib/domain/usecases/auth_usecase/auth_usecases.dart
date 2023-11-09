import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/Auth/auth_models.dart';
import 'package:ebla/domain/models/Auth/requests_auth/request_auth.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/src/result.dart';

class LoginUsecases implements BaseUseCase<RequestAuth, AuthResponse> {
  final Repository repository;

  LoginUsecases({required this.repository});
  @override
  Future<Result<AuthResponse, FailureModel>> execute(RequestAuth input) async {
    return await repository.login(input);
  }
}
