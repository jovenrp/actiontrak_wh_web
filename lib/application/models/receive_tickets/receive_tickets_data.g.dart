// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_tickets_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveTicketsData _$ReceiveTicketsDataFromJson(Map<String, dynamic> json) =>
    ReceiveTicketsData(
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

Map<String, dynamic> _$ReceiveTicketsDataToJson(ReceiveTicketsData instance) =>
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
