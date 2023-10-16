import 'package:multiple_result/multiple_result.dart';

import '../../data/newtwok/failure_model/failure.dart';
import '../models/rent_models/rent_models.dart';
import '../models/requests/rent_requests/request_mean_value.dart';

abstract class Repository {
  Future<Result<RentLookupResponse, FailureModel>> getLockupRent();

  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalContracts(
      RequestMeanValue requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> meanValue(
      RequestMeanValue requestMeanValue);

  Future<Result<List<MeanAreaResponse>, FailureModel>> meanArea(
      RequestMeanValue requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalRentedUnits(
      RequestMeanValue requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> certificateCount(
      RequestMeanValue requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> contractCount(
      RequestMeanValue requestMeanValue);

  Future<Result<List<RentDefault>, FailureModel>> getRentDefault(
      RequestMeanValue requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> contractValue(
      RequestMeanValue requestMeanValue);

  Future<Result<RentListSummary, FailureModel>> getRentSummary(
      RequestMeanValue requestMeanValue);
}
