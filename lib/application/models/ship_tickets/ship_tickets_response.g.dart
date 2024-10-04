// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_tickets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipTicketsResponse _$ShipTicketsResponseFromJson(Map<String, dynamic> json) =>
    ShipTicketsResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ShipTicketsResponseToJson(
        ShipTicketsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };
