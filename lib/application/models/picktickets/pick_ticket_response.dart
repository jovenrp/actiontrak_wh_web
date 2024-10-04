import 'package:actiontrak_wh/application/models/picktickets/pick_tickets_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pick_ticket_response.g.dart';

@JsonSerializable()
class PickTicketResponse {
  const PickTicketResponse({
    this.error,
    this.message,
    this.records,
    this.pickTickets,
  });

  factory PickTicketResponse.fromJson(Map<String, dynamic> json) =>
      _$PickTicketResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PickTicketResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'records')
  final String? records;

  @JsonKey(name: 'pickTickets')
  final List<PickTicketsData>? pickTickets;
}