import 'dart:convert';

import 'package:actiontrak_wh/application/models/receive_tickets/receive_ticket_details_response.dart';
import 'package:actiontrak_wh/application/models/receive_tickets/receive_ticket_response.dart';
import 'package:actiontrak_wh/application/models/receive_tickets/receive_tickets_data.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/features/receive_tickets/bloc/receive_tickets_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/api/url_string.dart';
import '../../../application/services/dio/dio_methods.dart';

class ReceiveTicketsBloc extends Cubit<ReceiveTicketsState> {
  ReceiveTicketsBloc() : super(ReceiveTicketsState());

  ///Bloc for ReceiveTicketScreen
  void getReceiveTickets() async {
    emit(state.copyWith(isLoading: true));

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getReceiveTickets(token: token),
      );

      ReceiveTicketResponse receiveTicketResponse;
      if (response.statusCode == 200) {
        receiveTicketResponse = ReceiveTicketResponse.fromJson(jsonDecode(response.data));

        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(isLoading: false, receiveTickets: receiveTicketResponse.receiveTickets ?? []));
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(isLoading: false, receiveTickets: []));
        });
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false, hasError: true, receiveTickets: []));
    }
  }

  void searchReceiveTicket({String? value}) async {
    emit(state.copyWith(isLoading: true));

    String? token = await getString('token');

    final response = await DioMethod.methodData(
      type: DioType.post,
      isAuth: false,
      path: CustomApi.getReceiveTickets(token: token),
    );

    final ReceiveTicketResponse receiveTicketResponse = ReceiveTicketResponse.fromJson(jsonDecode(response.data));

    String searchText = value?.toLowerCase() ?? '';
    List<ReceiveTicketsData> values = receiveTicketResponse.receiveTickets?.where((ReceiveTicketsData item) {
          String ticketId = item.num?.toLowerCase() ?? '';
          String status = item.status?.toLowerCase() ?? '';
          String poId = item.poId?.toLowerCase() ?? '';
          String vendorId = item.vendorId?.toLowerCase() ?? '';
          String vendorName = item.vendorName?.toLowerCase() ?? '';
          return ticketId.contains(searchText) || status.contains((searchText)) || poId.contains(searchText) || vendorId.contains(searchText) || vendorName.contains(searchText);
        }).toList() ??
        <ReceiveTicketsData>[];

    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(isLoading: false, receiveTickets: value?.isNotEmpty == true ? values : receiveTicketResponse.receiveTickets));
    });
  }

  ///Bloc for ReceiveTicketDetails Screen
  void getReceiveTicketsDetails({String? id}) async {
    emit(state.copyWith(isLoading: true));

    String? token = await getString('token');

    final response = await DioMethod.methodData(
      type: DioType.post,
      isAuth: false,
      path: CustomApi.getReceiveTicketDetails(token: token, data: '|keys:id=$id'),
    );

    ReceiveTicketDetailsResponse receiveTicketResponse;
    if (response.statusCode == 200) {
      receiveTicketResponse = ReceiveTicketDetailsResponse.fromJson(jsonDecode(response.data));

      Future.delayed(const Duration(seconds: 2), () {
        emit(state.copyWith(isLoading: false, receiveTicketDetails: receiveTicketResponse.receiveTicketDetails ?? []));
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        emit(state.copyWith(isLoading: false, receiveTicketDetails: []));
      });
    }
  }
}
