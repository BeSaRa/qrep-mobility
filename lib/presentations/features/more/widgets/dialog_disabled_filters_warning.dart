import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class DialogDisabledFiltersWarning extends StatelessWidget {
  final String message;
  const DialogDisabledFiltersWarning({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizeH.s15, horizontal: AppSizeW.s20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeW.s15),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("${AppStrings().filterValuesShouldBeAsFollows}:",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: AppSizeH.s3),
            Text(message, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
