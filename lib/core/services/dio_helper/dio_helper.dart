import 'dart:developer';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '/core/resources/constants_manager.dart';
import '/core/services/shared_prefrences/cache_helper.dart';
import 'package:dio/dio.dart';

import '../../constant/api_constant.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${AppConstants.sharedPreferences!.getString(SharedKey.token.name)}',
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        compact: true,
        error: true,
        logPrint: (object) {
          log(object.toString());
        },
        responseHeader: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization':
          'Bearer ${AppConstants.sharedPreferences!.getString(SharedKey.token.name)}',
    };
    return await dio.get(path, queryParameters: queryParameters, data: body);
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization':
          'Bearer ${AppConstants.sharedPreferences!.getString(SharedKey.token.name)}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    return await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> delData({
    required String path,
    Map<String, dynamic>? queryParameters,
    String? token,
    dynamic data,
  }) async {
    dio.options.headers = {
      'Authorization':
          'Bearer ${AppConstants.sharedPreferences!.getString(SharedKey.token.name)}',
    };
    return await dio.delete(
      path,
    );
  }

  static Future<Response> updateData({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization':
          'Bearer ${AppConstants.sharedPreferences!.getString(SharedKey.token.name)}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    return await dio.put(
      path,
      data: data,
    );
  }
}
