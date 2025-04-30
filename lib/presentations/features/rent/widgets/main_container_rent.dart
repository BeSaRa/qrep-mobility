import 'package:flutter/material.dart';

import '../../../resources/resources.dart';
import '../../../widgets/shimmer_placeholder.dart';

class MainRentDataContainer extends StatelessWidget {
  final String title;
  final String totalPrice;
  final String startDate;
  final String endDate;
  final String contract;
  final String titleInfo;
  final String valueInfo;
  final String location;
  final String? descripton;
  final bool hasRooms;
  final String? history;

  const MainRentDataContainer({
    super.key,
    required this.title,
    required this.totalPrice,
    required this.titleInfo,
    required this.valueInfo,
    required this.location,
    this.descripton,
    this.hasRooms = true,
    required this.startDate,
    required this.endDate,
    required this.history,
    required this.contract,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: AppSizeH.s4, horizontal: AppSizeH.s20),
      padding: EdgeInsets.only(bottom: AppSizeH.s12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        boxShadow: [
          BoxShadow(
              offset: const Offset(1, 1),
              spreadRadius: AppSizeR.s2,
              blurRadius: AppSizeR.s11,
              color: ColorManager.textBlack.withAlpha(6))
        ],
        borderRadius: BorderRadius.circular(AppSizeR.s12),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: AppSizeH.s10),
            padding: EdgeInsets.symmetric(
                vertical: AppSizeH.s5, horizontal: AppSizeW.s10),
            decoration: BoxDecoration(
                color: ColorManager.golden,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizeR.s10),
                    bottomRight: Radius.circular(AppSizeR.s10))),
            child: Text(
              '${AppStrings().rentContractHistory}:$history',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '$title:',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(totalPrice,
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: AppSizeH.s16,
                    ),
                    Text(
                      location,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizeH.s20),
          Padding(
            padding: EdgeInsetsDirectional.only(start: AppSizeW.s15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      descripton ?? "",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "${AppStrings().contractType}: ${contract}",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Text(
                //       value,
                //       style: Theme.of(context).textTheme.bodyLarge,
                //     ),
                //     SizedBox(width: AppSizeW.s4),
                //     Text(valueDescription,
                //         style: Theme.of(context).textTheme.titleSmall),
                //   ],
                // ),
                if (hasRooms)
                  Container(
                    decoration: BoxDecoration(
                        // color: Theme.of(context).colorScheme.,
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
                        SizedBox(
                          width: AppSizeW.s2,
                        ),
                        Text(
                          valueInfo,
                          style: valueInfo.contains(AppStrings().unspecified)
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: AppSizeSp.s10)
                              : Theme.of(context).textTheme.bodyMedium,
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
              color: Theme.of(context).dividerTheme.color,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${AppStrings().startDate}:",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        startDate,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: AppSizeW.s1,
                  height: AppSizeH.s15,
                  color: Theme.of(context).dividerTheme.color,
                  margin: EdgeInsets.symmetric(horizontal: AppSizeW.s6),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${AppStrings().endDate}:",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        endDate,
                        // textDirection: TextDirection.ltr,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
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

class ShimmerMainRentDataContainer extends StatelessWidget {
  const ShimmerMainRentDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: AppSizeH.s4, horizontal: AppSizeH.s20),
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        boxShadow: [
          BoxShadow(
              offset: const Offset(1, 1),
              spreadRadius: AppSizeR.s2,
              blurRadius: AppSizeR.s11,
              color: ColorManager.textBlack.withAlpha(6))
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
                ShimmerPlaceholder(
                  child: Container(
                    width: AppSizeW.s76,
                    // width: double.infinity,
                    height: AppSizeH.s12,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(AppSizeR.s12)),
                  ),
                ),
                ShimmerPlaceholder(
                  child: Container(
                    width: AppSizeW.s76,
                    height: AppSizeH.s12,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(AppSizeR.s12)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizeH.s21),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizeW.s14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ShimmerPlaceholder(
                    child: Container(
                      // width: double.infinity,
                      height: AppSizeH.s12,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(AppSizeR.s12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizeH.s20),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: AppSizeW.s14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ShimmerPlaceholder(
                    child: Container(
                      // width: double.infinity,
                      height: AppSizeH.s12,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(AppSizeR.s12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizeH.s12),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: AppSizeW.s15, end: AppSizeW.s24),
            child: Divider(
              color: Theme.of(context).dividerTheme.color,
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
                      ShimmerPlaceholder(
                        child: Container(
                          width: AppSizeW.s50,
                          height: AppSizeH.s12,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s12)),
                        ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ShimmerPlaceholder(
                        child: Container(
                          width: AppSizeW.s50,
                          height: AppSizeH.s12,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s12)),
                        ),
                      ),
                    ],
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
