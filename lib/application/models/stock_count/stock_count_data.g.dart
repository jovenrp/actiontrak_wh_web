// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_count_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockCountData _$StockCountDataFromJson(Map<String, dynamic> json) =>
    StockCountData(
      id: json['id'] as String?,
      status: json['status'] as String?,
      num: json['num'] as String?,
      containerId: json['containerId'] as String?,
      type: json['type'] as String?,
      comments: json['comments'] as String?,
      notes: json['notes'] as String?,
      isHold: json['isHold'] as String?,
      createdById: json['createdById'] as String?,
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$StockCountDataToJson(StockCountData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'num': instance.num,
      'containerId': instance.containerId,
      'type': instance.type,
      'comments': instance.comments,
      'notes': instance.notes,
      'isHold': instance.isHold,
      'createdById': instance.createdById,
      'fullName': instance.fullName,
    };
