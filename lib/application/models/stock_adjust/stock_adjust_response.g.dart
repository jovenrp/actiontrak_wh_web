// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_adjust_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockAdjustResponse _$StockAdjustResponseFromJson(Map<String, dynamic> json) =>
    StockAdjustResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      stockAdjust: (json['stockAdjust'] as List<dynamic>?)
          ?.map((e) => StockAdjustData.fromJson(e as Map<String, dynamic>))
          .toList(),
      stockItems: (json['stock'] as List<dynamic>?)
          ?.map((e) => StockItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockAdjustResponseToJson(
        StockAdjustResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'stockAdjust': instance.stockAdjust,
      'stock': instance.stockItems,
    };
