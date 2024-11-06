import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:my_structure/core/api/api_consumer.dart';
import 'package:my_structure/core/api/app_interceptors.dart';
import 'package:my_structure/core/error_handling/error_handler.dart';
import 'package:my_structure/core/utils/service_locator.dart';

class DioConsumer implements ApiConsumer {
  DioConsumer(this.client) {
    if (!kIsWeb) {
      (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final client = HttpClient();
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }
    client.interceptors.add(sl<AppInterceptor>());
  }

  final Dio client;

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await client.get(
      path,
      queryParameters: queryParameters,
    );
    return response;
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return response;
    } on DioException catch (error) {
      throw ErrorHandler.handle(error).failureHandler;
    }
  }

  @override
  Future<Response> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      return response;
    } on DioException catch (error) {
      throw ErrorHandler.handle(error).failureHandler;
    }
  }

  @override
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (error) {
      throw ErrorHandler.handle(error).failureHandler;
    }
  }
}
