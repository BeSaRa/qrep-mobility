import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';

class DialogDisabledFiltersWarning extends StatelessWidget {
  final List<String> messages;
  const DialogDisabledFiltersWarning({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizeW.s15),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizeW.s18,
                vertical: AppSizeH.s26,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: Icon(Icons.info_outline_rounded,
                          size: AppSizeSp.s40)),
                  SizedBox(height: AppSizeH.s22),
                  Text("${AppStrings().filterValuesShouldBeAsFollows}:",
                      style: Theme.of(context).textTheme.headlineLarge),
                  SizedBox(height: AppSizeH.s13),
                  ...messages
                      .map((e) => Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: AppSizeH.s2),
                            child: Text(e,
                                style: Theme.of(context).textTheme.labelMedium),
                          ))
                      .toList()
                ],
              ),
            ),
            IconButton(
              alignment: AlignmentDirectional.topEnd,
              icon: Icon(Icons.close,
                  color: ColorManager.greyCloud, size: AppSizeSp.s18),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
