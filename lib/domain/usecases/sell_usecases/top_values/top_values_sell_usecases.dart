import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../data/newtwok/failure_model/failure.dart';
import '../../../models/rent_models/rent_models.dart';
import '../../../models/requests/sell_requests/request_sell_values.dart';
import '../../../repository/repository.dart';

class CountTransictionNumberUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  CountTransictionNumberUseCase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.countTransictionNumber(input);
  }
}

class CountUnitPriceUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  CountUnitPriceUseCase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.countUnitPrice(input);
  }
}

class CountTransictionsValueUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  CountTransictionsValueUseCase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.countTransictionsValue(input);
  }
}

class AreasUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  AreasUseCase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.countAreas(input);
  }
}

class RealStateNumberUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  RealStateNumberUseCase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.realStateNumber(input);
  }
}

class RealStateNumberMeterUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  RealStateNumberMeterUseCase(this.repository);
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.realStateNumberMeter(input);
  }
}
