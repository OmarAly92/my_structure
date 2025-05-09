import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:my_structure/core/api/api_request_helpers/end_points.dart';
import 'package:my_structure/core/api/api_request_helpers/refresh_token_interceptor.dart';
import 'package:my_structure/core/api/interceptors/app_interceptor_logger.dart';
import 'package:my_structure/core/error_handling/dio_error_handler/dio_error_handler.dart';
import 'package:my_structure/core/helpers/helper_functions/app_logger.dart';
import 'package:my_structure/core/helpers/shared_preference/preference_helper.dart';
import 'package:my_structure/core/helpers/shared_preference/preference_keys.dart';
import 'package:my_structure/core/api/api_request_helpers/api_consumer.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioConsumer implements ApiConsumer {
  static DioConsumer? _instance;
  final String? baseUrl;

  factory DioConsumer({String? baseUrl}) {
    _instance ??= DioConsumer._internal(Dio(), baseUrl: baseUrl);
    return _instance!;
  }

  DioConsumer._internal(this.client, {this.baseUrl}) {
    if (!kIsWeb) {
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }

    setDioOptions();
    client.interceptors.add(RefreshTokenInterceptor(this));

    if (kDebugMode) {
      client.interceptors.add(
        AppInterceptorLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseMessage: true,
          ),
        ),
      );
      AppLogger.info('Bearer ${PrefHelper.get(PrefKeys.token)}');
    }
  }

  @override
  void setDioOptions() {
    client.options
      ..baseUrl = baseUrl ?? EndPoints.baseUrl
      ..headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language':
            '${PrefHelper.get(PrefKeys.currentLanguage) ?? 'ar'}',
        'Authorization': 'Bearer ${PrefHelper.get(PrefKeys.token)}',
      }
      ..sendTimeout = const Duration(seconds: 40)
      ..receiveTimeout = const Duration(seconds: 40)
      ..connectTimeout = const Duration(seconds: 40);
  }

  @override
  final Dio client;

  @override
  Future<Response> get<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> post<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    T Function(Map<String, dynamic>)? errorFromJsonT,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> put<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  Future<Response> delete<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? errorFromJsonT,
  }) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return response;
    } on DioException catch (error, stacktrace) {
      throw error.getFailure(stacktrace);
    }
  }

  @override
  set client(_) {}
}
