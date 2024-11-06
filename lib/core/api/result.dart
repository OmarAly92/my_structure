import 'package:my_structure/core/error_handling/error_handler.dart';

class Result<T> {
  Result.success(this._value)
      : _error = FailureHandler(ResponseCode.success, ResponseMessage.success);

  Result.failure(this._error) : _value = null;

  final T? _value;

  final FailureHandler _error;

  bool get isSuccess => _value != null;

  bool get isFailure => _error.message.isNotEmpty;

  T? get value => _value;

  FailureHandler get error => _error;
}
