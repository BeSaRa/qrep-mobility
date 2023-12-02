import 'package:ebla/domain/models/cms_models/user/user_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class UpdateFcmTokenUseCase implements BaseUseCase<FcmInput,UserResponse> {
  final Repository repository;

  UpdateFcmTokenUseCase(this.repository);

  @override
  Future<Result<UserResponse, FailureModel>> execute(FcmInput input) async {
    return await repository.updateFcmToken(input);
  }
}
class FcmInput{
  final String id;
  final  String fcm;

  FcmInput({required this.id, required this.fcm});
}