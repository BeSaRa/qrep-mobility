import 'package:dio/dio.dart';
import 'package:ebla/data/newtwok/end_points.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constants.dart';
import '../../domain/models/rent_models/rent_models.dart';
import '../../domain/models/requests/rent_requests/request_mean_value.dart';

part 'app_api.g.dart';

//*******************genereate command************************************
//dart run build_runner build  --delete-conflicting-outputs
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
//********************************************************************** */
@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(EndPoints.rentDefault)
  Future<HttpResponse<RentDefault>> getRentDefault();

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
}
