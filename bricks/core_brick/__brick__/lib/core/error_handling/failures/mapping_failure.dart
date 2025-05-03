part of 'failure.dart';

class MappingFailure extends Failure {
  MappingFailure({
    required StackTrace stacktrace,
    required Object error,
    super.message = 'Something went wrong',
    super.statusCode = StatusCode.mappingFailure,
    super.apiStatus,
  }) {
    AppLogger.error(this, stacktrace: stacktrace);
  }

  @override
  List<Object?> get props => [message, statusCode, apiStatus];
}
