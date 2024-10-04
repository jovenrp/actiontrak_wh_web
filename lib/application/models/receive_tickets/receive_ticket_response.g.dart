// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveTicketResponse _$ReceiveTicketResponseFromJson(
        Map<String, dynamic> json) =>
    ReceiveTicketResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      receiveTickets: (json['getReceiveTickets'] as List<dynamic>?)
          ?.map((e) => ReceiveTicketsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReceiveTicketResponseToJson(
        ReceiveTicketResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'getReceiveTickets': instance.receiveTickets,
    };
