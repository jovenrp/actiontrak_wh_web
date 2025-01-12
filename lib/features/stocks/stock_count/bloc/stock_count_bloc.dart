import 'dart:convert';

import 'package:actiontrak_wh/application/models/stock_count/stock_count_response.dart';
import 'package:actiontrak_wh/application/services/api/url_string.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/features/stocks/stock_count/bloc/stock_count_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockCountBloc extends Cubit<StockCountState> {
  StockCountBloc() : super(StockCountState());


  Future<void> getStockCount() async {
    emit(state.copyWith(isLoading: true)); //turn on loading indicator
    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getStockCount(token: token),
      );

      if (response.statusCode == 200) {
        StockCountReponse stockCountResponse = StockCountReponse.fromJson(jsonDecode(response.data));

        emit(state.copyWith(isLoading: false, stockCount: stockCountResponse.stockCount ?? []));
      } else {
        emit(state.copyWith(isLoading: false,  hasError: true, stockCount: [], errorMessage: 'Something went wrong.\nStatus <${response.statusCode}>', statusCode: response.statusCode.toString(), ));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false,  hasError: true, stockCount: [], errorMessage: 'Something went wrong.', statusCode: '500'));
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
