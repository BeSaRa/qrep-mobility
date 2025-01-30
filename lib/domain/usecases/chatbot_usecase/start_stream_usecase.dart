import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class StartStreamUsecase
    implements BaseUseCaseEmptyInput<StartStreamModel> {
  final Repository repository;

  StartStreamUsecase(this.repository);

  @override
  Future<Result<StartStreamModel, FailureModel>> execute() async {
    return await repository.startStream();
  }
}
