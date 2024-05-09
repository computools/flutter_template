import 'package:json_annotation/json_annotation.dart';

part 'response_wrapper.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseWrapper<T> {
  final T? results;

  ResponseWrapper({this.results});
  factory ResponseWrapper.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseWrapperFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$ResponseWrapperToJson(this, toJsonT);
}
