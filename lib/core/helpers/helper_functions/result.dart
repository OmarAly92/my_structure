import 'package:my_structure/core/error_handling/failures/failure.dart';

typedef FutureResult<T> = Future<Result<T, Failure>>;

/// Abstract result class
sealed class Result<T, E> {
  const Result();

  factory Result.success(T value) = ResultSuccess<T, E>;

  factory Result.failure(E error) = ResultFailure<T, E>;
}

/// Success state containing the value
final class ResultSuccess<T, E> extends Result<T, E> {
  final T value;

  const ResultSuccess(this.value);
}

/// Failure state containing a Failure object
final class ResultFailure<T, E> extends Result<T, E> {
  final E error;

  const ResultFailure(this.error);
}

/// Extensions on Result type for easier handling
extension ResultExtensions<T, E> on Result<T, E> {
  bool get isSuccess => this is ResultSuccess<T, E>;

  bool get isFailure => this is ResultFailure<T, E>;

  T getOrDefault(T defaultValue) {
    return switch (this) {
      ResultSuccess<T, E>(:final value) => value,
      ResultFailure<T, E>() => defaultValue,
    };
  }

  void fold({
    required void Function(T data) onSuccess,
    required void Function(E failure) onFailure,
  }) => switch (this) {
    ResultSuccess<T, E>(:final value) => onSuccess(value),
    ResultFailure<T, E>(:final error) => onFailure(error),
  };

  String get errorMessage {
    return switch (this) {
      ResultFailure<T, E>(:final error) => error.toString(),
      _ => '',
    };
  }
}
