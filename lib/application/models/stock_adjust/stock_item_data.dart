
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_item_data.g.dart';

@JsonSerializable()
class StockItemData {
  const StockItemData({
    this.id,
    this.containerId,
    this.itemId,
    this.itemNum,
    this.sku,
    this.uom,
    this.name,
    this.qty,
    this.stockType,
  });

  factory StockItemData.fromJson(Map<String, dynamic> json) =>
      _$StockItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$StockItemDataToJson(this);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'containerId')
  final String? containerId;

  @JsonKey(name: 'itemId')
  final String? itemId;

  @JsonKey(name: 'itemNum')
  final String? itemNum;

  @JsonKey(name: 'sku')
  final String? sku;

  @JsonKey(name: 'uom')
  final String? uom;

  @JsonKey(name: 'qty')
  final String? qty;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'stockType')
  final String? stockType;
}
