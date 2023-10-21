import 'package:multiple_result/multiple_result.dart';

import '../../data/newtwok/failure_model/failure.dart';
import '../models/rent_models/rent_models.dart';
import '../models/requests/rent_requests/request_mean_value.dart';

abstract class SellRepository {
  Future<Result<List<RentDefault>, FailureModel>> getSellDefault(
      RequestMeanValue requestMeanValue);
}
