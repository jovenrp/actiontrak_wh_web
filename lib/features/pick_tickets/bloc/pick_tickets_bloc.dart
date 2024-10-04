import 'dart:convert';

import 'package:actiontrak_wh/application/models/picktickets/pick_ticket_response.dart';
import 'package:actiontrak_wh/application/models/picktickets/pick_tickets_data.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/features/pick_tickets/bloc/pick_tickets_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/api/url_string.dart';
import '../../../application/services/dio/dio_methods.dart';

class PickTicketsBloc extends Cubit<PickTicketsState> {
  PickTicketsBloc() : super(PickTicketsState());

  void getPickTickets() async {
    emit(state.copyWith(isLoading: true));

    String? token = await getString('token');

    try {
      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getPickTickets(token: token, data: '|keys:ALL|cols:id,num,status,countTicketType as type,isOpen'),
      );

      if (response.statusCode == 200) {
        PickTicketResponse pickTicketResponse = PickTicketResponse.fromJson(jsonDecode(response.data));

        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(isLoading: false, pickTickets: pickTicketResponse.pickTickets ?? []));
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(isLoading: false, pickTickets: []));
        });
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false, pickTickets: []));
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

    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(isLoading: false, pickTickets: value?.isNotEmpty == true ? values : pickTicketResponse.pickTickets));
    });
  }
}
