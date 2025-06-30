import 'package:multiple_result/multiple_result.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';

import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class SendAnswerUsecase
    implements
        BaseUseCaseCloseStreamFailureResponse<MainSendAnswerRequestModelById,
            MainChatbotResponseModel> {
  final Repository repository;

  SendAnswerUsecase(this.repository);

  @override
  Future<Result<MainChatbotResponseModel, FailureAIModel>> execute(
      MainSendAnswerRequestModelById request) async {
    return await repository.sendAnswer(request.request, request.id);
  }
}

class MainSendAnswerRequestModelById {
  final MainSendAnswerRequestModel request;
  final String id;
  MainSendAnswerRequestModelById({
    required this.request,
    required this.id,
  });
}
