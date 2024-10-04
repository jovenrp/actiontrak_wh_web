// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_tickets_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickTicketsData _$PickTicketsDataFromJson(Map<String, dynamic> json) =>
    PickTicketsData(
      status: json['status'] as String?,
      id: json['id'] as String?,
      destination: json['destination'] as String?,
      numLines: json['numLines'] as String?,
      num: json['num'] as String?,
      user: json['user'] as String?,
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$PickTicketsDataToJson(PickTicketsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'num': instance.num,
      'destination': instance.destination,
      'numLines': instance.numLines,
      'user': instance.user,
      'fullName': instance.fullName,
    };
