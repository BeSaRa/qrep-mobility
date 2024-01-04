import 'package:dio/dio.dart';
import 'package:ebla/data/newtwok/end_points.dart';
import 'package:ebla/domain/models/requests/broker_requests/request_broker_values.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constants.dart';
import '../../domain/models/cms_models/app_settings/app_settings.dart';
import '../../domain/models/cms_models/user/requests/update_info_model.dart';
import '../../domain/models/models.dart';

part 'app_api.g.dart';

//*******************genereate command************************************
//dart run build_runner build  --delete-conflicting-outputs
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
//********************************************************************** */
@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

//-----------------------Rent---------------------------
  @POST(EndPoints.rentDefault)
  Future<HttpResponse<List<RentDefault>>> getRentDefault(
      @Body() RequestMeanValue requestMeanValue);

  @GET(EndPoints.lockupRent)
  Future<HttpResponse<RentLookupResponse>> getLockupRent();

  @POST(EndPoints.meanValue)
  Future<HttpResponse<List<BaseRentResponse>>> meanValue(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.meanArea)
  Future<HttpResponse<List<MeanAreaResponse>>> meanArea(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.certificateCount)
  Future<HttpResponse<List<BaseRentResponse>>> certificateCount(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.contractCount)
  Future<HttpResponse<List<BaseRentResponse>>> contractCount(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.contractValue)
  Future<HttpResponse<List<BaseRentResponse>>> contractValue(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.totalContracts)
  Future<HttpResponse<List<BaseRentResponse>>> totalContract(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.totalRentedUnits)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalRentedUnits(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.rentSummary)
  Future<HttpResponse<RentListSummary>> rentSummary(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.totalRentedSpace)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalRentedSpace(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.avgPriceTop)
  Future<HttpResponse<List<BaseRentResponse>>> avgMeanRentAmount(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.rentAmountTop)
  Future<HttpResponse<List<BaseRentResponse>>> rentAmount(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.meanRentMeter)
  Future<HttpResponse<List<BaseRentResponse>>> meanRentMeter(
      @Body() RequestMeanValue requestMeanValue);

  @POST(EndPoints.rentedAreas)
  Future<HttpResponse<List<BaseRentResponse>>> getRentedAreas(
      @Body() RequestMeanValue requestMeanValue);

  //----------------------------------Sell--------------------------------------
  @GET(EndPoints.lookupSell)
  Future<HttpResponse<RentLookupResponse>> getLockupSell();

  // KPI1

  // KPI1
  @POST(EndPoints.totalContractsSell)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalContractsSell(
      @Body() RequestSellValues requestSellValues);

  // KPI4
  @POST(EndPoints.totalSoldUnits)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalSoldUnits(
      @Body() RequestSellValues requestSellValues);

  // KPI7
  @POST(EndPoints.totalTransactionsSell)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalTransactionsSell(
      @Body() RequestSellValues requestSellValues);

  // KPI10
  @POST(EndPoints.totalSoldSpaces)
  Future<HttpResponse<List<BaseRentResponsePerAreaUnitType>>>
      getTotalSoldSpaces(@Body() RequestSellValues requestMeanValue);

  // KPI13
  @POST(EndPoints.meanValueSell)
  Future<HttpResponse<List<BaseRentResponse>>> getMeanValueSell(
      @Body() RequestSellValues requestSellValues);

  // KPI16
  @POST(EndPoints.meanSoldArea)
  Future<HttpResponse<List<BaseRentResponsePerAreaUnitType>>> getMeanSoldArea(
      @Body() RequestSellValues requestSellValues);

  //sell
  @POST(EndPoints.sellDefault)
  Future<HttpResponse<List<RentDefault>>> getSellDefault(
      @Body() RequestSellValues requestSellValues);

  @POST(EndPoints.sellTransactions)
  Future<HttpResponse<SellTransactionResponse>> getSellTransactions(
      @Body() RequestSellValues requestSellValues);

  //-----------------Top 10 sells ----------------------------
  @POST(EndPoints.sellContractCount)
  Future<HttpResponse<List<BaseRentResponse>>> sellContractCount(
      @Body() RequestSellValues requestSellValues);

  @POST(EndPoints.avgPricePerUnit)
  Future<HttpResponse<List<BaseRentResponse>>> avgPricePerUnit(
      @Body() RequestSellValues requestSellValues);

  @POST(EndPoints.transactionsValue)
  Future<HttpResponse<List<BaseRentResponse>>> transactionsValue(
      @Body() RequestSellValues requestSellValues);

  @POST(EndPoints.soldAreas)
  Future<HttpResponse<List<BaseRentResponse>>> soldAreas(
      @Body() RequestSellValues requestSellValues);

  @POST(EndPoints.realStateNumber)
  Future<HttpResponse<List<BaseRentResponse>>> realStateNumber(
      @Body() RequestSellValues requestSellValues);

  @POST(EndPoints.averagePricePerSquareFoot)
  Future<HttpResponse<List<BaseRentResponse>>> averagePricePerSquareFoot(
      @Body() RequestSellValues requestSellValues);

  //----------------------------------Mortgage----------------------------------
  @GET(EndPoints.mortgageLookUp)
  Future<HttpResponse<RentLookupResponse>> getLockupMortgage();

  // KPI1
  @POST(EndPoints.totalMortgageTransactions)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalMortgageTransactions(
      @Body() RequestMortgageValues requestSellValues);

  // KPI3
  @POST(EndPoints.totalNumberOfMortgageUnits)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalNumberOfMortgageUnits(
      @Body() RequestMortgageValues requestSellValues);

  // KPI5
  @POST(EndPoints.totalValueOfMortgageTransactions)
  Future<HttpResponse<List<BaseRentResponse>>>
      getTotalValueOfMortgageTransactions(
          @Body() RequestMortgageValues requestSellValues);

