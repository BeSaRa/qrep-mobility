import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/models/Auth/auth_models.dart';
import 'package:ebla/domain/models/Auth/requests_auth/request_auth.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/cms_models/app_settings/app_settings.dart';
import 'package:ebla/domain/models/cms_models/user/requests/update_info_model.dart';
import 'package:ebla/domain/models/cms_models/user/user_model.dart';
import 'package:ebla/domain/models/favourite/favourite_models.dart';
import 'package:ebla/domain/models/models.dart';
import 'package:ebla/domain/models/requests/broker_requests/request_broker_values.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';

import 'package:flutter/foundation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../app/constants.dart';
import '../../domain/repository/repository.dart';
import '../../presentations/resources/strings_manager.dart';
import '../network/app_api.dart';
import '../network/end_points.dart';
import '../network/network_info.dart';

class RepositoryImplementer extends Repository {
  final AppServiceClient appServiceClient;
  final CmsServiceClient translationsServiceClient;

  final NetworkInfo networkInfo;

  RepositoryImplementer(
      {required this.appServiceClient,
      required this.translationsServiceClient,
      required this.networkInfo});

  /// ---------------------cms ----------------

  @override
  Future<Result<TranslationsModel, FailureModel>> getTranslations(
      int limit) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.getTranslations(limit);
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
  Future<Result<AboutResponse, FailureModel>> getAbout() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.getAbout();

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
  Future<Result<List<NewsModel>, FailureModel>> getNews() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.getNews();
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
  Future<Result<FaqResponse, FailureModel>> getFaq(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.getFaq(id);
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
  Future<Result<AuthResponse, FailureResponse>> login(
      RequestAuth requestAuth) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.login(requestAuth);
        if (response.response.statusCode == 200 ||
            response.response.statusCode == 201) {
          return Success(response.data);
        } else {
          return Error(FailureResponse.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(
            FailureResponse.fromJson(e.response?.data ?? defaultError));
      }
    } else {
      return Error(FailureResponse(
          errors: [ErrorModel(message: AppStrings().noInternetError)]));
    }
  }

