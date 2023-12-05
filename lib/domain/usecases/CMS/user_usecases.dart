import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/cms_models/user/user_model.dart';
import 'package:ebla/domain/repository/repository.dart';
import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/src/result.dart';

import '../../models/cms_models/main_menu_models/main_menu_models.dart';
import '../../models/cms_models/user/requests/update_info_model.dart';

class UserUsecase implements BaseUseCaseEmptyInput<UserResponse> {
  final Repository repository;

  UserUsecase({required this.repository});
  @override
  Future<Result<UserResponse, FailureModel>> execute() async {
    return await repository.getUserInfo();
  }
}

class MainMenuUsecase
    implements BaseUseCaseEmptyInputFailureResponse<MainMenuResponse> {
  final Repository repository;

  MainMenuUsecase({required this.repository});
  @override
  Future<Result<MainMenuResponse, FailureResponse>> execute() async {
    return await repository.mainMenu();
  }
}

class UpdateInfoUsecase
    implements
        BaseUseCaseFailureResponse<
            ({String id, RequestUpdateInfoModel requestUpdateInfo}),
            UserResponse> {
  final Repository repository;

  UpdateInfoUsecase({required this.repository});

  @override
  Future<Result<UserResponse, FailureResponse>> execute(
      ({String id, RequestUpdateInfoModel requestUpdateInfo}) input) async {
    return await repository.updateUserInfo(
        id: input.id, requestUpdateInfo: input.requestUpdateInfo);
  }
}
