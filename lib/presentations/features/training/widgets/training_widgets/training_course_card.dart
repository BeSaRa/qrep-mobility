import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/training/get_all_courses_response_model.dart';
import 'package:ebla/presentations/features/training/training_route_extras.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrainingCourseCard extends StatelessWidget {
  final TrainingCourse course;
  final bool isCommingFromMyCourses;

  const TrainingCourseCard({
    super.key,
    required this.course,
    required this.isCommingFromMyCourses,
  });

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale == ARABIC_LOCAL;
    return GestureDetector(
      onTap: () {
        context.pushNamed(RoutesNames.trainingDetails, extra: TrainingRouteExtras(course: course,isCommingFromMyCourses: isCommingFromMyCourses));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizeH.s16),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorManager.primary.withValues(alpha: 0.2),
                blurRadius: 2,
                offset: const Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(AppSizeR.s10),
            color: Theme.of(context).brightness == Brightness.dark
                ? ColorManager.textFieldGrey
                : Theme.of(context).scaffoldBackgroundColor),
        child: Padding(
          padding: EdgeInsets.all(AppSizeW.s20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //1
              Text(
                course.lookup.translations
                    .firstWhere(
                      (e) => e.languageId == (isArabic ? 2 : 1),
                      orElse: () => course.lookup.translations.first,
                    )
                    .name,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: AppSizeH.s12),

              //2
              Wrap(
                spacing: AppSizeW.s8,
                runSpacing: AppSizeH.s8,
                children: isCommingFromMyCourses &&
                        course.trackTranslation != null
                    ? [
                        Container(
                          width: AppSizeW.s150,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizeW.s15,
                            vertical: AppSizeH.s8,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(AppSizeR.s10),
                          ),
                          child: Text(
                            course.trackTranslation!.key
                                .firstWhere(
                                  (t) => t.languageId == (isArabic ? 2 : 1),
                                  orElse: () =>
                                      course.trackTranslation!.key.first,
                                )
                                .name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.primary,
                                    fontWeight: FontWeight.bold),
                          ),
                        )
                      ]
                    : course.categories.map((category) {
                        final name = category.translations
                            .firstWhere(
                              (t) => t.languageId == (isArabic ? 2 : 1),
                              orElse: () => category.translations.first,
                            ).name;

                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizeW.s15,
                            vertical: AppSizeH.s8,
                          ),
                          decoration: BoxDecoration(
                            color:
                                ColorManager.primaryBlue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(AppSizeR.s10),
                          ),
                          child: Text(
                            name,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: AppSizeSp.s12,
                                      color: ColorManager.primaryBlue,
                                    ),
                          ),
                        );
                      }).toList(),
              ),

              SizedBox(height: AppSizeH.s12),
              if (isCommingFromMyCourses && course.session != null) ...[
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: ColorManager.primaryBlue),
                    SizedBox(width: AppSizeW.s5),
                    Text(
                      AppStrings().sessionDate,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            // fontSize: AppSizeSp.s12,
                            color: ColorManager.primaryBlue,
                          ),
                    ),
                    Text(
                      " ${course.session!.startDate} | ${course.session!.endDate}",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ] else
                Text(
                  course.translations
                      .firstWhere(
                        (e) => e.languageId == (isArabic ? 2 : 1),
                        orElse: () => course.translations.first,
                      )
                      .summary,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              SizedBox(height: AppSizeH.s16),
              Row(
                children: [
                  Container(
                    width: isCommingFromMyCourses?AppSizeW.s150:null,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizeW.s20,
                      vertical: AppSizeH.s15,
                    ),
                    decoration: BoxDecoration(
                      color: isCommingFromMyCourses?ColorManager.primary:ColorManager.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSizeR.s10),
                    ),
                    child:
                    isCommingFromMyCourses?
                    Text(
                      AppStrings().details,
                      style:Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorManager.white,
                      )
                    )
                    :
                    Row(
                      spacing: AppSizeH.s5,
                      children: [
                        if (context.locale != ARABIC_LOCAL)
                          const Icon(Icons.arrow_forward),
                        Text(AppStrings().readMore,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ColorManager.primary,
                                    )),
                        if (context.locale == ARABIC_LOCAL)
                          const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
