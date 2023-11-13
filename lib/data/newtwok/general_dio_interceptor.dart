import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/Auth/requests_auth/request_auth.dart';
import 'package:ebla/domain/repository/repository.dart';

import '../../app/app_preferences.dart';

class GeneralInterceptor extends Interceptor {
  final AppPreferences appPreferences;

  GeneralInterceptor(
    this.appPreferences,
  );

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // GoRouter router = AppRouter.router;
    // Timer(const Duration(seconds: 1), () async {
    //   try {
    //     if (response.statusCode == ResponseStatusCode.SUCCESS) {
    //       (await instance<Repository>().refreshToken(
    //               RefreshToken(refresh_token: "refresh_token", mode: "json")))
    //           .when((success) {
    //         print('success');
    //       }, (error) {
    //         print('error');
    //       });
    //     }
    //   } catch (e) {}
    // });
    return handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // GoRouter router = AppRouter.router;
    // Timer(const Duration(seconds: 1), () async {
    try {
      if (err.response?.statusCode == ResponseStatusCode.TOKEN_EXPIRED) {
        (await instance<Repository>().refreshToken(RefreshToken(
                refresh_token: appPreferences.getUserRefreshToken(),
                mode: "json")))
            .when((success) {
          resetAllModules();
        }, (error) {});
      }
    } catch (e) {}
    // });
    return handler.next(err);
  }
}

class ResponseStatusCode {
  static const int SUCCESS = 200;
  static const int TOKEN_EXPIRED = 401;
}
