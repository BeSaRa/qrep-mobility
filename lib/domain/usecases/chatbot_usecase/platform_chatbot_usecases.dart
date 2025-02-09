import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class PlatformChatbotUsecases
    implements BaseUseCase<PlatformChatbotRequestModel, PlatformChatbotResponseModel> {
  final Repository repository;

  PlatformChatbotUsecases(this.repository);

  @override
  Future<Result<PlatformChatbotResponseModel, FailureModel>> execute(
      PlatformChatbotRequestModel body) async {
        
    return await repository.sendMessageToPlatformChatbot(body);
  }
}
