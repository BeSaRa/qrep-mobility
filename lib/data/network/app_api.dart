import 'package:dio/dio.dart';
import 'package:ebla/data/network/end_points.dart';
import 'package:ebla/domain/models/ai_search_models/ai_search_model.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/cms_models/user/user_model.dart';
import 'package:ebla/domain/models/favourite/favourite_models.dart';
import 'package:ebla/domain/models/requests/ai_search_models/ai_search_model.dart';
import 'package:ebla/domain/models/requests/broker_requests/request_broker_values.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/models/training/get_training_course_providers_response_model/get_training_course_providers_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constants.dart';
import '../../domain/models/Auth/auth_models.dart';
import '../../domain/models/Auth/requests_auth/request_auth.dart';
import '../../domain/models/cms_models/app_settings/app_settings.dart';
import '../../domain/models/cms_models/user/requests/update_info_model.dart';
import '../../domain/models/models.dart';
import '../../domain/models/training/get_all_categories_response_model/get_all_categories_response_model.dart';

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
      @Body() RentRequest requestMeanValue);

  @GET(EndPoints.lockupRent)
  Future<HttpResponse<LookupResponse>> getLockupRent();

  @POST(EndPoints.meanValue)
  Future<HttpResponse<List<BaseRentResponse>>> meanValue(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.meanArea)
  Future<HttpResponse<List<MeanAreaResponse>>> meanArea(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.certificateCount)
  Future<HttpResponse<List<BaseRentResponse>>> certificateCount(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.contractCount)
  Future<HttpResponse<List<BaseRentResponse>>> contractCount(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.contractValue)
  Future<HttpResponse<List<BaseRentResponse>>> contractValue(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.totalContracts)
  Future<HttpResponse<List<BaseRentResponse>>> totalContract(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.totalRentedUnits)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalRentedUnits(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.rentSummary)
  Future<HttpResponse<RentListSummary>> rentSummary(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.totalRentedSpace)
  Future<HttpResponse<List<BaseRentResponse>>> getTotalRentedSpace(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.avgPriceTop)
  Future<HttpResponse<List<BaseRentResponse>>> avgMeanRentAmount(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.rentAmountTop)
  Future<HttpResponse<List<BaseRentResponse>>> rentAmount(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.meanRentMeter)
  Future<HttpResponse<List<BaseRentResponse>>> meanRentMeter(
      @Body() RentRequest requestMeanValue);

  @POST(EndPoints.rentedAreas)
  Future<HttpResponse<List<BaseRentResponse>>> getRentedAreas(
      @Body() RentRequest requestMeanValue);

  //----------------------------------Sell--------------------------------------
  @GET(EndPoints.lookupSell)
  Future<HttpResponse<LookupResponse>> getLockupSell();

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
  Future<HttpResponse<LookupResponse>> getLockupMortgage();

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

  ///-----------------favourite -----------------///

  @GET("${EndPoints.getUserWishListById}{id}")
  Future<HttpResponse<List<FavouriteResponse>>> getWishlist(
      @Path("id") String id);

  @DELETE("${EndPoints.getUserWishList}/{id}")
  Future<HttpResponse<bool>> deleteFav(@Path("id") int id);

  @PUT(EndPoints.getUserWishList)
  Future<HttpResponse<FavouriteResponse>> updateFav(
      @Path("id") int id, @Body() FavouriteResponse fav);

  @POST(EndPoints.getUserWishList)
  Future<HttpResponse<FavouriteResponse>> createWishList(
      @Body() FavouriteResponse criteria);

