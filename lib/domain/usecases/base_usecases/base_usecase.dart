import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/network/failure_model/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Result<Out, FailureModel>> execute(In input);
}

abstract class BaseUseCaseEmptyInput<Out> {
  Future<Result<Out, FailureModel>> execute();
}

abstract class BaseUseCaseEmptyInputFailureResponse<Out> {
  Future<Result<Out, FailureResponse>> execute();
}

abstract class BaseUseCaseFailureResponse<In, Out> {
  Future<Result<Out, FailureResponse>> execute(In input);
}

//----------------------------------- Close stream ------------------------
abstract class BaseUseCaseEmptyInputCloseStreamFailureResponse<Out> {
  Future<Result<Out, FailureAIModel>> execute();
}

abstract class BaseUseCaseCloseStreamFailureResponse<In, Out> {
  Future<Result<Out, FailureAIModel>> execute(In input);
}
