part of 'failure.dart';

class LocalFailure<T> extends Failure<T> {
  LocalFailure({
    StackTrace? stacktrace,
    required Object error,
    super.message = 'Something went wrong',
    super.statusCode,
    super.apiStatus,
    super.validationErrors,
  }) {
    AppLogger.error(this, stacktrace: stacktrace ?? StackTrace.current);
  }

  @override
  List<Object?> get props => [message, statusCode, apiStatus, validationErrors];
}
