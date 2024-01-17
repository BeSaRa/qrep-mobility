import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../models/cms_models/app_settings/app_settings.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class AppSettingsUseCase implements BaseUseCaseEmptyInput<AppSettingsResponse> {
  final Repository repository;

  AppSettingsUseCase(this.repository);

  @override
  Future<Result<AppSettingsResponse, FailureModel>> execute() async {
    return await repository.getAppSettings();
  }
}
