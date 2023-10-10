import 'package:multiple_result/multiple_result.dart';

import '../../data/newtwok/failure_model/failure.dart';
import '../models/rent_models/rent_models.dart';

abstract class Repository {
  Future<Result<RentLookupResponse, FailureModel>> getLockupRent();

  Future<Result<RentDefault, FailureModel>> getRentDefault();
}
