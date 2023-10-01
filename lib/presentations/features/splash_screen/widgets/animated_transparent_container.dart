import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:flutter/material.dart';

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
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizeR.s50),
                    bottomRight: Radius.circular(AppSizeR.s50))),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                'المنصة العقارية\n لدولة قطر\n',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(height: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                      color: ColorManager.greyCloud,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizeH.s34,
              )
            ]),
          ),
        ),
        SizedBox(
          height: AppSizeH.s50,
        ),
        Image.asset(
          ImageAssets.ministryOfMunicipality,
        ),
      ],
    );
  }
}
