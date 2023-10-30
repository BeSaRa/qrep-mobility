import 'package:ebla/domain/models/cms_models/about/about_model.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/domain/models/cms_models/news/news_model.dart';
import 'package:ebla/domain/models/mrtgage_models/mortgage_models.dart';
import 'package:ebla/domain/models/sell_models/sell_models.dart';
import 'package:ebla/domain/models/translations_model/translations_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../data/newtwok/failure_model/failure.dart';
import '../models/rent_models/rent_models.dart';
import '../models/requests/mortgage_requests/request_mortgage_values.dart';
import '../models/requests/rent_requests/request_mean_value.dart';
import '../models/requests/sell_requests/request_sell_values.dart';

abstract class Repository {
  //-------------CMS
  Future<Result<TranslationsModel, FailureModel>> getTranslations(int limit);

  Future<Result<AboutResponse, FailureModel>> getAbout();

  Future<Result<NewsResponse, FailureModel>> getNews();
  Future<Result<NewsByIdResponse, FailureModel>> getNewsById({required int id});

  Future<Result<LawsResponse, FailureModel>> getLaws();

  Future<Result<LawByIdResponse, FailureModel>> getLawById(int id);

//-------------Rent----------------
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

  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalRentedSpace(
      RequestMeanValue requestMeanValue);
  Future<Result<List<BaseRentResponse>, FailureModel>> meanRentAmount(
      RequestMeanValue requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> rentValueAmount(
      RequestMeanValue requestMeanValue);

  //----------------------------sell---------------------------------------
  Future<Result<RentLookupResponse, FailureModel>> getLockupSell();

  // KPI1
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalContractsSell(
      RequestSellValues requestSellValues);

  // KPI4
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalSoldUnits(
      RequestSellValues requestSellValues);

  // KPI7
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalTransactionsSell(
      RequestSellValues requestSellValues);

  // KPI10
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalSoldSpaces(
      RequestSellValues requestSellValues);

  // KPI13
  Future<Result<List<BaseRentResponse>, FailureModel>> getMeanValueSell(
      RequestSellValues requestSellValues);

  // KPI16
  Future<Result<List<BaseRentResponse>, FailureModel>> getMeanSoldArea(
      RequestSellValues requestSellValues);

  Future<Result<List<RentDefault>, FailureModel>> getSellDefault(
      RequestSellValues requestSellValues);

  Future<Result<SellTransactionResponse, FailureModel>> getSellTransaction(
      RequestSellValues requestSellValues);

  //----------------------------Mortgage----------------------------------------

  //look up
  Future<Result<RentLookupResponse, FailureModel>> getLockupMortgage();

  // KPI1
  Future<Result<List<BaseRentResponse>, FailureModel>>
      getTotalMortgageTransactions(RequestMortgageValues requestSellValues);

  // KPI3
  Future<Result<List<BaseRentResponse>, FailureModel>>
      getTotalNumberOfMortgageUnits(RequestMortgageValues requestSellValues);

  // KPI5
  Future<Result<List<BaseRentResponse>, FailureModel>>
      getTotalValueOfMortgageTransactions(
          RequestMortgageValues requestSellValues);

  //KPI7
  Future<Result<MortgageTransactionResponse, FailureModel>>
      getMortgageTransactions(RequestMortgageValues requestSellValues);
}
