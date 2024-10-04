// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_ticket_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveTicketDetailsResponse _$ReceiveTicketDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveTicketDetailsResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      receiveTicketDetails: (json['receiveTicketDetails'] as List<dynamic>?)
          ?.map((e) =>
              ReceiveTicketDetailsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReceiveTicketDetailsResponseToJson(
        ReceiveTicketDetailsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'receiveTicketDetails': instance.receiveTicketDetails,
    };
