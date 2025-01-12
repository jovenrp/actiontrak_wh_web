
import 'package:freezed_annotation/freezed_annotation.dart';

import 'sku_data.dart';

part 'sku_response.g.dart';

@JsonSerializable()
class SkuResponse {
  const SkuResponse({this.error, this.message, this.skus});

  factory SkuResponse.fromJson(Map<String, dynamic> json) =>
      _$SkuResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SkuResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'skus')
  final List<SkuData>? skus;
}
