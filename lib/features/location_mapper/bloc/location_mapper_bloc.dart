import 'dart:convert';

import 'package:actiontrak_wh/application/models/location_mapper/child_location_response.dart';
import 'package:actiontrak_wh/application/models/location_mapper/container_data.dart';
import 'package:actiontrak_wh/application/models/location_mapper/parent_location_response.dart';
import 'package:actiontrak_wh/application/services/api/url_string.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'location_mapper_state.dart';

class LocationMapperBloc extends Cubit<LocationMapperState> {
  LocationMapperBloc() : super(LocationMapperState());

  Future<void> getContainers({String? parentId, String? status, ContainerData? containerData}) async {
    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));

    try {
      String? token = await getString('token');
      List<ContainerData>? children = [];
      List<ContainerData>? parent = [];

      if (status == 'children') {
        final response = await DioMethod.methodData(
          type: DioType.post,
          isAuth: false,
          path: CustomApi.getContainerChildren(token: token, data: '|keys:id=$parentId'),
        );

        ///Get location children
        if (response.statusCode == 200) {
          ChildLocationResponse locationResponse = ChildLocationResponse.fromJson(jsonDecode(response.data));
          children = locationResponse.container;
        } else {
          children = [];
        }
        emit(state.copyWith(
          isLoading: false,
          parentContainerData: [],
          containerData: children ?? [],
        ));
      } else {
        final response = await DioMethod.methodData(
          type: DioType.post,
          isAuth: false,
          path: CustomApi.getContainer(token: token, data: '|keys:id=$parentId'),
        );

        ///Get location parent
        if (response.statusCode == 200) {
          ParentLocationResponse locationResponse = ParentLocationResponse.fromJson(jsonDecode(response.data));
          parent = locationResponse.container;

          emit(state.copyWith(
            isLoading: false,
            parentContainerData: parent ?? [],
            containerData: [],
          ));
        } else {
          parent = [];
        }
      }
    } on DioException catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true, errorMessage: 'error'));
    }
  }

  Future<void> createContainer({String? id, String? name, String? code, String? serialNo}) async {
    try {
      emit(state.copyWith(isLoading: true,));
      String? token = await getString('token');

      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.createContainer(token: token, data: '|vals:parentId=$id^name=$name^code=$code^num=$num'),
      );

      ///Get location children
      if (response.statusCode == 200) {
        getContainers(parentId: id, status: 'children');
        emit(state.copyWith(
          isLoading: false,
          hasError: false,
        ));
      } else {
        emit(state.copyWith(isLoading: false, hasError: true, errorMessage: 'error'));
      }
    } on DioException catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true, errorMessage: 'error'));
    }
  }
}
