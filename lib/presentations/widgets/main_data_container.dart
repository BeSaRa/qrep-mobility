import 'package:flutter/material.dart';


import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class MainDataContainer extends StatelessWidget {
  final String title;
  final String totalPrice;
  final String value;
  final String valueDescription;
  final String titleInfo;
  final String valueInfo;
  final String location;
  final String? descripton;

  const MainDataContainer({
    super.key,
    required this.title,
    required this.totalPrice,
    required this.value,
    required this.valueDescription,
    required this.titleInfo,
    required this.valueInfo,
    required this.location,
    this.descripton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s12),
      decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(1, 1),
              spreadRadius: AppSizeR.s2,
              blurRadius: AppSizeR.s11,
              color: ColorManager.black.withAlpha(6))
        ],
        borderRadius: BorderRadius.circular(AppSizeR.s12),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(totalPrice,
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
          SizedBox(height: AppSizeH.s20),
          Padding(
            padding: EdgeInsetsDirectional.only(start: AppSizeW.s15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      value,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(width: AppSizeW.s4),
                    Text(valueDescription,
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Hex16Color.fromHex('#FFE5FE'),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(AppSizeR.s5),
                          bottomStart: Radius.circular(AppSizeR.s5))),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizeW.s25, vertical: AppSizeH.s5),
                  child: Row(
                    children: [
                      Text(
                        titleInfo,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        valueInfo,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: AppSizeH.s12),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: AppSizeW.s15, end: AppSizeW.s24),
            child: Divider(
              color: ColorManager.grey,
              height: AppSizeH.s1,
            ),
          ),
          SizedBox(height: AppSizeH.s7),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: ColorManager.primary,
                        size: AppSizeH.s16,
                      ),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: AppSizeW.s1,
                  height: AppSizeH.s15,
                  color: ColorManager.grey,
                ),
                Expanded(
                  child: Text(
                    descripton ?? "",
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
