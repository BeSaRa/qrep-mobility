// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/resources.dart';
import '../../../widgets/shimmer_placeholder.dart';

class RealEstateCard extends StatelessWidget {
  final String name;
  final String country;
  final String phone;
  final String email;
  final bool divider;

  const RealEstateCard({
    super.key,
    required this.name,
    required this.country,
    required this.phone,
    required this.email,
    this.divider = true,
  });

  _callNumber(String num) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: num,
    );
    await launchUrl(launchUri);
  }

  sendEmail(String mail) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: mail,
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppSizeH.s5, vertical: AppSizeH.s5),
      decoration: BoxDecoration(color: Theme.of(context).cardTheme.color),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: AppSizeSp.s14),
                    overflow: TextOverflow.visible,
                    maxLines: 3,
                  ),
                  Text(
                    country,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: AppSizeSp.s12),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _callNumber(phone);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.golden,
                          borderRadius: BorderRadius.circular(AppSizeR.s8)),
                      padding: EdgeInsets.all(AppSizeH.s3),
                      child: Row(
                        children: [
                          Text(
                            AppStrings().callBroker,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.white),
                          ),
                          SizedBox(
                            width: AppSizeW.s5,
                          ),
                          Icon(
                            Icons.local_phone_outlined,
                            color: ColorManager.white,
                            size: AppSizeH.s15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSizeH.s10,
                  ),
                  GestureDetector(
                    onTap: () {
                      sendEmail(email);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.golden,
                          borderRadius: BorderRadius.circular(AppSizeR.s8)),
                      padding: EdgeInsets.all(AppSizeH.s3),
                      child: Row(
                        children: [
                          Text(
                            AppStrings().sendEmail,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: AppSizeSp.s12,
                                    color: ColorManager.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: AppSizeW.s5,
                          ),
                          Icon(
                            Icons.email_outlined,
                            color: ColorManager.white,
                            size: AppSizeH.s15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (divider)
            Padding(
              padding: EdgeInsets.only(top: AppSizeH.s10),
              child: Center(
                child: Divider(
                  color: ColorManager.lightSilver,
                  endIndent: AppSizeW.s15,
                  indent: AppSizeW.s15,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class RealEstateCardShimmer extends StatelessWidget {
  const RealEstateCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: AppSizeH.s5, vertical: AppSizeH.s5),
      decoration: BoxDecoration(color: Theme.of(context).cardTheme.color),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerPlaceholder(
                    child: Container(
                      width: AppSizeW.s100,
                      height: AppSizeH.s25,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(AppSizeR.s12)),
                    ),
                  ),
                  SizedBox(
                    height: AppSizeH.s10,
                  ),
                  ShimmerPlaceholder(
                    child: Container(
                      width: AppSizeW.s50,
                      height: AppSizeH.s20,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(AppSizeR.s12)),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ShimmerPlaceholder(
                    child: Container(
                      width: AppSizeW.s70,
                      height: AppSizeH.s22,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(AppSizeR.s12)),
                    ),
                  ),
                  SizedBox(
                    height: AppSizeH.s10,
                  ),
                  ShimmerPlaceholder(
                    child: Container(
                      width: AppSizeW.s70,
                      height: AppSizeH.s22,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(AppSizeR.s12)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizeH.s10),
            child: Center(
              child: Divider(
                color: ColorManager.lightSilver,
                endIndent: AppSizeW.s15,
                indent: AppSizeW.s15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
