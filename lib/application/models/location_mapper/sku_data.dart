
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sku_data.g.dart';

@JsonSerializable()
class SkuData {
  const SkuData({this.id, this.sku, this.name});

  factory SkuData.fromJson(Map<String, dynamic> json) =>
      _$SkuDataFromJson(json);
  Map<String, dynamic> toJson() => _$SkuDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'sku')
  final String? sku;

  @JsonKey(name: 'name')
  final String? name;
}
