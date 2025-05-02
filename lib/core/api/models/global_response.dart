import 'package:equatable/equatable.dart';
  import 'package:my_structure/core/error_handling/failures/failure.dart';

class GlobalResponse<T> extends Equatable {
  final String? status;
  final String? message;
  final T? data;

  const GlobalResponse({this.status, this.message, this.data});

  factory GlobalResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Map<String, dynamic>)? fromJsonT,
  }) {
    try {
      final rawData = json['data'];
      final parsedData =
          fromJsonT == null
              ? null
              : rawData is List
              ? rawData
                  .map((e) => fromJsonT(e as Map<String, dynamic>))
                  .toList()
              : fromJsonT(rawData as Map<String, dynamic>);

      return GlobalResponse(
        status: json['status'] as String?,
        message: json['message'] as String?,
        data: parsedData as T,
      );
    } catch (error, stackTrace) {
      throw MappingFailure(error: error, stacktrace: stackTrace);
    }
  }

  @override
  List<Object?> get props => [status, message, data];
}
