import 'package:dio/dio.dart';
import 'package:ebla/data/newtwok/failure_model/failure.dart';
import 'package:ebla/domain/models/cms_models/about/about_model.dart';
import 'package:ebla/domain/models/cms_models/laws/laws_model.dart';
import 'package:ebla/domain/models/cms_models/news/news_model.dart';
import 'package:ebla/domain/models/mrtgage_models/mortgage_models.dart';
import 'package:ebla/domain/models/rent_models/rent_models.dart';
import 'package:ebla/domain/models/requests/mortgage_requests/request_mortgage_values.dart';
import 'package:ebla/domain/models/requests/rent_requests/request_mean_value.dart';
import 'package:ebla/domain/models/sell_models/sell_models.dart';
import 'package:ebla/domain/models/translations_model/translations_model.dart';
import 'package:flutter/foundation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/models/requests/sell_requests/request_sell_values.dart';
import '../../domain/repository/repository.dart';
import '../../presentations/resources/strings_manager.dart';
import '../newtwok/app_api.dart';
import '../newtwok/network_info.dart';

class RepositoryImplementer extends Repository {
  final AppServiceClient appServiceClient;
  final TranslationsServiceClient translationsServiceClient;
  final NetworkInfo networkInfo;

  RepositoryImplementer(
      {required this.appServiceClient,
      required this.translationsServiceClient,
      required this.networkInfo});

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
  Future<Result<List<BaseRentResponse>, FailureModel>> certificateCount(
      RequestMeanValue requestMeanValue) async {
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
      RequestMeanValue requestMeanValue) async {
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

  @override
  Future<Result<List<BaseRentResponse>, FailureModel>> meanRentAmount(
      RequestMeanValue requestMeanValue) async {
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
      RequestMeanValue requestMeanValue) async {
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
      RequestMeanValue requestMeanValue) async {
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
      RequestMeanValue requestMeanValue) async {
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
  Future<Result<List<BaseRentResponse>, FailureModel>> getTotalRentedUnits(
      RequestMeanValue requestMeanValue) async {
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
      RequestMeanValue requestMeanValue) async {
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
  Future<Result<LawsResponse, FailureModel>> getLaws() async {
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

  @override
  Future<Result<LawByIdResponse, FailureModel>> getLawById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await translationsServiceClient.getLawId(id);

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
  Future<Result<NewsResponse, FailureModel>> getNews() async {
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

  // ------------------------------sell----------------------------------------

  @override
  Future<Result<RentLookupResponse, FailureModel>> getLockupSell() async {
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
  Future<Result<RentLookupResponse, FailureModel>> getLockupMortgage() async {
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
}
