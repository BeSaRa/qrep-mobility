import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class Chatfaqusecase implements BaseUseCase<String, List<ChatbotFAQResponseModel>> {
  final Repository repository;

  Chatfaqusecase(this.repository);

  @override
  Future<Result<List<ChatbotFAQResponseModel>, FailureModel>> execute(
      String botName) async {
    return await repository.getChatFAQ(botName);
  }
}
