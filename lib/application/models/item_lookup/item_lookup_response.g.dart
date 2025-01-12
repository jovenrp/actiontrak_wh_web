// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_lookup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemLookupResponse _$ItemLookupResponseFromJson(Map<String, dynamic> json) =>
    ItemLookupResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      itemAlias: (json['itemAlias'] as List<dynamic>?)
          ?.map((e) => ItemAliasData.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemStock: (json['stock'] as List<dynamic>?)
          ?.map((e) => ItemStockData.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemTrak: (json['trak'] as List<dynamic>?)
          ?.map((e) => ItemTrakData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemLookupResponseToJson(ItemLookupResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'itemAlias': instance.itemAlias,
      'stock': instance.itemStock,
      'trak': instance.itemTrak,
    };
