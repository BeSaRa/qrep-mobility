import 'package:dio/dio.dart';
import 'package:ebla/data/newtwok/end_points.dart';
import 'package:ebla/domain/models/cms_models/about/about_model.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/domain/models/cms_models/news/news_model.dart';
import 'package:ebla/domain/models/mrtgage_models/mortgage_models.dart';
import 'package:ebla/domain/models/requests/mortgage_requests/request_mortgage_values.dart';
import 'package:ebla/domain/models/sell_models/sell_models.dart';
import 'package:ebla/domain/models/translations_model/translations_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constants.dart';
import '../../domain/models/rent_models/rent_models.dart';
import '../../domain/models/requests/rent_requests/request_mean_value.dart';
import '../../domain/models/requests/sell_requests/request_sell_values.dart';

part 'app_api.g.dart';

//*******************genereate command************************************
//dart run build_runner build  --delete-conflicting-outputs
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
//********************************************************************** */
@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

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

  //----------------------------------Sell--------------------------------------
  @GET(EndPoints.lookupSell)
  Future<HttpResponse<RentLookupResponse>> getLockupSell();

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

  // KPI13
  @POST(EndPoints.meanValueSell)
  Future<HttpResponse<List<BaseRentResponse>>> getMeanValueSell(
      @Body() RequestSellValues requestSellValues);

  //sell
  @POST(EndPoints.sellDefault)
  Future<HttpResponse<List<RentDefault>>> getSellDefault(
      @Body() RequestSellValues requestSellValues);

  @POST(EndPoints.sellTransactions)
  Future<HttpResponse<SellTransactionResponse>> getSellTransactions(
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
}

//----------------------------------CMS-----------------------------------------
@RestApi(baseUrl: Constant.secondaryBaseUrl)
abstract class TranslationsServiceClient {
  factory TranslationsServiceClient(Dio dio, {String baseUrl}) =
      _TranslationsServiceClient;

  @GET(EndPoints.translations)
  Future<HttpResponse<TranslationsModel>> getTranslations(
      @Query("limit") int limit);

  @GET(EndPoints.about)
  Future<HttpResponse<AboutResponse>> getAbout();

  @GET(EndPoints.news)
  Future<HttpResponse<NewsResponse>> getNews();

  @GET(EndPoints.laws)
  Future<HttpResponse<LawsResponse>> getLaws();
}
