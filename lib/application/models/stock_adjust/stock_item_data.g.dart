// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockItemData _$StockItemDataFromJson(Map<String, dynamic> json) =>
    StockItemData(
      id: json['id'] as String?,
      containerId: json['containerId'] as String?,
      itemId: json['itemId'] as String?,
      itemNum: json['itemNum'] as String?,
      sku: json['sku'] as String?,
      uom: json['uom'] as String?,
      name: json['name'] as String?,
      qty: json['qty'] as String?,
      stockType: json['stockType'] as String?,
    );

Map<String, dynamic> _$StockItemDataToJson(StockItemData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'containerId': instance.containerId,
      'itemId': instance.itemId,
      'itemNum': instance.itemNum,
      'sku': instance.sku,
      'uom': instance.uom,
      'qty': instance.qty,
      'name': instance.name,
      'stockType': instance.stockType,
    };
