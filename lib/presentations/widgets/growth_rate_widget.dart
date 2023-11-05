import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GrowthRateWidget extends StatelessWidget {
  //todo: remove the index because the index is only for the dummy data
  const GrowthRateWidget({super.key, required this.index});

  final int index;

  //todo: remove this dummy data and replace it with real data
  final List<GrowthRateData> growthRateData = const [
    GrowthRateData(
        value: '409,030',
        description: 'متوسط سعر القدم المربع',
        growthRate: '2.8 % YoY'),
    GrowthRateData(
        value: '4,030', description: 'عدد المعاملات', growthRate: '2.8 % YoY'),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s20)),
            color: ColorManager.mercury,
          ),
          padding: EdgeInsets.only(
            top: AppSizeH.s7,
            bottom: AppSizeH.s14,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: AppSizeH.s12),
            Text(growthRateData[index].value,
                style: Theme.of(context).textTheme.bodyLarge),
            Text(growthRateData[index].description,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: ColorManager.primary)),
            SizedBox(
              height: AppSizeH.s9,
            ),
            Row(
              children: [
                SizedBox(width: AppSizeW.s20),
                Text(
                  growthRateData[index].growthRate,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: AppSizeSp.s13,
                      ),
                ),
                SizedBox(width: AppSizeW.s17),
                SvgPicture.asset(
                  IconAssets.arrow,
                  height: AppSizeH.s17,
                  width: AppSizeW.s27,
                ),
                SizedBox(width: AppSizeW.s30),
              ],
            )
          ]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSizeH.s7, horizontal: AppSizeW.s10),
          child: Icon(Icons.info_outline,
              color: ColorManager.golden, size: AppSizeSp.s16),
        ),
      ],
    );
  }
}

class GrowthRateData {
  final String value;
  final String description;
  final String growthRate;

  const GrowthRateData(
      {required this.value,
      required this.description,
      required this.growthRate});
}
