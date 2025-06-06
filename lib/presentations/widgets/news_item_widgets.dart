import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/resources/theme_manager.dart';
import 'package:ebla/presentations/widgets/shimmer_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class NewsItemWidget extends StatelessWidget {
  final String label;
  final String date;
  final String image;
  final bool? isLoading;

  const NewsItemWidget({
    super.key,
    required this.label,
    required this.date,
    this.isLoading,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizeW.s7, vertical: AppSizeH.s7),
        decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(AppSizeR.s14),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  offset: const Offset(1, 1),
                  blurRadius: AppSizeW.s2,
                  spreadRadius: AppSizeW.s1),
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  offset: const Offset(-1, -1),
                  blurRadius: AppSizeW.s2,
                  spreadRadius: AppSizeW.s1),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isLoading ?? false
                ? Expanded(
                    flex: 2,
                    child: ShimmerPlaceholder(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSizeR.s10),
                          // border:
                          //     Border.all(width: 1, color: ColorManager.golden),
                        ),
                        child: const Image(
                          image: AssetImage(
                            ImageAssets.test,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizeR.s10),
                        // border:
                        //     Border.all(width: 1, color: ColorManager.golden),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: image == "" ? ImageAssets.test : image,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const ShimmerPlaceholder(
                            child: Image(
                              image: AssetImage(
                                ImageAssets.test,
                              ),
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const ShimmerPlaceholder(
                            child: Image(
                              image: AssetImage(
                                ImageAssets.test,
                              ),
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSizeR.s10),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                )),
                          );
                        },
                      ),
                    )),
            SizedBox(width: AppSizeW.s14),
            isLoading ?? false
                ? Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ShimmerPlaceholder(
                                child: Container(
                                  width: double.infinity,
                                  height: AppSizeH.s12,
                                  decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius:
                                          BorderRadius.circular(AppSizeR.s12)),
                                ),
                              ),
                              SizedBox(height: AppSizeH.s6),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    end: AppSizeW.s20),
                                child: ShimmerPlaceholder(
                                  child: Container(
                                    width: double.infinity,
                                    height: AppSizeH.s12,
                                    decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        borderRadius: BorderRadius.circular(
                                            AppSizeR.s12)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  size: AppSizeSp.s12,
                                  color: ColorManager.cloudyGrey,
                                ),
                                SizedBox(width: AppSizeW.s5),
                                ShimmerPlaceholder(
                                  child: Container(
                                    width: AppSizeW.s50,
                                    height: AppSizeH.s12,
                                    decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        borderRadius: BorderRadius.circular(
                                            AppSizeR.s12)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizeH.s6),
                      ],
                    ),
                  )
                : Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(height: AppSizeH.s6),
                        Expanded(
                          child: Html(data: label, style: {
                            "body": Style(
                                margin: Margins.all(0),
                                fontFamily: FontConstants.fontFamily,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                                fontSize: FontSize(AppSizeSp.s14),
                                textOverflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                fontWeight: FontWeight.w400)
                          }),
                        ),
                        // SizedBox(height: AppSizeH.s6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  size: AppSizeSp.s12,
                                  color: ColorManager.cloudyGrey,
                                ),
                                SizedBox(width: AppSizeW.s5),
                                Text(
                                  DateTime.parse(date).toShowDateTime(
                                      local: context.locale.languageCode),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: AppSizeSp.s11,
                                          fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            // SizedBox(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizeW.s6,
                                  vertical: AppSizeH.s6),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                              child: Icon(Icons.arrow_forward_ios_rounded,
                                  size: AppSizeSp.s10,
                                  color: ColorManager.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
          ],
        ));
  }
}
