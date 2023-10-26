import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/constants.dart';
import 'package:ebla/app/extensions.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/widgets/shimmer_placeholder.dart';
import 'package:flutter/material.dart';
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
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSizeR.s14),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.silver,
                  offset: const Offset(2, 2),
                  spreadRadius: 0.5,
                  blurRadius: AppSizeW.s4),
              BoxShadow(
                  color: ColorManager.silver,
                  offset: const Offset(-2, 2),
                  spreadRadius: 0.5,
                  blurRadius: AppSizeW.s4),
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
                          border:
                              Border.all(width: 1, color: ColorManager.golden),
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
                        border:
                            Border.all(width: 1, color: ColorManager.golden),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: '${Constant.secondaryBaseUrl}/assets/$image',
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
                        Expanded(
                          child: Text(
                            label,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(height: AppSizeH.s6),
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
                                  DateTime.parse(date).toFormattedString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: AppSizeSp.s11,
                                          fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(AppSizeW.s5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.golden),
                              child: Icon(
                                  context.locale == ARABIC_LOCAL
                                      ? Icons.arrow_back_ios_new_rounded
                                      : Icons.arrow_forward_ios_rounded,
                                  size: AppSizeSp.s12,
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
