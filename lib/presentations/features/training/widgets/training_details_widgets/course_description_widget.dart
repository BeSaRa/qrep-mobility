import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
class CourseDescriptionWidget extends StatelessWidget {
  const CourseDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizeW.s16),
      child: Text(
          'يتم تصميم هذه الدورة للمكاتب العقارية والوسطاء العقاريين لتقديم إرشادات مفصلة حول إدارة العقود الذكية بما في ذلك القواعد المختلفة التي يتم تطبيقها على العقود',
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
