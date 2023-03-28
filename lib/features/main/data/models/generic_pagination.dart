import 'package:json_annotation/json_annotation.dart';

part 'generic_pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GenericPagination<T> {
  @JsonKey(name: 'code')
  final int? code;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data', defaultValue: [])
  final List<T> data;
  @JsonKey(name: 'count', defaultValue: 0)
  final int count;

  GenericPagination({
    required this.code,
    required this.message,
    required this.data,
    required this.count,
  });
  factory GenericPagination.fromJson(
          Map<String, dynamic> json, T Function(Object?) fetch) =>
      _$GenericPaginationFromJson(json, fetch);
}
