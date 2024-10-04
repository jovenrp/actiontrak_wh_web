import 'package:actiontrak_wh/application/models/receive_tickets/receive_ticket_detail_data.dart';
import 'package:actiontrak_wh/application/models/receive_tickets/receive_tickets_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receive_tickets_state.freezed.dart';

@freezed
class ReceiveTicketsState with _$ReceiveTicketsState {
  factory ReceiveTicketsState(
      {@Default(false) bool isLoading,
      @Default(false) bool isStockLoading,
      @Default(false) bool isAdjustLoading,
      @Default(false) bool hasError,
      @Default(false) bool? pickLimitSetting,
      @Default(false) bool? isOverPicked,
      List<ReceiveTicketsData>? receiveTickets,
      List<ReceiveTicketDetailsData>? receiveTicketDetails,
      @Default('') String? errorMessage,
      @Default(false) bool didFinish,
      String? token}) = _ReceiveTicketsState;
}
