import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_preferences.dart';
import '../../../../app/depndency_injection.dart';
import '../../../resources/values_manager.dart';

class AnimatedTransparentContainer extends StatefulWidget {
  const AnimatedTransparentContainer({super.key});

  @override
  State<AnimatedTransparentContainer> createState() =>
      _AnimatedTransparentContainerState();
}

class _AnimatedTransparentContainerState
    extends State<AnimatedTransparentContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //       color: ColorManager.primary,
        //       borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(AppSizeR.s50),
        //           bottomRight: Radius.circular(AppSizeR.s50))),
        //   child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        //     SizedBox(
        //       height: AppSizeH.s71,
        //     ),
        //     // Text(
        //     //   'المنصة العقارية\n لدولة قطر',
        //     //   textAlign: TextAlign.center,
        //     //   style: Theme.of(context)
        //     //       .textTheme
        //     //       .displayMedium!
        //     //       .copyWith(height: 1),
        //     // ),
        //     SizedBox(
        //       height: AppSizeH.s17,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Container(
        //           width: 30,
        //           height: 4,
        //           decoration: BoxDecoration(
        //             color: ColorManager.greyCloud,
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(
        //       height: AppSizeH.s34,
        //     )
        //   ]),
        // ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: AppSizeW.s42, left: AppSizeW.s35),
            child: Image.asset(
              instance<AppPreferences>().getTheme().brightness ==
                      Brightness.light
                  ? ImageAssets.ministryOfMunicipalityLight
                  : ImageAssets.ministryOfMunicipalityDark,
            ),
          ),
        ),
      ],
    );
  }
}
