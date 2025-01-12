import 'dart:convert';

import 'package:actiontrak_wh/application/models/receive_tickets/receive_ticket_detail_data.dart';
import 'package:actiontrak_wh/application/models/receive_tickets/receive_ticket_details_response.dart';
import 'package:actiontrak_wh/application/models/receive_tickets/receive_ticket_response.dart';
import 'package:actiontrak_wh/application/models/receive_tickets/receive_tickets_data.dart';
import 'package:actiontrak_wh/application/services/api/url_string.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/features/tickets/receive_tickets/bloc/receive_tickets_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceiveTicketsBloc extends Cubit<ReceiveTicketsState> {
  ReceiveTicketsBloc() : super(ReceiveTicketsState());

  ///Bloc for ReceiveTicketScreen
  void getReceiveTickets() async {
    emit(state.copyWith(isLoading: true, hasError: false, didFinish: false));

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

        emit(state.copyWith(isLoading: false, receiveTickets: receiveTicketResponse.receiveTickets ?? []));
      } else {
        emit(state
            .copyWith(isLoading: false, hasError: true, errorMessage: 'Something went wrong.\nStatus <${response.statusCode}>', statusCode: response.statusCode.toString(), receiveTickets: []));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false, hasError: true,  errorMessage: 'Something went wrong.', statusCode: '500', receiveTickets: []));
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

    emit(state.copyWith(isLoading: false, receiveTickets: value?.isNotEmpty == true ? values : receiveTicketResponse.receiveTickets));
  }

  ///Bloc for ReceiveTicketDetails Screen
  void searchReceiveTicketDetails({String? id, String? value}) async {
    emit(state.copyWith(isLoading: true));

    String? token = await getString('token');

    final response = await DioMethod.methodData(
      type: DioType.post,
      isAuth: false,
      path: CustomApi.getReceiveTicketDetails(token: token, data: '|keys:id=$id'),
    );

    final ReceiveTicketDetailsResponse receiveTicketResponse = ReceiveTicketDetailsResponse.fromJson(jsonDecode(response.data));

    String searchText = value?.toLowerCase() ?? '';
    List<ReceiveTicketDetailsData> values = receiveTicketResponse.receiveTicketDetails?.where((ReceiveTicketDetailsData item) {
      String itemId = item.itemId?.toLowerCase() ?? '';
      String status = item.status?.toLowerCase() ?? '';
      String uom = item.uom?.toLowerCase() ?? '';
      return itemId.contains(searchText) || status.contains((searchText)) || uom.contains(searchText);
    }).toList() ??
        <ReceiveTicketDetailsData>[];

    emit(state.copyWith(isLoading: false, receiveTicketDetails: value?.isNotEmpty == true ? values : receiveTicketResponse.receiveTicketDetails));
  }

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

      emit(state.copyWith(isLoading: false, receiveTicketDetails: receiveTicketResponse.receiveTicketDetails ?? []));
    } else {
      emit(state.copyWith(
        isLoading: false,
        receiveTicketDetails: [],
        hasError: true,
        errorMessage: 'Something went wrong.\nStatus <${response.statusCode}>',
        statusCode: response.statusCode.toString(),
      ));
    }
  }

  Future<void> submitReceiveDetail({String? id, String? containerId, String? qtyReceived}) async {
    emit(state.copyWith(hasError: false, didFinish: false));

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.submitReceiveDetail(token: token, data: '|keys:detailId=$id|vals:qtyReceived=$qtyReceived^containerId=$containerId'),
      );

      if (response.statusCode == 200) {
        emit(state.copyWith(didFinish: true, hasError: false));
        getReceiveTickets();
      } else {
        emit(state.copyWith(hasError: true, didFinish: false,));
      }
    } catch (err) {
      emit(state.copyWith(hasError: true, errorMessage: err.toString(), didFinish: false,));
    }
  }

  Future<void> completeReceiveTicket({String? id}) async {
    emit(state.copyWith(isLoading: true, hasError: false, didFinish: false));

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.completeReceiveTicket(token: token, data: '|keys:ticketId=$id'),
      );

      if (response.statusCode == 200) {
        emit(state.copyWith(isLoading: false, didFinish: true, hasError: false));
        getReceiveTickets();
      } else {
        emit(state.copyWith(isLoading: false, hasError: true, didFinish: false,));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false, hasError: true, errorMessage: err.toString(), didFinish: false,));
    }
  }


}
