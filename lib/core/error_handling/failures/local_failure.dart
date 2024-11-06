import 'package:equatable/equatable.dart';

import 'failure.dart';

class LocalFailure extends Equatable implements Failure {
  const LocalFailure({
    required this.message,
    required this.statusCode,
  });

  @override
  final String message;
  @override
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];

  @override
  set message(String message) => message;

  @override
  set statusCode(int statusCode) => statusCode;
}
