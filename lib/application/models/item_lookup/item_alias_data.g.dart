// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_alias_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemAliasData _$ItemAliasDataFromJson(Map<String, dynamic> json) =>
    ItemAliasData(
      id: json['id'] as String?,
      itemId: json['itemId'] as String?,
      itemName: json['itemName'] as String?,
      sku: json['sku'] as String?,
      itemNum: json['itemNum'] as String?,
      type: json['type'] as String?,
      code: json['code'] as String?,
      note: json['note'] as String?,
      vendorId: json['vendorId'] as String?,
      vendorName: json['vendorName'] as String?,
    );

Map<String, dynamic> _$ItemAliasDataToJson(ItemAliasData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemNum': instance.itemNum,
      'itemName': instance.itemName,
      'sku': instance.sku,
      'type': instance.type,
      'code': instance.code,
      'note': instance.note,
      'vendorId': instance.vendorId,
      'vendorName': instance.vendorName,
    };
