import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class ChatbotUsecase
    implements BaseUseCase<ChatbotRequestModel, ChatbotResponseModel> {
  final Repository repository;

  ChatbotUsecase(this.repository);

  @override
  Future<Result<ChatbotResponseModel, FailureModel>> execute(
      ChatbotRequestModel body) async {
    return await repository.sendMessageToChatbot(body);
  }
}
