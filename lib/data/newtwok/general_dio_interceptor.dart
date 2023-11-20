// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ebla/app/constants.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/data/newtwok/end_points.dart';
import 'package:ebla/presentations/features/main/blocs/lookup_bloc/lookup_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app_preferences.dart';

class GeneralInterceptor extends Interceptor {
  final Dio dio;
  final AppPreferences appPreferences;

  GeneralInterceptor(
    this.appPreferences,
    this.dio,
  );

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['authorization'] ==
        "Bearer ${await appPreferences.getUserToken()}") {
      return handler.next(options);
    }

    options.headers.addAll(
        {'authorization': 'Bearer ${await appPreferences.getUserToken()}'});
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final response = await dio.post(
            "${Constant.secondaryBaseUrl}${EndPoints.refreshToken}",
            data: json.encode({
              "refresh_token": appPreferences.getUserRefreshToken(),
              "mode": "json"
            }),
            options: Options(
              headers: {
                "content-type": "application/json",
                "accept": "application/json",
              },
            ));
        if (response.statusCode == 200) {
          var newToken = response.data["data"]["access_token"];
          var refreshToken = response.data["data"]["refresh_token"];
          await appPreferences.setUserToken(newToken);
          await appPreferences.setUserRefreshToken(refreshToken);
          NavigationKeys.rootNavigatorKey.currentContext!
              .read<LookupBloc>()
              .add(const LookupEvent.initilaEvent());
          await resetAllModules();
          await initHomeModule();
          instance<Dio>().options.headers["authorization"] = "Bearer $newToken";
          return handler
              .resolve(await instance<Dio>().fetch(err.requestOptions));
        } else {
          await appPreferences.setUserToken(Constant.guestToken);
          await appPreferences.setUserRefreshToken("");

          instance<Dio>().options.headers["authorization"] =
              "Bearer ${Constant.guestToken}";
          return handler
              .resolve(await instance<Dio>().fetch(err.requestOptions));
        }
      } catch (e) {
        await appPreferences.setUserToken(Constant.guestToken);
        await appPreferences.setUserRefreshToken("");

        instance<Dio>().options.headers["authorization"] =
            "Bearer ${Constant.guestToken}";
        // return handler.resolve(await instance<Dio>().fetch(err.requestOptions));
      }
    }
    return handler.next(err);
  }
}

class ResponseStatusCode {
  static const int SUCCESS = 200;
  static const int TOKEN_EXPIRED = 401;
}
