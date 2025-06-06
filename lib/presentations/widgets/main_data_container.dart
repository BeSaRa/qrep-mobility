import 'package:easy_localization/easy_localization.dart' as local;
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/shimmer_placeholder.dart';
import 'package:flutter/material.dart';

class MainDataContainer extends StatelessWidget {
  final String title;
  final String totalPrice;
  final String value;
  final String valueDescription;
  final String? unit;
  final String titleInfo;
  final String valueInfo;
  final String location;
  final String? descripton;
  final bool hasRooms;

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
    this.hasRooms = true,
    this.unit,
  });

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
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: AppSizeSp.s15),
                    ),
                    SizedBox(width: AppSizeW.s4),
                    Row(
                      children: [
                        Text(valueDescription,
                            style: Theme.of(context).textTheme.titleSmall),
                        unit != null
                            ? Text('($unit)',
                                style: Theme.of(context).textTheme.titleSmall)
                            : const SizedBox(),
                      ],
                    ),
                  ],
                ),
                if (hasRooms)
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurface,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(AppSizeR.s5),
                            bottomStart: Radius.circular(AppSizeR.s5))),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizeW.s20, vertical: AppSizeH.s5),
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
                ),
                Container(
                  width: AppSizeW.s1,
                  height: AppSizeH.s15,
                  color: Theme.of(context).dividerTheme.color,
                ),
                Expanded(
                  child: Text(
                    descripton ?? "",
                    textDirection: (context.locale == ARABIC_LOCAL)
                        ? TextDirection.ltr
                        : TextDirection.rtl,
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

class ShimmerMainContainer extends StatelessWidget {
  const ShimmerMainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: AppSizeH.s4, horizontal: AppSizeH.s20),
      padding: EdgeInsets.symmetric(vertical: AppSizeH.s12),
      decoration: BoxDecoration(
        color: ColorManager.white,
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
                    height: AppSizeH.s15,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSizeR.s12)),
                  ),
                ),
                ShimmerPlaceholder(
                  child: Container(
                    width: AppSizeW.s76,
                    height: AppSizeH.s15,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
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
                      height: AppSizeH.s15,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
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
                      height: AppSizeH.s15,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
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
                      ShimmerPlaceholder(
                        child: Container(
                          width: AppSizeW.s50,
                          height: AppSizeH.s12,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
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
                  child: Text(
                    "",
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
