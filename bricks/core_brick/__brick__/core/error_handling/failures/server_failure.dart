part of 'failure.dart';

class ServerFailure<T> extends Failure<T> {
  ServerFailure({
    StackTrace? stacktrace,
    required Object error,
    super.message = '',
    super.statusCode,
    super.apiStatus,
    super.validationErrors,
  }) {
    AppLogger.error(this, stacktrace: stacktrace ?? StackTrace.current);
  }

  ServerFailure.noNetwork({
    StackTrace? stacktrace,
    Object error = 'No network available',
    super.message = '',
    super.statusCode = StatusCode.noInternetConnection,
  }) {
    AppLogger.error(this, stacktrace: stacktrace ?? StackTrace.current);
  }

  @override
  List<Object?> get props => [message, statusCode, apiStatus, validationErrors];
}
