// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickTicketResponse _$PickTicketResponseFromJson(Map<String, dynamic> json) =>
    PickTicketResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      records: json['records'] as String?,
      pickTickets: (json['pickTickets'] as List<dynamic>?)
          ?.map((e) => PickTicketsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PickTicketResponseToJson(PickTicketResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'records': instance.records,
      'pickTickets': instance.pickTickets,
    };
