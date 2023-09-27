import 'package:multiple_result/multiple_result.dart';

import '../../../data/newtwok/failure_model/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Result<Out, FailureModel>> execute(In input);
}

abstract class BaseUseCaseEmptyInput<Out> {
  Future<Result<Out, FailureModel>> execute();
}
