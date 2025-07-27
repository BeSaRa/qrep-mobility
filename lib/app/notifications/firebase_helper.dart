import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

final messaging = FirebaseMessaging.instance;

void getNotificationPermissions() async {
  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
  }
}

Future<String> registerFCMToken() async {
  String token = await messaging.getToken() ?? '';

  if (kDebugMode) {
  }
  return token;
}

Future<void> forGroundHandler(RemoteMessage message) async {
  if (kDebugMode) {

    if (message.notification != null) {
    }
  }

  // showSimpleNotification(
  //     GestureDetector(
  //       onTap: () async {},
  //       child: Container(
  //         margin: const EdgeInsets.all(10),
  //         decoration: BoxDecoration(
  //             color: ColorManager.lightSilver,
  //             borderRadius: const BorderRadius.all(Radius.circular(20))),
  //         padding: EdgeInsets.symmetric(
  //             horizontal: AppSizeH.s30, vertical: AppSizeH.s20),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             SizedBox(
  //               width: AppSizeW.s10,
  //             ),
  //             Flexible(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     background: Colors.transparent);
}

Future<void> backgroundHandler(RemoteMessage message) async {
  getNotificationPermissions();
  if (kDebugMode) {
  }
}
