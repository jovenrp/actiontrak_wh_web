
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_stock_data.g.dart';

@JsonSerializable()
class ItemStockData {
  const ItemStockData({
    this.id,
    this.itemId,
    this.itemName,
    this.sku,
    this.itemNum,
    this.stockType,
    this.qty,
    this.uom,
    this.lotNum,
    this.containerId,
    this.containerCode,
    this.containerName,
    this.containerNum,
  });

  factory ItemStockData.fromJson(Map<String, dynamic> json) =>
      _$ItemStockDataFromJson(json);
  Map<String, dynamic> toJson() => _$ItemStockDataToJson(this);

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

  @JsonKey(name: 'stockType')
  final String? stockType;

  @JsonKey(name: 'qty')
  final String? qty;

  @JsonKey(name: 'uom')
  final String? uom;

  @JsonKey(name: 'lotNum')
  final String? lotNum;

  @JsonKey(name: 'containerId')
  final String? containerId;

  @JsonKey(name: 'containerCode')
  final String? containerCode;

  @JsonKey(name: 'containerNum')
  final String? containerNum;

  @JsonKey(name: 'containerName')
  final String? containerName;
}
