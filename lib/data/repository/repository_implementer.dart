import 'package:dio/dio.dart';
import 'package:ebla/data/newtwok/failure_model/failure.dart';

import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';

import 'package:multiple_result/src/result.dart';

import '../../domain/repository/repository.dart';
import '../../presentations/resources/strings_manager.dart';
import '../newtwok/app_api.dart';
import '../newtwok/network_info.dart';

class RepositoryImplementer extends Repository {
  final AppServiceClient appServiceClient;
  final NetworkInfo networkInfo;

  RepositoryImplementer(
      {required this.appServiceClient, required this.networkInfo});

  @override
  Future<Result<RentLookupResponse, FailureModel>> getLockupRent() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getLockupRent();
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

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> meanValue(
      RequestMeanValue requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.meanValue(requestMeanValue);
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

  @override
  Future<Result<List<MeanAreaResponse>, FailureModel>> meanArea(
      RequestMeanValue requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.meanArea(requestMeanValue);
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

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>>
      getTotalContracts() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.totalContract();
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
