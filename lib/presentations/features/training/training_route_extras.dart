
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';

class TrainingRouteExtras {
  final TrainingCourse course;
  final bool isCommingFromMyCourses;


  TrainingRouteExtras({
    required this.course,
    required this.isCommingFromMyCourses
  });
}
