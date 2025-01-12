// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockCountReponse _$StockCountReponseFromJson(Map<String, dynamic> json) =>
    StockCountReponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      stockCount: (json['countTickets'] as List<dynamic>?)
          ?.map((e) => StockCountData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockCountReponseToJson(StockCountReponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'countTickets': instance.stockCount,
    };
