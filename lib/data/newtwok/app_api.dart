import 'package:dio/dio.dart';
import 'package:ebla/data/newtwok/end_points.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constants.dart';
import '../../domain/models/rent_models/rent_models.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(EndPoints.rentDefault)
  Future<HttpResponse<RentDefault>> getRentDefault();

  @GET(EndPoints.lockupRent)
  Future<HttpResponse<RentLookupResponse>> getLockupRent();

  @POST(EndPoints.totalContracts)
  Future<HttpResponse<List<BaseRentResponse>>> totalContract();
}
