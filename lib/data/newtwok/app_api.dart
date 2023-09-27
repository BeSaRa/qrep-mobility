import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../app/constants.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
}
