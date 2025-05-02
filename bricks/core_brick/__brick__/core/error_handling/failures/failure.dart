import 'package:equatable/equatable.dart';
import 'package:my_structure/core/error_handling/dio_error_handler/dio_error_handler.dart';
import 'package:my_structure/core/helpers/helper_functions/app_logger.dart';

part 'local_failure.dart';
part 'mapping_failure.dart';
part 'server_failure.dart';

abstract class Failure<T> extends Equatable implements Exception {
  const Failure({
    required this.message,
    this.statusCode,
    this.apiStatus,
    this.validationErrors,
  });

  /// This is user friendly message
  final String message;

  /// For Api
  final int? statusCode;
  final String? apiStatus;
  final T? validationErrors;
}
