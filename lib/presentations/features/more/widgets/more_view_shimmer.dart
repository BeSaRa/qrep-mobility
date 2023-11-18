import 'package:ebla/presentations/widgets/shimmer_placeholder.dart';
import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class MoreViewShimmer extends StatelessWidget {
  const MoreViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerPlaceholder(
                child: Container(
                  width: AppSizeW.s65,
                  height: AppSizeW.s65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizeH.s25),
                      color: ColorManager.white),
                ),
              ),
              SizedBox(height: AppSizeH.s7),
              ShimmerPlaceholder(
                  child: Container(
                width: AppSizeW.s65,
                height: AppSizeH.s17,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSizeR.s20)),
              ))
            ],
          ),
        ),
        ShimmerPlaceholder(
          child: Container(
            height: AppSizeH.s56,
            padding: EdgeInsetsDirectional.only(
                start: AppSizeW.s19, end: AppSizeW.s7),
            margin: EdgeInsets.symmetric(
                horizontal: AppSizeH.s20, vertical: AppSizeW.s6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeR.s20),
              color: ColorManager.white,
              border: Border.all(
                width: AppSizeW.s2,
                // assign the color to the border color
                color: ColorManager.grey,
              ),
            ),
          ),
        ),
        ShimmerPlaceholder(
          child: Container(
            height: AppSizeH.s56,
            padding: EdgeInsetsDirectional.only(
                start: AppSizeW.s19, end: AppSizeW.s7),
            margin: EdgeInsets.symmetric(
                horizontal: AppSizeH.s20, vertical: AppSizeW.s6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeR.s20),
              color: ColorManager.white,
              border: Border.all(
                width: AppSizeW.s2,
                // assign the color to the border color
                color: ColorManager.grey,
              ),
            ),
          ),
        ),
        ShimmerPlaceholder(
          child: Container(
            height: AppSizeH.s56,
            padding: EdgeInsetsDirectional.only(
                start: AppSizeW.s19, end: AppSizeW.s7),
            margin: EdgeInsets.symmetric(
                horizontal: AppSizeH.s20, vertical: AppSizeW.s6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeR.s20),
              color: ColorManager.white,
              border: Border.all(
                width: AppSizeW.s2,
                // assign the color to the border color
                color: ColorManager.grey,
              ),
            ),
          ),
        ),
        ShimmerPlaceholder(
          child: Container(
            height: AppSizeH.s56,
            padding: EdgeInsetsDirectional.only(
                start: AppSizeW.s19, end: AppSizeW.s7),
            margin: EdgeInsets.symmetric(
                horizontal: AppSizeH.s20, vertical: AppSizeW.s6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizeR.s20),
              color: ColorManager.white,
              border: Border.all(
                width: AppSizeW.s2,
                // assign the color to the border color
                color: ColorManager.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