  @override
  Future<Result<AuthResponse, FailureResponse>> refreshToken(
      RefreshToken refreshToken) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await translationsServiceClient.refreshToken(refreshToken);
        if (response.response.statusCode == 200 ||
            response.response.statusCode == 201) {
          return Success(response.data);
        } else {
          return Error(FailureResponse.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(
            FailureResponse.fromJson(e.response?.data ?? defaultError));
      }
    } else {
      return Error(FailureResponse(
          errors: [ErrorModel(message: AppStrings().noInternetError)]));
    }
  }

  @override
  Future<Result<UserResponse, FailureModel>> getUserInfo() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.getUserInfo();
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(FailureModel.fromJson(e.response?.data ?? defaultError));
      }
    } else {
      return Error(FailureModel(message: AppStrings().noInternetError));
    }
  }

  @override
  Future<Result<UserResponse, FailureResponse>> updateUserInfo(
      {required String id,
      required RequestUpdateInfoModel requestUpdateInfo}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.updateUserInfo(
            id, requestUpdateInfo);
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureResponse.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(
            FailureResponse.fromJson(e.response?.data ?? defaultError));
      }
    } else {
      return Error(FailureResponse(
          errors: [ErrorModel(message: AppStrings().noInternetError)]));
    }
  }

  @override
  Future<Result<ResetPasswordModel, FailureResponse>> resetPassword(
      String email) async {
    if (await networkInfo.isConnected) {
      try {
        Dio dio = instance<Dio>();
        try {
          final response =
              await dio.post("${Constant.cmsBaseUrl}${EndPoints.resetPassword}",
                  data: json.encode({'email': email}),
                  options: Options(
                    headers: {
                      "content-type": "application/json",
                      "accept": "application/json",
                    },
                  ));
          if (response.statusCode == 200) {
            return Success(response.data);
          } else {
            return Error(FailureResponse.fromJson(response.data));
          }
        } on DioException catch (e) {
          return Error(
              FailureResponse.fromJson(e.response?.data ?? defaultError));
        } catch (e) {
          return Error(FailureResponse(
              errors: [ErrorModel(message: AppStrings().noInternetError)]));
        }
      } catch (e) {
        return Error(FailureResponse(
            errors: [ErrorModel(message: AppStrings().noInternetError)]));
      }
    } else {
      return Error(FailureResponse(
          errors: [ErrorModel(message: AppStrings().noInternetError)]));
    }
  }

  @override
  Future<Result<String, FailureModel>> getCmsToken() async {
    try {
      Dio dio = instance<Dio>();
      try {
        final response =
            await dio.get("${Constant.cmsBaseUrl}${EndPoints.getTokenApi}",
                options: Options(
                  headers: {
                    "content-type": "application/json",
                    "accept": "application/json",
                  },
                ));
        if (response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureModel.fromJson(response.data));
        }
      } on DioException catch (e) {
        return Error(FailureModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        return Error(FailureModel.fromJson(defaultError));
      }
    } catch (e) {
      return Error(FailureModel.fromJson(defaultError));
    }
  }

  @override
  Future<Result<UserResponse, FailureModel>> updateFcmToken(input) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await translationsServiceClient.updateFcmToken(input.id, input.fcm);

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
  Future<Result<AppSettingsResponse, FailureModel>> getAppSettings() async {
    if (await networkInfo.isConnected) {
      try {
        Dio dio = instance<Dio>();
        try {
          final response =
              await dio.get("${Constant.cmsBaseUrl}${EndPoints.appSettings}",
                  options: Options(
                    headers: {
                      "content-type": "application/json",
                      "accept": "application/json",
                    },
                  ));
          if (response.statusCode == 200) {
            return Success(AppSettingsResponse.fromJson(response.data));
          } else {
            return Error(FailureModel.fromJson(response.data));
          }
        } on DioException catch (e) {
          return Error(FailureModel.fromJson(e.response?.data ?? defaultError));
        } catch (e) {
          return Error(FailureModel.fromJson(defaultError));
        }
      } catch (e) {
        return Error(FailureModel.fromJson(defaultError));
      }
    } else {
      return Error(FailureModel.fromJson(defaultError));
    }
  }

  @override
  Future<Result<MainMenuResponse, FailureResponse>> mainMenu() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.mainMenu();
        if (response.response.statusCode == 200 ||
            response.response.statusCode == 201) {
          return Success(response.data);
        } else {
          return Error(FailureResponse.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(
            FailureResponse.fromJson(e.response?.data ?? defaultError));
      }
    } else {
      return Error(FailureResponse(
          errors: [ErrorModel(message: AppStrings().noInternetError)]));
    }
  }

  ///---------------------rent -----------------------

  @override
  Future<Result<LookupResponse, FailureModel>> getLockupRent() async {
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
      RentRequest requestMeanValue) async {
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
      RentRequest requestMeanValue) async {
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
  Future<Result<List<BaseRentResponse>, FailureModel>> certificateCount(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.certificateCount(requestMeanValue);
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        if (kDebugMode) {
          print('ar ${e.toString()}');
        }

        return Error(FailureModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        if (kDebugMode) {
          print('ar ${e.toString()}');
        }

        return Error(FailureModel(message: AppStrings().defaultError));
      }
    } else {
      return Error(FailureModel(message: AppStrings().noInternetError));
    }
  }

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> contractCount(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.contractCount(requestMeanValue);
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
  Future<Result<List<RentDefault>, FailureModel>> getRentDefault(
      RentRequest requestMeanValue) async {
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

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> meanRentAmount(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.avgMeanRentAmount(requestMeanValue);

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
  Future<Result<List<BaseRentResponse>, FailureModel>> rentValueAmount(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.rentAmount(requestMeanValue);

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
  Future<Result<List<BaseRentResponse>, FailureModel>> contractValue(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.contractValue(requestMeanValue);

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
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalContracts(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.totalContract(requestMeanValue);
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
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalRentedSpace(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getTotalRentedSpace(requestMeanValue);
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
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalRentedUnits(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getTotalRentedUnits(requestMeanValue);
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(FailureModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return Error(FailureModel(message: AppStrings().defaultError));
      }
    } else {
      return Error(FailureModel(message: AppStrings().noInternetError));
    }
  }

  @override
  Future<Result<RentListSummary, FailureModel>> getRentSummary(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.rentSummary(requestMeanValue);

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
  Future<Result<List<BaseRentResponse>, FailureModel>> meanRentValueMeter(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.meanRentMeter(requestMeanValue);
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        if (kDebugMode) {
          print('ar ${e.toString()}');
        }

        return Error(FailureModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        if (kDebugMode) {
          print('ar ${e.toString()}');
        }

        return Error(FailureModel(message: AppStrings().defaultError));
      }
    } else {
      return Error(FailureModel(message: AppStrings().noInternetError));
    }
  }

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> getRentedAreas(
      RentRequest requestMeanValue) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getRentedAreas(requestMeanValue);
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        if (kDebugMode) {
          print('ar ${e.toString()}');
        }

        return Error(FailureModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        if (kDebugMode) {
          print('ar ${e.toString()}');
        }

        return Error(FailureModel(message: AppStrings().defaultError));
      }
    } else {
      return Error(FailureModel(message: AppStrings().noInternetError));
    }
  }

  // ------------------------------sell----------------------------------------

  @override
  Future<Result<LookupResponse, FailureModel>> getLockupSell() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getLockupSell();
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

  // KPI1
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalContractsSell(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getTotalContractsSell(requestSellValues);
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

  // KPI4
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalSoldUnits(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getTotalSoldUnits(requestSellValues);
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

  // KPI7
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalTransactionsSell(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getTotalTransactionsSell(requestSellValues);
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

  // KP13
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> getMeanValueSell(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getMeanValueSell(requestSellValues);
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
  Future<Result<List<RentDefault>, FailureModel>> getSellDefault(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getSellDefault(requestSellValues);
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
  Future<Result<SellTransactionResponse, FailureModel>> getSellTransaction(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getSellTransactions(requestSellValues);
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
  Future<Result<List<BaseRentResponsePerAreaUnitType>, FailureModel>>
      getMeanSoldArea(RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getMeanSoldArea(requestSellValues);
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
  Future<Result<List<BaseRentResponse>, FailureModel>> soldAreas(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.soldAreas(requestSellValues);
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
  Future<Result<List<BaseRentResponse>, FailureModel>> sellContractCount(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.sellContractCount(requestSellValues);
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
  Future<Result<List<BaseRentResponsePerAreaUnitType>, FailureModel>>
      getTotalSoldSpaces(RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getTotalSoldSpaces(requestSellValues);
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
      averagePricePerSquareFoot(RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.averagePricePerSquareFoot(requestSellValues);
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
  Future<Result<List<BaseRentResponse>, FailureModel>> transactionsValue(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.transactionsValue(requestSellValues);
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
  Future<Result<List<BaseRentResponse>, FailureModel>> avgPricePerUnit(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.avgPricePerUnit(requestSellValues);
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

  //----------------------------------Mortgage----------------------------------
  // KPI1
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>>
      getTotalMortgageTransactions(
          RequestMortgageValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient
            .getTotalMortgageTransactions(requestSellValues);
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

  // KPI3
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>>
      getTotalNumberOfMortgageUnits(
          RequestMortgageValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient
            .getTotalNumberOfMortgageUnits(requestSellValues);
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

  // KPI5
  @override
  Future<Result<List<BaseRentResponse>, FailureModel>>
      getTotalValueOfMortgageTransactions(
          RequestMortgageValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient
            .getTotalValueOfMortgageTransactions(requestSellValues);
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
  Future<Result<LookupResponse, FailureModel>> getLockupMortgage() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getLockupMortgage();
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
  Future<Result<MortgageTransactionResponse, FailureModel>>
      getMortgageTransactions(RequestMortgageValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.getMortgageTransactions(requestSellValues);
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

  ///------------------real estate brokers------------

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> realStateNumber(
      RequestSellValues requestSellValues) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await appServiceClient.realStateNumber(requestSellValues);
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
  Future<Result<RealEstateBrokerLookUp, FailureModel>>
      getLockupBrokers() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getBrokerLookUp();
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
  Future<Result<RealEstateBrokerTransactions, FailureModel>>
      getBrokerTransactions(RequestBrokerValues input) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getBrokerTransaction(input);
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
  Future<Result<RealEstateBrokerKpi1, FailureModel>> getBrokersCount(
      RequestBrokerValues input) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getBrokerKpi1(input);
        if (response.response.statusCode == 200) {
          return Success(response.data.first);
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
  Future<Result<RealEstateBrokerLookUp, FailureModel>>
      getLockupOVBrokers() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getOvLookUp();
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
  Future<Result<List<FavouriteResponse>, FailureModel>> getUserFavourites(
      String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.getWishlist(id);
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
  Future<Result<bool, FailureModel>> deleteFavourite(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.deleteFav(id);
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
  Future<Result<FavouriteResponse, FailureModel>> updateFavourite(
      FavouriteResponse id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.updateFav(id.id ?? 0, id);
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
  Future<Result<FavouriteResponse, FailureModel>> createFavourite(
      FavouriteResponse id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.createWishList(id);
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

//---------------- chatbot ------------------
  @override
  Future<Result<ChatbotResponseModel, FailureModel>> sendMessageToChatbot(
      ChatbotRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.sendMessageToChatbot(request);
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
  Future<Result<StartStreamModel, FailureModel>> startStream() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.startStream();
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
  Future<Result<SendAnswerResponseModel, FailureCloseStreamModel>> sendAnswer(
      MainSendAnswerRequestModel request, String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.sendAnswer(id, request);
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureCloseStreamModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(FailureCloseStreamModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        return Error(FailureCloseStreamModel(message: AppStrings().defaultError));
      }
    } else {
      return Error(FailureCloseStreamModel(message: AppStrings().noInternetError));
    }
  }

  @override
  Future<Result<SendAnswerResponseModel, FailureCloseStreamModel>> sendCandidate(
      MainSendCandidateRequestModel request, String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.sendCandidate(id, request);
        if (response.response.statusCode == 200) {
          return Success(response.data);
        } else {
          return Error(FailureCloseStreamModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        return Error(FailureCloseStreamModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        return Error(FailureCloseStreamModel(message: AppStrings().defaultError));
      }
    } else {
      return Error(FailureCloseStreamModel(message: AppStrings().noInternetError));
    }
  }

  @override
  Future<Result<SendAnswerResponseModel, FailureCloseStreamModel>> closeStream(
      String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await appServiceClient.closeStream(id);
        log("Zak1 $response");
        if (response.response.statusCode == 200) {
          log("Zak2 $response");
          return Success(response.data);
        } else {
          log("Zak3 $response");
          return Error(FailureCloseStreamModel.fromJson(response.response.data));
        }
      } on DioException catch (e) {
        log("Zak4 ${e.message}");
        return Error(FailureCloseStreamModel.fromJson(e.response?.data ?? defaultError));
      } catch (e) {
        log("Zak5 ${e.toString()}");
        return Error(FailureCloseStreamModel(message: AppStrings().defaultError));
      }
    } else {
      return Error(FailureCloseStreamModel(message: AppStrings().noInternetError));
    }
  }

  //---------------------get laws-------------------------------
  @override
  Future<Result<List<LawsModel>, FailureModel>> getLaws() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.getLaws();

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
  //---------------------end get laws-------------------------------
}
