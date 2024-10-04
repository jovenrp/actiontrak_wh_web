import 'package:actiontrak_wh/application/models/ship_tickets/ship_tickets_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_tickets_state.freezed.dart';

@freezed
class ShipTicketsState with _$ShipTicketsState {
  factory ShipTicketsState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    List<ShipTicketsData>? shipTickets,
    String? errorMessage,
  }) = _ShipTicketsState;
}
