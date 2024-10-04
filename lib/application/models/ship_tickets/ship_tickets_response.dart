
import 'package:actiontrak_wh/application/models/ship_tickets/ship_tickets_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_tickets_response.g.dart';

@JsonSerializable()
class ShipTicketsResponse {
  const ShipTicketsResponse({
    this.error,
    this.message,
    this.shipTickets,
  });

  factory ShipTicketsResponse.fromJson(Map<String, dynamic> json) =>
      _$ShipTicketsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShipTicketsResponseToJson(this);

  @JsonKey(name: 'error')
  final bool? error;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'shipTicketsModel')
  final List<ShipTicketsData>? shipTickets;
}
