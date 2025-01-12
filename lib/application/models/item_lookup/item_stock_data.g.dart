// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemStockData _$ItemStockDataFromJson(Map<String, dynamic> json) =>
    ItemStockData(
      id: json['id'] as String?,
      itemId: json['itemId'] as String?,
      itemName: json['itemName'] as String?,
      sku: json['sku'] as String?,
      itemNum: json['itemNum'] as String?,
      stockType: json['stockType'] as String?,
      qty: json['qty'] as String?,
      uom: json['uom'] as String?,
      lotNum: json['lotNum'] as String?,
      containerId: json['containerId'] as String?,
      containerCode: json['containerCode'] as String?,
      containerName: json['containerName'] as String?,
      containerNum: json['containerNum'] as String?,
    );

Map<String, dynamic> _$ItemStockDataToJson(ItemStockData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemNum': instance.itemNum,
      'itemName': instance.itemName,
      'sku': instance.sku,
      'stockType': instance.stockType,
      'qty': instance.qty,
      'uom': instance.uom,
      'lotNum': instance.lotNum,
      'containerId': instance.containerId,
      'containerCode': instance.containerCode,
      'containerNum': instance.containerNum,
      'containerName': instance.containerName,
    };
