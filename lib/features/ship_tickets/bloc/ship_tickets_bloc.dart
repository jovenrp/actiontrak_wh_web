import 'dart:convert';

import 'package:actiontrak_wh/application/models/ship_tickets/ship_tickets_response.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/services/api/url_string.dart';
import 'ship_tickets_state.dart';

class ShipTicketsBloc extends Cubit<ShipTicketsState> {
  ShipTicketsBloc() : super(ShipTicketsState());

  Future<void> getShipTickets() async {
    emit(state.copyWith(isLoading: true)); //turn on loading indicator
    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getShipTickets(token: token),
      );

      if (response.statusCode == 200) {
        ShipTicketsResponse shipResponse = ShipTicketsResponse.fromJson(jsonDecode(response.data));

        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(isLoading: false, shipTickets: shipResponse.shipTickets ?? []));
        });
      } else {
        Future.delayed(const Duration(seconds: 2), () {
          emit(state.copyWith(isLoading: false, shipTickets: []));
        });
      }

    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true, shipTickets: []));
    }
  }

  Future<void> searchTicket({String? value}) async {
    emit(state.copyWith(isLoading: true));
    try {
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
