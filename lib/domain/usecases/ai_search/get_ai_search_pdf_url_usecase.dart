import 'package:ebla/domain/models/ai_search_models/ai_search_model.dart';
import 'package:ebla/domain/models/requests/ai_search_models/ai_search_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../models/chatboot/chatbot_response_model.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class GetAiSearchPdfUrlUsecase
    implements BaseUseCaseCloseStreamFailureResponse<String, String> {
  final Repository repository;

  GetAiSearchPdfUrlUsecase(this.repository);

  @override
  Future<Result<String, FailureCloseStreamModel>> execute(
      String blobUrl) async {
    return await repository.getAiSearchPdfUrl(blobUrl);
  }
}
