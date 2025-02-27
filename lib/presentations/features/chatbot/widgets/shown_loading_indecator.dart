import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShownLoadingIndecetorWidget extends StatelessWidget {
  const ShownLoadingIndecetorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizeW.s30,
          width: AppSizeW.s30,
          child: const Image(
            image: AssetImage(ImageAssets.chatBot),
          ),
        ),
        SizedBox(width: AppSizeW.s5),
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
            margin: EdgeInsets.symmetric(vertical: AppSizeH.s15),
            decoration: BoxDecoration(
                // color: Theme.of(context).dividerColor,
                color: Theme.of(context).canvasColor,
                borderRadius: context.locale == ARABIC_LOCAL
                    ? BorderRadius.only(
                        topLeft: Radius.circular(AppSizeR.s15),
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(AppSizeR.s15),
                        bottomRight: Radius.circular(AppSizeR.s15))
                    : BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(AppSizeR.s15),
                        bottomLeft: Radius.circular(AppSizeR.s15),
                        bottomRight: Radius.circular(AppSizeR.s15))),
            child: SizedBox(
                height: AppSizeH.s40,
                width: AppSizeH.s40,
                child: Lottie.asset(ImageAssets.chatBotIndecetor)),
          ),
        ),
      ],
    );
  }
}
