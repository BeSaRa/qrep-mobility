import 'package:dio/dio.dart';
import 'package:ebla/data/network/app_api.dart';
import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/data/network/network_info.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/domain/models/training/get_training_course_providers_response_model/get_training_course_providers_response_model.dart';
import 'package:ebla/domain/repository/service_and_training_repository.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/models/training/get_all_categories_response_model/get_all_categories_response_model.dart';

class ServiceAndTrainingRepositoryImplementer extends ServiceAndTrainingRepository {
  final TrainingServiceClient trainingServiceClient;
  final NetworkInfo networkInfo;

  ServiceAndTrainingRepositoryImplementer(
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

  //========================= Training Categories =========================
  @override
  Future<Result<GetAllCategoriesResponseModel, FailureModel>>
      getAllTrainingCategories(GetAllCategoriesRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await trainingServiceClient.getAllTrainingCategories(request);
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
  Future<Result<GetAllCategoriesResponseModel, FailureModel>>getAllTrainingGategoriesForGuest() async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await trainingServiceClient.getAllTrainingGategoriesForGuest();
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

  //========================= Course Details =========================
  @override
  Future<Result<CourseDetailsResponseModel, FailureModel>> getCourseDetails(
      GetCourseDetailsRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await trainingServiceClient.getCourseDetails(request);
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
  //========================= Course Providers =========================
  @override
  Future<Result<GetTrainingCourseProvidersResponseModel, FailureModel>> getTrainingCourseProviders(
      GetAllCoursesRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await trainingServiceClient.getTrainingCourseProviders(request);
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

  //========================= Course Attachments =========================
  @override
  Future<Result<GetTrainingCourseAttachmentResponseModel, FailureModel>>
      getTrainingCourseAttachment(GetCourseDetailsRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await trainingServiceClient.getTrainingCourseAttachment(request);
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

  //========================= Course Sessions =========================
  @override
  Future<Result<GetTrainingCourseSessionsResponseModel, FailureModel>>
      getTrainingCourseSessions(
          GetTrainingCourseSessionsRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await trainingServiceClient.getTrainingCourseSessions(request);
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

  //========================= My Courses =========================
  @override
  Future<Result<GetAllCoursesResponseModel, FailureModel>> getMyTrainingCourses(
      GetAllCoursesRequestModel request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await trainingServiceClient.getMyTrainingCourses(request);
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
