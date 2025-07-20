import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CourseInfoWidget extends StatelessWidget {
  const CourseInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'تدريب العقود الذكية للوسطاء العقاريين',
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
              'قيمة الدورة: ',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              '950.00 ريال قطري',
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
