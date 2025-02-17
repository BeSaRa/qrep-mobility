import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../repository/repository.dart';
import '../usecases.dart';

class CloseStreamUsecase implements BaseUseCaseCloseStreamFailureResponse<String, SendAnswerResponseModel> {
  final Repository repository;

  CloseStreamUsecase(this.repository);

  @override
  Future<Result<SendAnswerResponseModel, FailureCloseStreamModel>> execute(String id) async {

    return await repository.closeStream(id);
  }
}
