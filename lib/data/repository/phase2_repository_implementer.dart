
import 'package:dio/dio.dart';
import 'package:ebla/data/network/app_api.dart';
import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/data/network/network_info.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/repository/phase2_repository.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/models/training/get_all_categories_response_model/get_all_categories_response_model.dart';

class Phase2RepositoryImplementer extends Phase2Repository {
  final TrainingServiceClient trainingServiceClient;
  final NetworkInfo networkInfo;

  Phase2RepositoryImplementer(
      {required this.trainingServiceClient, required this.networkInfo});

  //--------------------- Start get Training -------------------------------
  @override
  Future<Result<GetAllCoursesResponseModel, FailureModel>> getTrainingCourses(
      GetAllCoursesRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await trainingServiceClient.getTrainingCourses(request);

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
  Future<Result<GetAllCategoriesResponseModel, FailureModel>>
      getAllTrainingGategories(GetAllCategoriesRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await trainingServiceClient.getAllTrainingGategories(request);
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
