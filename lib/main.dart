import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/notifications/firebase_helper.dart';
import 'package:ebla/app/translations_assets_loader/translations_assets_loader.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'app/depndency_injection.dart';
import 'app/notifications/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  EasyLocalization.logger.enableBuildModes = [];
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .whenComplete(
    () {
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);
      FirebaseMessaging.onMessage.listen(
        (RemoteMessage message) {
          forGroundHandler(message);
        },
      );
    },
  );
  await initAppModule();
  await initTranslationsModule();
  Bloc.observer = MyBlocObserver();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Future.delayed(const Duration(milliseconds: 150));

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    backgroundHandler(message);
    if (kDebugMode) {
      print("i got a background message $message");
    }
  });
  return runApp(
    EasyLocalization(
      assetLoader: TranslationsAssetsLoader(
        loadRemoteAssets: false,
        updateInterval: const Duration(days: 3),
      ),
      supportedLocales: supportedLocales,
      path: ASSETS_PATH_LOCALISATION,
      child: const MyApp(),
    ),
  );
}
