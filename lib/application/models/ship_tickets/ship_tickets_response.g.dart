// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_tickets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipTicketsResponse _$ShipTicketsResponseFromJson(Map<String, dynamic> json) =>
    ShipTicketsResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      shipTickets: (json['shipTicketsModel'] as List<dynamic>?)
          ?.map((e) => ShipTicketsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShipTicketsResponseToJson(
        ShipTicketsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'shipTicketsModel': instance.shipTickets,
    };
