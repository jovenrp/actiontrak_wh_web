// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_tickets_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipTicketsData _$ShipTicketsDataFromJson(Map<String, dynamic> json) =>
    ShipTicketsData(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      fullName: json['fullName'] as String?,
      num: json['num'] as String?,
      type: json['type'] as String?,
      numLines: json['numLines'] as String?,
      status: json['status'] as String?,
      poId: json['poId'] as String?,
      isPartial: json['isPartial'] as String?,
      isComplete: json['isComplete'] as String?,
      vendorId: json['vendorId'] as String?,
      vendorName: json['vendorName'] as String?,
    );

Map<String, dynamic> _$ShipTicketsDataToJson(ShipTicketsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'num': instance.num,
      'type': instance.type,
      'numLines': instance.numLines,
      'status': instance.status,
      'poId': instance.poId,
      'isPartial': instance.isPartial,
      'isComplete': instance.isComplete,
      'vendorId': instance.vendorId,
      'vendorName': instance.vendorName,
    };
