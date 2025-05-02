import 'package:dio/dio.dart';
import 'package:my_structure/core/error_handling/failures/failure.dart';

part 'response_message.dart';
part 'status_code.dart';

extension DioErrorExtension on DioException {
  Failure<T> getFailure<T>(
    StackTrace stacktrace, {
    T Function(Map<String, dynamic>)? fromJsonValidationErrors,
  }) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure<T>(
          statusCode: StatusCode.connectionTimeout,
          error: ResponseMessage.connectionTimeout,
          stacktrace: stacktrace,
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure<T>(
          statusCode: StatusCode.sendTimeout,
          error: ResponseMessage.sendTimeout,
          stacktrace: stacktrace,
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure<T>(
          statusCode: StatusCode.receiveTimeout,
          error: ResponseMessage.receiveTimeout,
          stacktrace: stacktrace,
        );
      case DioExceptionType.badResponse:
        if (response != null && response?.statusCode != null && response?.statusMessage != null) {
          return ServerFailure<T>(
            statusCode: response?.statusCode ?? 0,
            error: response?.data['message'] ?? '',
            stacktrace: stacktrace,
            validationErrors: fromJsonValidationErrors?.call(
              response?.data['errors'] ?? {},
            ),
          );
        } else {
          return ServerFailure<T>(
            statusCode: StatusCode.badRequest,
            error: ResponseMessage.badRequest,
            stacktrace: stacktrace,
          );
        }
      case DioExceptionType.cancel:
        return ServerFailure<T>(
          statusCode: StatusCode.cancel,
          error: ResponseMessage.cancel,
          stacktrace: stacktrace,
        );
      default:
        return ServerFailure<T>(
          statusCode: StatusCode.kDefault,
          error: ResponseMessage.kDefault,
          stacktrace: stacktrace,
        );
    }
  }
}
