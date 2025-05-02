import 'package:equatable/equatable.dart';
import 'package:my_structure/core/api/models/pagination_meta_model.dart';
import 'package:my_structure/core/error_handling/failures/failure.dart';

class PaginationModel<T> extends Equatable {
  final String? status;
  final String? message;
  final List<T>? data;
  final PaginationMetaModel? meta;

  const PaginationModel({this.status, this.message, this.data, this.meta});

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    try {
      return PaginationModel(
        status: json['status'],
        message: json['message'],
        data:
            (json['data'] as List?)
                ?.map((e) => fromJsonT(e as Map<String, dynamic>))
                .toList(),
        meta:
            json['meta'] != null
                ? PaginationMetaModel.fromJson(json['meta'])
                : null,
      );
    } catch (error, stacktrace) {
      throw MappingFailure(error: error, stacktrace: stacktrace);
    }
  }

  PaginationModel<T> copyWith({
    String? status,
    String? message,
    List<T>? data,
    PaginationMetaModel? meta,
  }) {
    return PaginationModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }

  @override
  List<Object?> get props => [status, message, data, meta];
}
