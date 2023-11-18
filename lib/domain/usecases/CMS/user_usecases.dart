import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/cms_models/user/user_model.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/src/result.dart';

class UserUsecase implements BaseUseCaseEmptyInput<UserResponse> {
  final Repository repository;

  UserUsecase({required this.repository});
  @override
  Future<Result<UserResponse, FailureModel>> execute() async {
    return await repository.getUserInfo();
  }
}
