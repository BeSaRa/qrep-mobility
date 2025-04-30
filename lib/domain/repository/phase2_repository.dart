import 'package:multiple_result/multiple_result.dart';

import '../../data/network/failure_model/failure.dart';

abstract class Phase2Repository {
  Future<Result<String, FailureModel>> getRedirectUrl();
}
