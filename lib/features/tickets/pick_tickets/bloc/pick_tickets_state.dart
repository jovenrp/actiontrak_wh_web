import 'package:actiontrak_wh/application/models/picktickets/pick_tickets_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'pick_tickets_state.freezed.dart';

@freezed
class PickTicketsState with _$PickTicketsState {
  factory PickTicketsState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String? errorMessage,
    @Default('') String? statusCode,
    List<PickTicketsData>? pickTickets,
  }) = _PickTicketsState;
}