//kpi7
  @POST(EndPoints.mortgageTransactions)
  Future<HttpResponse<MortgageTransactionResponse>> getMortgageTransactions(
      @Body() RequestMortgageValues requestMortgageValues);

  ///--------broker---------///

  @GET(EndPoints.brokerLookUp)
  Future<HttpResponse<RealEstateBrokerLookUp>> getBrokerLookUp();

  @GET(EndPoints.brokerOVLookUp)
  Future<HttpResponse<RealEstateBrokerLookUp>> getOvLookUp();

  @POST(EndPoints.brokerTransactions)
  Future<HttpResponse<RealEstateBrokerTransactions>> getBrokerTransaction(
      @Body() RequestBrokerValues requestBrokerValue);

  @POST(EndPoints.brokerKpi1)
  Future<HttpResponse<List<RealEstateBrokerKpi1>>> getBrokerKpi1(
      @Body() RequestBrokerValues requestBrokerValue);
}

//---------------------------------DirectUs-----------------------------------------
@RestApi(baseUrl: Constant.secondaryBaseUrl)
abstract class TranslationsServiceClient {
  factory TranslationsServiceClient(Dio dio, {String baseUrl}) =
      _TranslationsServiceClient;

  //---------------------------------Auth-----------------------------------------
  @POST(EndPoints.auth)
  Future<HttpResponse<AuthResponse>> login(@Body() RequestAuth requestAuth);

  @POST(EndPoints.resetPassword)
  Future<HttpResponse<ResetPasswordModel>> resetPassword(@Body() String email);

  @POST(EndPoints.refreshToken)
  Future<HttpResponse<AuthResponse>> refreshToken(
      @Body() RefreshToken refreshToken);

//---------------------------------Profile-------------------------------------
  @GET(EndPoints.userInfo)
  Future<HttpResponse<UserResponse>> getUserInfo();

  @PATCH(EndPoints.updateUserInfo)
  Future<HttpResponse<UserResponse>> updateUserInfo(
      @Path("id") String id, @Body() RequestUpdateInfoModel requestUpdateInfo);

  @PATCH(EndPoints.userEdit)
  Future<HttpResponse<UserResponse>> updateFcmToken(
      @Path() String id, @Field("fcm_token") String fcmToken);

//---------------------------------CMS-----------------------------------------
  @GET(EndPoints.faq)
  Future<HttpResponse<FaqResponse>> getFaq(@Query("limit") int limit);

  @GET(EndPoints.translations)
  Future<HttpResponse<TranslationsModel>> getTranslations(
      @Query("limit") int limit);

  @GET(EndPoints.about)
  Future<HttpResponse<AboutResponse>> getAbout();

  @GET(EndPoints.news)
  Future<HttpResponse<NewsResponse>> getNews();

  @GET(EndPoints.newsById)
  Future<HttpResponse<NewsByIdResponse>> getNewsById(
      {@Path('id') required int id});

  @GET(EndPoints.laws)
  Future<HttpResponse<LawsResponse>> getLaws(@Query("limit") int limit);

  @GET(EndPoints.lawsById)
  Future<HttpResponse<LawByIdResponse>> getLawId(@Path("id") int id);

  //Main menu
  @GET(EndPoints.mainMenu)
  Future<HttpResponse<MainMenuResponse>> mainMenu();

//appSettings
  @GET(EndPoints.appSettings)
  Future<HttpResponse<AppSettingsResponse>> appSettings();
}
