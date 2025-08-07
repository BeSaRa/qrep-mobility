import 'package:ebla/data/network/failure_model/failure.dart';
import 'package:ebla/domain/models/auth/auth_models.dart';
import 'package:ebla/domain/models/requests/training/get_all_courses_request_model.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../models/training/get_all_categories_response_model/get_all_categories_response_model.dart';

abstract class Phase2Repository {
  //------ Training --------
  Future<Result<GetAllCoursesResponseModel, FailureModel>> getTrainingCourses(
      GetAllCoursesRequestModel request);

  Future<Result<GetAllCategoriesResponseModel, FailureModel>>
      getAllTrainingCategories(GetAllCategoriesRequestModel request);

  Future<Result<CourseDetailsResponseModel, FailureModel>> getCourseDetails(
      GetCourseDetailsRequestModel request);

  Future<Result<GetTrainingCourseAttachmentResponseModel, FailureModel>>
      getTrainingCourseAttachment(GetCourseDetailsRequestModel request);

  Future<Result<GetTrainingCourseSessionsResponseModel, FailureModel>>
      getTrainingCourseSessions(GetTrainingCourseSessionsRequestModel request);

  Future<Result<RequestLoginModel, FailureModel>> askForLogin();
}
