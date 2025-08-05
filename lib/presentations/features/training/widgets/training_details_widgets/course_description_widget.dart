import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CourseDescriptionWidget extends StatelessWidget {
  final CourseDetailsData course;
  const CourseDescriptionWidget({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
      child: Text(
          course.translations
              .firstWhere(
                (e) => e.languageId == (context.locale == ARABIC_LOCAL ? 2 : 1),
                orElse: () => course.translations.first,
              )
              .summary,
          textAlign: TextAlign.right,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500)),
    );
  }
}
