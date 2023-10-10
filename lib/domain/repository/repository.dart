import 'package:multiple_result/multiple_result.dart';

import '../../data/newtwok/failure_model/failure.dart';
import '../models/rent_models/rent_models.dart';
import '../models/requests/rent_requests/request_mean_value.dart';

abstract class Repository {
  Future<Result<RentLookupResponse, FailureModel>> getLockupRent();

  Future<Result<List<BaseRentResponse>, FailureModel>> meanValue(
      RequestMeanValue requestMeanValue);

  Future<Result<List<MeanAreaResponse>, FailureModel>> meanArea(
      RequestMeanValue requestMeanValue);

  Future<Result<RentDefault, FailureModel>> getRentDefault();

  Future<Result<List<BaseRentResponse>, FailureModel>> contractValue(
      RequestMeanValue requestMeanValue);
}
