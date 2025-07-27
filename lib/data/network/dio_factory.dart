// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/app_preferences.dart';
import '../../app/constants.dart';
import '../../app/depndency_injection.dart';
import '../../utils/file_utils.dart';
import 'general_dio_interceptor.dart';

const String APPLICATION_JSON = 'application/json';
const String MULTIPART_JSON = 'multipart/form-data';
const String CONTENT_TYPE = 'content-type';
const String ACCEPT = 'accept';
const String AUTHORIZATION = 'authorization';
const String DEFAULT_LANGUAGE = 'lang';

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    HttpOverrides.global = MyHttpOverrides();
    Dio dio = Dio();
    Duration timeOut = const Duration(seconds: 90);
    String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: 'Bearer ${await _appPreferences.getUserToken()}',
      // AUTHORIZATION: 'Bearer lyHWSTHj1SBm9IRECnLAHviNHnXGaS27',
      DEFAULT_LANGUAGE: language,
    };
    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      headers: headers,
    );
    dio.interceptors.add(instance<GeneralInterceptor>());
    if (kReleaseMode) {
      if (kDebugMode) {
      }
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        compact: true,
        responseHeader: true,
        requestBody: true,
        request: true,
        responseBody: true,
      ));
    }
// Add the interceptor

    // dio.interceptors.add(InterceptorsWrapper(
    //   onError: (e, handler) async {
    //   if (e.response?.statusCode == 401) {
    //     final newToken = await refreshToken();
    //     if (newToken != null) {
    //       dio.options.headers["Authorization"] = "Bearer $newToken";
    //       return handler.resolve(await dio.fetch(e.requestOptions));
    //     }
    //   }
    //   return handler.next(e);
    // },
    // ));
    return dio;
  }

// Future<String> refreshToken() async {
//   try {
//     final refreshToken = _appPreferences.getUserRefreshToken();
//     final response = await instance<TranslationsServiceClient>().refreshToken(
//         RefreshToken(refresh_token: refreshToken, mode: "json"));
//     if (response.response.statusCode == 200) {
//       var token = response.data.data.token;
//       var refreshToken = response.data.data.refreshToken;
//       await _appPreferences.setUserToken(token);
//       await _appPreferences.setUserRefreshToken(refreshToken);
//       return token;
//     } else {
//       await _appPreferences.setUserRefreshToken("");
//       return Constant.guestToken;
//     }
//   } catch (e) {
//     return "";
//   }
// }
}
