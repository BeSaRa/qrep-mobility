import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';

Future<dynamic> bottomSheetWidget(BuildContext context, {Widget? child}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizeW.s15,
        ),
        child: child),
  );
}
