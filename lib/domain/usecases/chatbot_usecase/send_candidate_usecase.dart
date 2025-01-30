import 'package:multiple_result/multiple_result.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';

import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class SendCandidateUsecase
    implements BaseUseCaseCloseStreamFailureResponse<MainSendCandidateRequestModelById, SendAnswerResponseModel> {
  final Repository repository;

  SendCandidateUsecase(this.repository);

  @override
  Future<Result<SendAnswerResponseModel, FailureCloseStreamModel>> execute(
     MainSendCandidateRequestModelById request) async {
    return await repository.sendCandidate(request.request,request.id);
  }
}

class MainSendCandidateRequestModelById {
  final MainSendCandidateRequestModel request;
  final String id;
  MainSendCandidateRequestModelById({
    required this.request,
    required this.id,
  });
}