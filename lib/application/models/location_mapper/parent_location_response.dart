
import 'package:freezed_annotation/freezed_annotation.dart';
import 'container_data.dart';

part 'parent_location_response.g.dart';

@JsonSerializable()
class ParentLocationResponse {
  ParentLocationResponse({this.error, this.message, this.container});

  factory ParentLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$ParentLocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ParentLocationResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'getContainer')
  final List<ContainerData>? container;

  void setMessage(String value) {
    message = value;
  }
}
