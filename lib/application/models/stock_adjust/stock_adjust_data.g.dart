// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_adjust_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockAdjustData _$StockAdjustDataFromJson(Map<String, dynamic> json) =>
    StockAdjustData(
      qty: json['qty'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$StockAdjustDataToJson(StockAdjustData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qty': instance.qty,
    };
