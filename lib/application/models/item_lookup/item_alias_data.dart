import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_alias_data.g.dart';

@JsonSerializable()
class ItemAliasData {
  const ItemAliasData({
    this.id,
    this.itemId,
    this.itemName,
    this.sku,
    this.itemNum,
    this.type,
    this.code,
    this.note,
    this.vendorId,
    this.vendorName,
  });

  factory ItemAliasData.fromJson(Map<String, dynamic> json) =>
      _$ItemAliasDataFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAliasDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'itemId')
  final String? itemId;

  @JsonKey(name: 'itemNum')
  final String? itemNum;

  @JsonKey(name: 'itemName')
  final String? itemName;

  @JsonKey(name: 'sku')
  final String? sku;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'note')
  final String? note;

  @JsonKey(name: 'vendorId')
  final String? vendorId;

  @JsonKey(name: 'vendorName')
  final String? vendorName;
}
