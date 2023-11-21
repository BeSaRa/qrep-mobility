import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class DialogDataCollectedAndAudited extends StatelessWidget {
  const DialogDataCollectedAndAudited({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppSizeH.s15, horizontal: AppSizeW.s30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeW.s15),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppStrings().dataBeingCollectedAndAudited,
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