//------------- authority chatbot---------------
  @POST('${Constant.authorityChatBotBaseUrl}/api/v1/chatbot/chat/website')
  Future<HttpResponse<ChatbotResponseModel>> sendMessageToChatbot(
      @Body() ChatbotRequestModel request);

  @POST('${Constant.authorityChatBotBaseUrl}/api/v1/avatar/start-stream')
  Future<HttpResponse<StartStreamModel>> startStream();

  @PUT('${Constant.authorityChatBotBaseUrl}/api/v1/avatar/send-answer/{id}')
  Future<HttpResponse<MainChatbotResponseModel>> sendAnswer(
      @Path("id") String id, @Body() MainSendAnswerRequestModel body);
  @POST('${Constant.authorityChatBotBaseUrl}/api/v1/avatar/send-candidate/{id}')
  Future<HttpResponse<MainChatbotResponseModel>> sendCandidate(
      @Path("id") String id, @Body() MainSendCandidateRequestModel body);
  @POST(
      '${Constant.authorityChatBotBaseUrl}/api/v1/chat-history/add-conversation-feedback')
  Future<HttpResponse<MainChatbotResponseModel>> sendFeedback(
      @Query("conv_id") String convId, @Query("feedback") int feedback);
  @GET('${Constant.authorityChatBotBaseUrl}/api/v1/admin/sas-token')
  Future<HttpResponse<String>> getSASPdfUrl(@Query("blob_url") String blobUrl);

  /// ******* close stream *******
  @DELETE("${Constant.authorityChatBotBaseUrl}/api/v1/avatar/close-stream/{id}")
  Future<HttpResponse<MainChatbotResponseModel>> closeStream(
      @Path("id") String id);

  /// ******* chat FAQ *******

  @GET("${Constant.authorityChatBotBaseUrl}/api/v1//FAQ/faqs/{bot_name}")
  Future<HttpResponse<List<ChatbotFAQResponseModel>>> getChatFAQ(
      @Path("bot_name") String botName);

  /// ****************** platform chatbot ************************
  // @POST(EndPoints.sendMessageToPlatformChatbot)
  @POST('${Constant.platformStgBaseUrl}/openai/chat/completion')
  Future<HttpResponse<PlatformChatbotResponseModel>>
      sendMessageToPlatformChatbot(@Body() PlatformChatbotRequestModel request);

  /// ****************** AI search ************************
  @POST("${Constant.authorityChatBotBaseUrl}/api/v1/search/search/website")
  Future<HttpResponse<AiSearchResponseModel>> aiSearchFun(
      @Body() AiSearchRequestModel request);
}

//---------------------------------DirectUs-----------------------------------------
@RestApi(baseUrl: Constant.cmsBaseUrl)
abstract class CmsServiceClient {
  factory CmsServiceClient(Dio dio, {String baseUrl}) = _CmsServiceClient;

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

  @PATCH(EndPoints.updateUserInfo)
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

  //Main menu
  @GET(EndPoints.mainMenu)
  Future<HttpResponse<MainMenuResponse>> mainMenu();

//appSettings
  @GET(EndPoints.appSettings)
  Future<HttpResponse<AppSettingsResponse>> appSettings();

//get news
  @GET("${Constant.aqaratBaseUrl}/wp-json/wp/v2/posts?per_page=50")
  // @GET("${Constant.aqaratBaseUrl}/wp-json/wp/v2/posts")
  Future<HttpResponse<List<NewsModel>>> getNews();
  //get laws
  @GET("${Constant.aqaratBaseUrl}/wp-json/legislation/v1/all")
  Future<HttpResponse<List<LawsModel>>> getLaws();
}

@RestApi(baseUrl: Constant.aqaratBackendDev)
abstract class TrainingServiceClient {
  factory TrainingServiceClient(Dio dio, {String baseUrl}) =
      _TrainingServiceClient;

  /// ****************** Training *************************
  @POST(EndPoints.getTrainingCourses)
  Future<HttpResponse<GetAllCoursesResponseModel>> getTrainingCourses(@Body() GetAllCoursesRequestModel request);

  @POST(EndPoints.getAllTrainingGategories)
  Future<HttpResponse<GetAllCategoriesResponseModel>> getAllTrainingCategories(@Body() GetAllCategoriesRequestModel request);

  @GET(EndPoints.getAllTrainingGategoriesForGuest)
  Future<HttpResponse<GetAllCategoriesResponseModel>> getAllTrainingGategoriesForGuest();

  @POST(EndPoints.getCourseDetails)
  Future<HttpResponse<CourseDetailsResponseModel>> getCourseDetails(@Body() GetCourseDetailsRequestModel request);

  @POST(EndPoints.getTrainingCourseAttachment)
  Future<HttpResponse<GetTrainingCourseAttachmentResponseModel>>getTrainingCourseAttachment(@Body() GetCourseDetailsRequestModel request);

  @POST(EndPoints.getTrainingCourseSessions)
  Future<HttpResponse<GetTrainingCourseSessionsResponseModel>>getTrainingCourseSessions(@Body() GetTrainingCourseSessionsRequestModel request);

  @POST(EndPoints.getMyTrainingCourses)
  Future<HttpResponse<GetAllCoursesResponseModel>>getMyTrainingCourses(@Body() GetAllCoursesRequestModel request);

  @POST(EndPoints.getTrainingCourseProviders)
  Future<HttpResponse<GetTrainingCourseProvidersResponseModel>>getTrainingCourseProviders(@Body() GetAllCoursesRequestModel request);
}
