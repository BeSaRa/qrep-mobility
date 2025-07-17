import 'package:multiple_result/multiple_result.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';

import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class SendFeedbackUsecase
    implements
        BaseUseCaseCloseStreamFailureResponse<MainSendFeedbackRequestModel,
            MainChatbotResponseModel> {
  final Repository repository;

  SendFeedbackUsecase(this.repository);

  @override
  Future<Result<MainChatbotResponseModel, FailureAIModel>> execute(
      MainSendFeedbackRequestModel request) async {
    return await repository.sendFeedback(request.feedback, request.convId);
  }
}

class MainSendFeedbackRequestModel {
  final int feedback;
  final String convId;
  MainSendFeedbackRequestModel({
    required this.feedback,
    required this.convId,
  });
}
