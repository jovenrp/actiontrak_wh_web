
import 'package:freezed_annotation/freezed_annotation.dart';
import 'container_data.dart';

part 'child_location_response.g.dart';

@JsonSerializable()
class ChildLocationResponse {
  ChildLocationResponse({this.error, this.message, this.container});

  factory ChildLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$ChildLocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChildLocationResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'container')
  final List<ContainerData>? container;

  void setMessage(String value) {
    message = value;
  }
}
