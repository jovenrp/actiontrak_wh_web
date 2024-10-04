
import 'package:actiontrak_wh/application/models/receive_tickets/receive_tickets_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receive_ticket_response.g.dart';

@JsonSerializable()
class ReceiveTicketResponse {
  const ReceiveTicketResponse({
    this.error,
    this.message,
    this.receiveTickets,
  });

  factory ReceiveTicketResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiveTicketResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiveTicketResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'getReceiveTickets')
  final List<ReceiveTicketsData>? receiveTickets;
}
