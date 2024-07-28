import 'package:multiple_result/multiple_result.dart';

import '../../data/network/failure_model/failure.dart';
import '../models/cms_models/app_settings/app_settings.dart';
import '../models/cms_models/user/requests/update_info_model.dart';
import '../models/favourite/favourite_models.dart';
import '../models/models.dart';
import '../models/requests/broker_requests/request_broker_values.dart';

abstract class Repository {
  //-------------CMS
  Future<Result<String, FailureModel>> getCmsToken();

  Future<Result<AppSettingsResponse, FailureModel>> getAppSettings();

  Future<Result<TranslationsModel, FailureModel>> getTranslations(int limit);

  Future<Result<AboutResponse, FailureModel>> getAbout();

  Future<Result<NewsResponse, FailureModel>> getNews();

  Future<Result<NewsByIdResponse, FailureModel>> getNewsById({required int id});

  Future<Result<LawsResponse, FailureModel>> getLaws({required int limit});

  Future<Result<LawByIdResponse, FailureModel>> getLawById(int id);

  Future<Result<FaqResponse, FailureModel>> getFaq(int id);

  Future<Result<UserResponse, FailureModel>> updateFcmToken(input);

//-------------Rent----------------
  Future<Result<LookupResponse, FailureModel>> getLockupRent();

  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalContracts(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> meanValue(
      RentRequest requestMeanValue);

  Future<Result<List<MeanAreaResponse>, FailureModel>> meanArea(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalRentedUnits(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> certificateCount(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> contractCount(
      RentRequest requestMeanValue);

  Future<Result<List<RentDefault>, FailureModel>> getRentDefault(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> contractValue(
      RentRequest requestMeanValue);

  Future<Result<RentListSummary, FailureModel>> getRentSummary(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalRentedSpace(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> meanRentAmount(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> rentValueAmount(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> meanRentValueMeter(
      RentRequest requestMeanValue);

  Future<Result<List<BaseRentResponse>, FailureModel>> getRentedAreas(
      RentRequest requestMeanValue);

  //----------------------------sell---------------------------------------
  Future<Result<LookupResponse, FailureModel>> getLockupSell();

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
  Future<Result<List<BaseRentResponsePerAreaUnitType>, FailureModel>>
      getTotalSoldSpaces(RequestSellValues requestSellValues);

  // KPI13
  Future<Result<List<BaseRentResponse>, FailureModel>> getMeanValueSell(
      RequestSellValues requestSellValues);

  // KPI16
  Future<Result<List<BaseRentResponsePerAreaUnitType>, FailureModel>>
      getMeanSoldArea(RequestSellValues requestSellValues);

  Future<Result<List<RentDefault>, FailureModel>> getSellDefault(
      RequestSellValues requestSellValues);

  Future<Result<SellTransactionResponse, FailureModel>> getSellTransaction(
      RequestSellValues requestSellValues);

  Future<Result<List<BaseRentResponse>, FailureModel>> sellContractCount(
      RequestSellValues requestSellValues);

  Future<Result<List<BaseRentResponse>, FailureModel>> avgPricePerUnit(
      RequestSellValues requestSellValues);

  Future<Result<List<BaseRentResponse>, FailureModel>> transactionsValue(
      RequestSellValues requestSellValues);

  Future<Result<List<BaseRentResponse>, FailureModel>> soldAreas(
      RequestSellValues requestSellValues);

  Future<Result<List<BaseRentResponse>, FailureModel>> realStateNumber(
      RequestSellValues requestSellValues);

  Future<Result<List<BaseRentResponse>, FailureModel>>
      averagePricePerSquareFoot(RequestSellValues requestSellValues);

  //----------------------------Mortgage----------------------------------------

  //look up
  Future<Result<LookupResponse, FailureModel>> getLockupMortgage();

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

  //Auth
  Future<Result<AuthResponse, FailureResponse>> login(RequestAuth requestAuth);

  Future<Result<ResetPasswordModel, FailureResponse>> resetPassword(
      String requestAuth);

  Future<Result<AuthResponse, FailureResponse>> refreshToken(
      RefreshToken refreshToken);

  //Profile
  Future<Result<UserResponse, FailureModel>> getUserInfo();

  Future<Result<UserResponse, FailureResponse>> updateUserInfo(
      {required String id, required RequestUpdateInfoModel requestUpdateInfo});

  //Main Menu

  Future<Result<MainMenuResponse, FailureResponse>> mainMenu();

  //// ---------- real estate broker

  Future<Result<RealEstateBrokerLookUp, FailureModel>> getLockupBrokers();

  Future<Result<RealEstateBrokerLookUp, FailureModel>> getLockupOVBrokers();

  Future<Result<RealEstateBrokerTransactions, FailureModel>>
      getBrokerTransactions(RequestBrokerValues input);

  Future<Result<RealEstateBrokerKpi1, FailureModel>> getBrokersCount(
      RequestBrokerValues input);

  ////------------favourite-------

  Future<Result<List<FavouriteResponse>, FailureModel>> getUserFavourites(
      String id);

  Future<Result<bool, FailureModel>> deleteFavourite(int id);

  Future<Result<FavouriteResponse, FailureModel>> updateFavourite(
      FavouriteResponse id);

  Future<Result<FavouriteResponse, FailureModel>> createFavourite(
      FavouriteResponse id);
}
