import 'package:actiontrak_wh/application/models/location_mapper/container_data.dart';
import 'package:actiontrak_wh/application/models/location_mapper/parent_location_response.dart';
import 'package:actiontrak_wh/application/services/api/url_string.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stock_move_state.dart';

class StockMoveBloc extends Cubit<StockMoveState> {
  StockMoveBloc() : super(StockMoveState());

  Future<void> searchContainer({String? containerNum, bool? isDestination}) async {
    emit(state.copyWith(isLoading: true));
    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.getContainer(token: token),
      );

      if (response == 200) {
        ParentLocationResponse parentLocationResponse = ParentLocationResponse.fromJson(response.data);

        List<ContainerData> values = parentLocationResponse.container?.where((ContainerData item) {
          String num = item.num?.toLowerCase() ?? '';
          return num.contains(containerNum ?? '');
        }).toList() ?? [];

        if (isDestination == true) {
          emit(state.copyWith(
              isLoadingDestination: false,
              isLoading: false,
              hasError: false,
              containersDestination: values));
        } else {
          emit(state.copyWith(
              isLoading: false,
              isLoadingDestination: false,
              containersDestination: [],
              hasError: false,
              containers: values));
        }
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } catch (_) {
      emit(state.copyWith(isLoading: false, isLoadingDestination: false, hasError: true));
    }
  }

  Future<void> stockMove({String? containerIdFrom, String? qty, String? sku, String? containerIdTo}) async {
    emit(state.copyWith(isLoading: true, isMovingSuccess: false));
    try {
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.stockYield(token: token, data: '|keys:srcContainerId=$containerIdFrom^sku=$sku|vals:docType=XO^docNum=TEST101^destContainerId=$containerIdTo^qty=$qty'),
      );

      if (response.statusCode == 200) {
        emit(state.copyWith(isLoading: false, hasError: false, isMovingSuccess: true));
      } else {
        emit(state.copyWith(isLoading: false, hasError: true, isMovingSuccess: false));
      }
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
