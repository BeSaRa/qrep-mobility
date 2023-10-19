import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resources/resources.dart';

class ErrorGlobalWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? message;
  const ErrorGlobalWidget({
    super.key,
    this.onPressed,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: AppSizeH.s130,
              width: AppSizeH.s130,
              child: Lottie.asset(ImageAssets.animationError)),
          message != null
              ? Column(
                  children: [
                    SizedBox(height: AppSizeH.s10),
                    Text(
                      message ?? '',
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
