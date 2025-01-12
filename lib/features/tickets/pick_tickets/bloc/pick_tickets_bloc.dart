import 'dart:convert';

import 'package:actiontrak_wh/application/models/picktickets/pick_ticket_response.dart';
import 'package:actiontrak_wh/application/models/picktickets/pick_tickets_data.dart';
import 'package:actiontrak_wh/application/providers/error_bloc.dart';
import 'package:actiontrak_wh/application/services/api/url_string.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/features/tickets/pick_tickets/bloc/pick_tickets_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickTicketsBloc extends Cubit<PickTicketsState> {
  PickTicketsBloc() : super(PickTicketsState());


  void getPickTickets() async {
    emit(state.copyWith(isLoading: true, hasError: false));

    String? token = await getString('token');

    try {
      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getPickTickets(token: token, data: '|keys:ALL|cols:id,num,status,countTicketType as type,isOpen'),
        data: {
          'keys' : 'ALL',
          'cols' : 'id,num,status,countTicketType as type,isOpen',
        }
      );

      if (response.statusCode == 200) {
        PickTicketResponse pickTicketResponse = PickTicketResponse.fromJson(jsonDecode(response.data));

        emit(state.copyWith(isLoading: false, hasError: false, pickTickets: pickTicketResponse.pickTickets ?? []));
      } else {
        emit(state.copyWith(isLoading: false, hasError: true, errorMessage: 'Something went wrong.\nStatus <${response.statusCode}>', statusCode: response.statusCode.toString(), pickTickets: []));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false,  hasError: true, errorMessage: 'Something went wrong.', statusCode: '500', pickTickets: []));
    }
  }

  void searchPickTicket({String? value}) async {
    emit(state.copyWith(isLoading: true));

    String? token = await getString('token');

    final response = await DioMethod.methodData(
      type: DioType.post,
      isAuth: false,
      path: CustomApi.getPickTickets(token: token, data: '|keys:ALL|cols:id,num,status,countTicketType as type,isOpen'),
    );

    final PickTicketResponse pickTicketResponse = PickTicketResponse.fromJson(jsonDecode(response.data));

    String searchText = value?.toLowerCase() ?? '';
    List<PickTicketsData> values = pickTicketResponse.pickTickets?.where((PickTicketsData item) {
          String ticketId = item.num?.toLowerCase() ?? '';
          String status = item.status?.toLowerCase() ?? '';
          String location = item.destination?.toLowerCase() ?? '';
          return ticketId.contains(searchText) || status.contains((searchText)) || location.contains(searchText);
        }).toList() ??
        <PickTicketsData>[];

    emit(state.copyWith(isLoading: false, pickTickets: value?.isNotEmpty == true ? values : pickTicketResponse.pickTickets));
  }
}
