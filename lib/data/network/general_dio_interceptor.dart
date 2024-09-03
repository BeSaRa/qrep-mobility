// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ebla/app/constants.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/data/network/end_points.dart';
import 'package:ebla/presentations/features/auth/authes.dart';
import 'package:ebla/presentations/features/main/blocs/lookup_bloc/lookup_bloc.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
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
    if (err.response?.statusCode == 401 &&
        (err.requestOptions.path != EndPoints.auth)) {
      try {
        final response = await dio.post(
            "${Constant.cmsBaseUrl}${EndPoints.refreshToken}",
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
          await appPreferences.setCmsUserToken(newToken);
          NavigationKeys.rootNavigatorKey.currentContext!
              .read<LookupBloc>()
              .add(const LookupEvent.initilaEvent());
          await resetAllModules();
          await initHomeModule();
          instance<Dio>().options.headers["authorization"] = "Bearer $newToken";
          return handler
              .resolve(await instance<Dio>().fetch(err.requestOptions));
        } else {
          final response =
              await dio.get("${Constant.cmsBaseUrl}${EndPoints.getTokenApi}",
                  options: Options(
                    headers: {
                      "content-type": "application/json",
                      "accept": "application/json",
                    },
                  ));
          if (response.statusCode == 200) {
            await appPreferences.setUserToken(response.data);
            await appPreferences.setCmsUserToken(Constant.guestToken);
            await appPreferences.setUserRefreshToken("");
            await appPreferences.setUserLoggedIn(false);
            NavigationKeys.rootNavigatorKey.currentContext
                ?.read<LoggedInUserCubit>()
                .save(false);
            errorToast(
                AppStrings().sessionExpired,
                NavigationKeys.rootNavigatorKey.currentContext
                    ?.read<LoggedInUserCubit>());
            NavigationKeys.rootNavigatorKey.currentContext!
                .read<LookupBloc>()
                .add(const LookupEvent.initilaEvent());
            await resetAllModules();
            await initHomeModule();
            instance<Dio>().options.headers["authorization"] =
                "Bearer ${response.data}";
            return handler
                .resolve(await instance<Dio>().fetch(err.requestOptions));
          } else {
            return handler.reject(err);
          }
        }
      } catch (e) {
        final response =
            await dio.get("${Constant.cmsBaseUrl}${EndPoints.getTokenApi}",
                options: Options(
                  headers: {
                    "content-type": "application/json",
                    "accept": "application/json",
                  },
                ));
        if (response.statusCode == 200) {
          await appPreferences.setUserToken(response.data);
          await appPreferences.setCmsUserToken(Constant.guestToken);
          await appPreferences.setUserRefreshToken("");
          await appPreferences.setUserLoggedIn(false);
          NavigationKeys.rootNavigatorKey.currentContext
              ?.read<LoggedInUserCubit>()
              .save(false);
          errorToast(
              AppStrings().sessionExpired,
              NavigationKeys.rootNavigatorKey.currentContext
                  ?.read<LoggedInUserCubit>());
          NavigationKeys.rootNavigatorKey.currentContext!
              .read<LookupBloc>()
              .add(const LookupEvent.initilaEvent());
          await resetAllModules();
          await initHomeModule();
          instance<Dio>().options.headers["authorization"] =
              "Bearer ${response.data}";
          return handler
              .resolve(await instance<Dio>().fetch(err.requestOptions));
        } else {
          NavigationKeys.rootNavigatorKey.currentContext
              ?.read<LoggedInUserCubit>()
              .save(false);
          errorToast(
              AppStrings().sessionExpired,
              NavigationKeys.rootNavigatorKey.currentContext
                  ?.read<LoggedInUserCubit>());
          return handler.reject(err);
        }
      }
    }
    return handler.next(err);
  }
}

class ResponseStatusCode {
  static const int SUCCESS = 200;
  static const int TOKEN_EXPIRED = 401;
}

class GeneralCMSInterceptor extends Interceptor {
  final Dio dio;
  final AppPreferences appPreferences;

  GeneralCMSInterceptor(
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
        {'authorization': 'Bearer ${await appPreferences.getCmsUserToken()}'});
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        (err.requestOptions.path != EndPoints.auth)) {
      try {
        final response = await dio.post(
            "${Constant.cmsBaseUrl}${EndPoints.refreshToken}",
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
          await appPreferences.setCmsUserToken(newToken);
          NavigationKeys.rootNavigatorKey.currentContext!
              .read<LookupBloc>()
              .add(const LookupEvent.initilaEvent());
          await resetAllModules();
          await initHomeModule();
          instance<Dio>().options.headers["authorization"] = "Bearer $newToken";
          return handler
              .resolve(await instance<Dio>().fetch(err.requestOptions));
        } else if (response.statusCode == 401) {
          final response =
              await dio.get("${Constant.cmsBaseUrl}${EndPoints.getTokenApi}",
                  options: Options(
                    headers: {
                      "content-type": "application/json",
                      "accept": "application/json",
                    },
                  ));
          if (response.statusCode == 200) {
            await appPreferences.setUserToken(response.data);
            await appPreferences.setCmsUserToken(Constant.guestToken);
            await appPreferences.setUserRefreshToken("");
            await appPreferences.setUserLoggedIn(false);
            NavigationKeys.rootNavigatorKey.currentContext
                ?.read<LoggedInUserCubit>()
                .save(false);
            errorToast(
                AppStrings().sessionExpired,
                NavigationKeys.rootNavigatorKey.currentContext
                    ?.read<LoggedInUserCubit>());
            NavigationKeys.rootNavigatorKey.currentContext!
                .read<LookupBloc>()
                .add(const LookupEvent.initilaEvent());
            await resetAllModules();
            await initHomeModule();
            instance<Dio>().options.headers["authorization"] =
                "Bearer ${response.data}";
            return handler
                .resolve(await instance<Dio>().fetch(err.requestOptions));
          } else {
            NavigationKeys.rootNavigatorKey.currentContext
                ?.read<LoggedInUserCubit>()
                .save(false);
            errorToast(
                AppStrings().sessionExpired,
                NavigationKeys.rootNavigatorKey.currentContext
                    ?.read<LoggedInUserCubit>());
            return handler.reject(err);
          }
        }
      } catch (e) {
        final response =
            await dio.get("${Constant.cmsBaseUrl}${EndPoints.getTokenApi}",
                options: Options(
                  headers: {
                    "content-type": "application/json",
                    "accept": "application/json",
                  },
                ));
        if (response.statusCode == 200) {
          await appPreferences.setUserToken(response.data);
          await appPreferences.setCmsUserToken(Constant.guestToken);
          await appPreferences.setUserRefreshToken("");
          await appPreferences.setUserLoggedIn(false);
          NavigationKeys.rootNavigatorKey.currentContext
              ?.read<LoggedInUserCubit>()
              .save(false);
          errorToast(
              AppStrings().sessionExpired,
              NavigationKeys.rootNavigatorKey.currentContext
                  ?.read<LoggedInUserCubit>());
          NavigationKeys.rootNavigatorKey.currentContext!
              .read<LookupBloc>()
              .add(const LookupEvent.initilaEvent());
          await resetAllModules();
          await initHomeModule();
          instance<Dio>().options.headers["authorization"] =
              "Bearer ${response.data}";
          return handler
              .resolve(await instance<Dio>().fetch(err.requestOptions));
        } else {
          return handler.reject(err);
        }
      }
    }
    return handler.next(err);
  }
}
