// ignore_for_file: depend_on_referenced_packages


import 'package:actiontrak_wh/application/models/receive_tickets/receive_ticket_detail_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receive_ticket_details_response.g.dart';

@JsonSerializable()
class ReceiveTicketDetailsResponse {
  const ReceiveTicketDetailsResponse({
    this.error,
    this.message,
    this.receiveTicketDetails,
  });

  factory ReceiveTicketDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveTicketDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiveTicketDetailsResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'receiveTicketDetails')
  final List<ReceiveTicketDetailsData>? receiveTicketDetails;
}
