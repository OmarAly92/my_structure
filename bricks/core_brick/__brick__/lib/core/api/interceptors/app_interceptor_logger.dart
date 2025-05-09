import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class AppInterceptorLogger extends TalkerDioLogger {
  AppInterceptorLogger({
    super.talker,
    super.settings = const TalkerDioLoggerSettings(),
    super.addonId,
    this.convertFormData = true,
  });

  final bool convertFormData;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _renderCurlRepresentation(options);
    await Future.delayed(const Duration(milliseconds: 100));
    super.onRequest(options, handler);
  }

  Future<void> _renderCurlRepresentation(RequestOptions requestOptions) async {
    // add a breakpoint here so all errors can break
    try {
      log(await _cURLRepresentation(requestOptions), name: 'CURL');
    } catch (err) {
      log('unable to create a CURL representation of the requestOptions');
    }
  }

  Future<String> _cURLRepresentation(RequestOptions options) async {
    final List<String> components = ['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      // FormData can't be JSON-serialized, so keep only their fields attributes
      if (options.data is FormData && convertFormData == true) {
        options.data = Map.fromEntries(options.data.fields);
      }

      final data = json.encode(options.data).replaceAll('"', '\\"');
      components.add('-d "$data"');
    }

    components.add('"${options.uri.toString()}"');

    return components.join(' \\\n\t');
  }
}
