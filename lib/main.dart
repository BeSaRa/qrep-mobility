import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'app/depndency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  EasyLocalization.logger.enableBuildModes = [];
  await initRentModule();
  await initAppModule().then((value) async {
    Bloc.observer = MyBlocObserver();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Future.delayed(const Duration(milliseconds: 150));
    runApp(EasyLocalization(
        supportedLocales: supportedLocales,
        path: ASSETS_PATH_LOCALISATION,
        child: const MyApp()));
  });
}
