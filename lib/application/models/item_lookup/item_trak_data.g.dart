// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_trak_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTrakData _$ItemTrakDataFromJson(Map<String, dynamic> json) => ItemTrakData(
      id: json['id'] as String?,
      itemId: json['itemId'] as String?,
      itemName: json['itemName'] as String?,
      itemNum: json['itemNum'] as String?,
      qtyMin: json['qtyMin'] as String?,
      qtyAlert: json['qtyAlert'] as String?,
      qtyMax: json['qtyMax'] as String?,
      qtyCap: json['qtyCap'] as String?,
      qtyDemand: json['qtyDemand'] as String?,
      containerId: json['containerId'] as String?,
      containerCode: json['containerCode'] as String?,
      containerName: json['containerName'] as String?,
      containerNum: json['containerNum'] as String?,
    );

Map<String, dynamic> _$ItemTrakDataToJson(ItemTrakData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemNum': instance.itemNum,
      'itemName': instance.itemName,
      'qtyMin': instance.qtyMin,
      'qtyAlert': instance.qtyAlert,
      'qtyMax': instance.qtyMax,
      'qtyCap': instance.qtyCap,
      'qtyDemand': instance.qtyDemand,
      'containerId': instance.containerId,
      'containerCode': instance.containerCode,
      'containerNum': instance.containerNum,
      'containerName': instance.containerName,
    };
