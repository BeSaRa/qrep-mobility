import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class CourseInfoWidget extends StatelessWidget {
  final CourseDetailsData course;
  const CourseInfoWidget({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          course.lookup.translations
              .firstWhere(
                (e) => e.languageId == (context.locale == ARABIC_LOCAL ? 2 : 1),
                orElse: () => course.lookup.translations.first,
              )
              .name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppSizeSp.s20,
            fontWeight: FontWeight.bold,
            color: ColorManager.primary,
          ),
        ),
        SizedBox(height: AppSizeH.s8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconAssets.money, width: AppSizeSp.s25),
            SizedBox(width: AppSizeW.s5),
            Text(
              '${AppStrings().courseFees}: ',
              style: Theme.of(context).textTheme.titleSmall,
            ),

            Text(
              course.fee.toInt()==0?
              AppStrings().free
              :
              '${course.fee} ${AppStrings().qr}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorManager.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        // SizedBox(height: AppSizeH.s16),
        // Image.asset(ImageAssets.trainingCity),
      ],
    );
  }
}
