import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class RentGridItemWidget extends StatelessWidget {
  const RentGridItemWidget({super.key, required this.index});

  final int index;
  //todo: this should be removed once we have real data from api
  final List<GridItemData> gridItemsData = const [
    GridItemData(
        title: "إجمالي عدد  \nعقود الإيجار",
        value: "983",
        imagePath: 'imagePath',
        valueUnit: ''),
    GridItemData(
        title: "إجمالي عدد الوحدات \n العقارات المستأجرة \\",
        value: "983",
        imagePath: 'imagePath',
        valueUnit: ''),
    GridItemData(
        title: "متوسط قيمة الإيجار\n لكل وحدة \\ عقار",
        value: "5,790",
        imagePath: "imagePath",
        valueUnit: 'ر.ق'),
    GridItemData(
        title: "إجمالي قيمة عقود\n الإيجار",
        value: "716,104",
        imagePath: "imagePath",
        valueUnit: 'ر.ق'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizeR.s20)),
        boxShadow: [
          BoxShadow(
              offset: const Offset(1, 1),
              spreadRadius: AppSizeR.s2,
              blurRadius: AppSizeR.s11,
              color: ColorManager.black.withAlpha(30)),
        ],
        gradient: LinearGradient(
          colors: [
            ColorManager.platinum,
            ColorManager.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.2, 1.0],
        ),
      ),
      child: Column(children: [
        SizedBox(height: AppSizeH.s16),
        Row(
          children: [
            Expanded(
              child: Text(gridItemsData[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppSizeSp.s13, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
        SizedBox(
          height: AppSizeH.s14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: AppSizeW.s28),
            Flexible(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      gridItemsData[index].value,
                      style: TextStyle(
                          fontSize: AppSizeSp.s18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    gridItemsData[index].valueUnit,
                    style: TextStyle(
                        fontSize: AppSizeSp.s18, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Image.asset(
                ImageAssets.soldOrRentedUnits,
                height: AppSizeH.s65,
                width: AppSizeW.s65,
              ),
            ),
          ],
        )
      ]),
    );
  }
}

// todo: remove this once you have real data
class GridItemData {
  final String title;
  final String value;
  final String imagePath;
  final String valueUnit;

  const GridItemData(
      {required this.title,
      required this.value,
      required this.imagePath,
      required this.valueUnit});
}