import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/resources.dart';

class ErrorGlobalWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? message;
  final bool small;
  const ErrorGlobalWidget({
    super.key,
    this.onPressed,
    this.message,  this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: small?  AppSizeH.s150: MediaQuery.of(context).size.height,
      width: small? AppSizeH.s150:MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: small ? AppSizeH.s50: AppSizeH.s130,
              width:small? AppSizeH.s50: AppSizeH.s130,
              child: Lottie.asset(ImageAssets.animationError)),
          message != null
              ? Column(
                  children: [
                    SizedBox(height: AppSizeH.s10),
                    Text(
                      message ?? '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: AppSizeH.s10),
                  ],
                )
              : const SizedBox(),
          IconButton(onPressed: onPressed, icon: const Icon(Icons.refresh))
        ],
      ),
    );
  }
}
