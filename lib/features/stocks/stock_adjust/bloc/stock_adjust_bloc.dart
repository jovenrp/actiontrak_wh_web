import 'dart:convert';

import 'package:actiontrak_wh/application/models/stock_adjust/stock_adjust_data.dart';
import 'package:actiontrak_wh/application/models/stock_adjust/stock_adjust_response.dart';
import 'package:actiontrak_wh/application/models/stock_adjust/stock_item_data.dart';
import 'package:actiontrak_wh/application/services/api/url_string.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/features/stocks/stock_adjust/bloc/stock_adjust_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StockAdjustBloc extends Cubit<StockAdjustState> {
  StockAdjustBloc() : super(StockAdjustState());


  Future<void> init() async {
    emit(state.copyWith(
        isLoading: false,
        isStockLoading: false,
        isAdjustLoading: false,
        hasError: false,
        stockAdjustData: <StockAdjustData>[],
        stockItems: <StockItemData>[]));
  }

  Future<void> stockAdjust(
      {String? containerId,
        String? qty,
        String? sku,
        required bool absolute}) async {
    emit(state.copyWith(isAdjustLoading: true));

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getStockAdjust(token: token, data: '|keys:containerId=$containerId^sku=$sku|vals:qty=$qty'),
      );

      if (response.statusCode == 200) {
        StockAdjustResponse stockAdjustResponse = StockAdjustResponse.fromJson(jsonDecode(response.data));

        emit(state.copyWith(isLoading: false, stockAdjustData: stockAdjustResponse.stockAdjust ?? [],));
      } else {
        emit(state.copyWith(isLoading: false,  hasError: true, stockAdjustData: [], ));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false, hasError: true,  stockAdjustData: [],));
    }

  }

  Future<void> stockLookUp({String? sku, String? locNum}) async {
    emit(state.copyWith(isLoading: true));

    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.stockLookup(token: token, data: '|keys:sku=$sku^locNum=$locNum'),
      );

      if (response.statusCode == 200) {
        StockAdjustResponse stockAdjustResponse = StockAdjustResponse.fromJson(jsonDecode(response.data));

        emit(state.copyWith(isLoading: false, stockItems: stockAdjustResponse.stockItems ?? []));
      } else {
        emit(state.copyWith(isLoading: false, stockItems: [],  hasError: true, errorMessage: 'Something went wrong.\nStatus <${response.statusCode}>', statusCode: response.statusCode.toString(), ));
      }
    } catch (err) {
      emit(state.copyWith(isLoading: false,  hasError: true, stockItems: [], errorMessage: 'Something went wrong.', statusCode: '500'));
    }
  }
}
