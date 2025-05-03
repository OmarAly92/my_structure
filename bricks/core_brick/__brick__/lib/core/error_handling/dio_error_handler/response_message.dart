part of 'dio_error_handler.dart';

sealed class ResponseMessage {
  static const String badRequest = ErrorStrings.badRequestError;
  static const String kDefault = ErrorStrings.defaultError;
  static const String receiveTimeout = ErrorStrings.timeoutError;
  static const String sendTimeout = ErrorStrings.timeoutError;
  static const String cancel = ErrorStrings.defaultError;
  static const String connectionTimeout = ErrorStrings.timeoutError;
}

sealed class ErrorStrings {
  static const String badRequestError = 'Oops! Something went wrong. Please try again later';
  static const String timeoutError = 'Connection timed out. Try again';
  static const String defaultError = 'Something went wrong. Try again';
}
