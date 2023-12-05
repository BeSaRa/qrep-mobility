import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../resources/resources.dart';

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
          EdgeInsets.symmetric(horizontal: AppSizeH.s10, vertical: AppSizeH.s5),
      decoration: BoxDecoration(color: ColorManager.white),
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
                        ?.copyWith(fontSize: AppSizeSp.s12),
                  ),
                  Text(
                    country,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: AppSizeSp.s12),
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
                    child: Row(
                      children: [
                        Text(
                          phone,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: AppSizeSp.s14),
                        ),
                        SizedBox(
                          width: AppSizeW.s5,
                        ),
                        Icon(
                          Icons.local_phone_outlined,
                          color: ColorManager.golden,
                          size: AppSizeH.s15,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendEmail(email);
                    },
                    child: Row(
                      children: [
                        Text(
                          email,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: AppSizeSp.s14),
                        ),
                        SizedBox(
                          width: AppSizeW.s5,
                        ),
                        Icon(
                          Icons.email_outlined,
                          color: ColorManager.golden,
                          size: AppSizeH.s15,
                        ),
                      ],
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
