import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/bloc_observer.dart';
import 'app/depndency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await initRentModule();
  await initAppModule().then((value) {
    Bloc.observer = MyBlocObserver();

    runApp(EasyLocalization(
        supportedLocales: supportedLocales,
        path: ASSETS_PATH_LOCALISATION,
        child: const MyApp()));
  });
}
