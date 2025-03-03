import 'package:ebla/domain/models/ai_search_models/ai_search_model.dart';
import 'package:ebla/domain/models/requests/ai_search_models/ai_search_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';
import '../../repository/repository.dart';
import '../base_usecases/base_usecase.dart';

class AiSearchUsecase
    implements BaseUseCase<AiSearchRequestModel, AiSearchResponseModel> {
  final Repository repository;

  AiSearchUsecase(this.repository);

  @override
  Future<Result<AiSearchResponseModel, FailureModel>> execute(
      AiSearchRequestModel body) async {
    return await repository.aiSearchFun(body);
  }
}
