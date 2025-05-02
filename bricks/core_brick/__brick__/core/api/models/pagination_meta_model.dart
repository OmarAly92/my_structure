import 'package:equatable/equatable.dart';
import 'package:my_structure/core/error_handling/failures/failure.dart';

class PaginationMetaModel extends Equatable {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  const PaginationMetaModel({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory PaginationMetaModel.fromJson(Map<String, dynamic> json) {
    try {
      return PaginationMetaModel(
        currentPage: json['current_page'],
        from: json['from'],
        lastPage: json['last_page'],
        path: json['path'],
        perPage: json['per_page'],
        to: json['to'],
        total: json['total'],
      );
    } catch (error, stacktrace) {
      throw MappingFailure(error: error, stacktrace: stacktrace);
    }
  }

  @override
  List<Object?> get props => [
    currentPage,
    from,
    lastPage,
    path,
    perPage,
    to,
    total,
  ];
}
