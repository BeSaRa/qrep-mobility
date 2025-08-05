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

class TrainingDioFactory {
  final AppPreferences _appPreferences;

  TrainingDioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    HttpOverrides.global = MyHttpOverrides();
    Dio dio = Dio();
    Duration timeOut = const Duration(seconds: 90);
    String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: 'Bearer ${Constant.trainingGuestToken}',
/*Note */
      ///هون ضفت هاد الهيدر لحتى ميز انو الريكويست هو من التدريب في ال
      ///GeneralInterceptor 
      ///لكن بعد ما يصير في عنا تسجيل دخول بالتطبيق، فلازم نشيل هالهيدر من هون ومن ال
      ///GeneralInterceptor

      //zak Uncomment this line
      // AUTHORIZATION: 'Bearer ${await _appPreferences.getUserToken()}',
      DEFAULT_LANGUAGE: language,
      'x-training-request': 'true',
    };
    dio.options = BaseOptions(
      //zak change gthe URL
      baseUrl: Constant.aqaratBackendDev,
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
    return dio;
  }
}
