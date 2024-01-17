import 'package:ebla/domain/usecases/usecases.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../data/network/failure_model/failure.dart';
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
    return await repository.sellContractCount(input);
  }
}

class CountUnitPriceUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  CountUnitPriceUseCase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.avgPricePerUnit(input);
  }
}

class CountTransictionsValueUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  CountTransictionsValueUseCase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.transactionsValue(input);
  }
}

class CountAreasUseCase
    implements BaseUseCase<RequestSellValues, List<BaseRentResponse>> {
  final Repository repository;

  CountAreasUseCase(this.repository);

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> execute(
      RequestSellValues input) async {
    return await repository.soldAreas(input);
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
    return await repository.averagePricePerSquareFoot(input);
  }
}
