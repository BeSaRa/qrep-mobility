import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';

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
