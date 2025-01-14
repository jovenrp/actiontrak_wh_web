// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkuResponse _$SkuResponseFromJson(Map<String, dynamic> json) => SkuResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      skus: (json['skus'] as List<dynamic>?)
          ?.map((e) => SkuData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SkuResponseToJson(SkuResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'skus': instance.skus,
    };
