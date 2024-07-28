import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/color_manager.dart';

errorToast(String message, context) {
  FToast fToast;
  fToast = FToast();
  // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  fToast.init(context);

  if (Platform.isIOS) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    currentFocus.unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
  Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            color: ColorManager.primary,
          ),
          const SizedBox(
            width: 12.0,
          ),
          // Text(
          //   message,
          //   style: TextStyle(color: ColorManager.redText),
          // ),
          Flexible(
            child: Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorManager.textBlack),
            ),
          ),
        ],
      ));

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: const Duration(seconds: 5),
  );
}

successToast(String message, context) {
  FToast fToast;
  fToast = FToast();
  // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
  fToast.init(context);

  if (Platform.isIOS) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    currentFocus.unfocus();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
  Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: ColorManager.greyCloud,
          ),
          const SizedBox(
            width: 12.0,
          ),
          // Text(
          //   message,
          //   style: TextStyle(color: ColorManager.grey),
          // ),
          Flexible(
            child: Text(
              message,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ColorManager.textBlack),
            ),
          ),
        ],
      ));

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: const Duration(seconds: 5),
  );
}
