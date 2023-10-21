import 'package:dio/dio.dart';
import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:multiple_result/src/result.dart';

import '../../domain/repository/sell_repository.dart';
import '../../presentations/resources/strings_manager.dart';
import '../newtwok/app_api.dart';
import '../newtwok/network_info.dart';

class SellRepositoryImplementer extends SellRepository {
  final AppServiceClient appServiceClient;
  final TranslationsServiceClient translationsServiceClient;
  final NetworkInfo networkInfo;

  SellRepositoryImplementer(
      {required this.appServiceClient,
      required this.translationsServiceClient,
      required this.networkInfo});

  @override
  Future<Result<List<RentDefault>, FailureModel>> getSellDefault(
      RequestMeanValue requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getRentDefault(requestMeanValue);
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(FailureModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        return Error(FailureModel(message: AppStrings().defaultError));
      }
    } else {
      return Error(FailureModel(message: AppStrings().noInternetError));
    }
  }
}
