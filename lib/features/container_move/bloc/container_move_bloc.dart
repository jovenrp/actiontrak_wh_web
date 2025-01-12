import 'package:actiontrak_wh/application/models/location_mapper/container_data.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'container_move_state.dart';

class ContainerMoveBloc extends Cubit<ContainerMoveState> {
  ContainerMoveBloc() : super(ContainerMoveState());


  Future<void> init() async {
    emit(state.copyWith(
        isLoading: false,
        isInit: true,
        isDestInit: true,
        isLoadingDestination: false,
        hasError: false,
        containersDestination: <ContainerData>[],
        containers: <ContainerData>[]));
  }

  Future<void> searchContainer(
      {String? containerNum, bool? isDestination}) async {
    emit(state.copyWith(isLoading: true)); //turn on loading indicator
    try {
      String? token = await getString('token');
      /*final List<ContainerModel>? response = await containerMoveRepository
          .searchContainer(token: token, containerNum: containerNum);

      List<ContainerModel> values = response?.where((ContainerModel item) {
        String num = item.num?.toLowerCase() ?? '';
        return num.contains(containerNum ?? '');
      }).toList() ??
          <ContainerModel>[];

      if (isDestination == true) {
        emit(state.copyWith(
            isLoadingDestination: false,
            isLoading: false,
            isDestInit: false,
            hasError: false,
            containersDestination: values));
      } else {
        emit(state.copyWith(
            isLoading: false,
            isLoadingDestination: false,
            containersDestination: <ContainerModel>[],
            isInit: false,
            hasError: false,
            containers: values));
      }*/
    } catch (_) {
      emit(state.copyWith(
          isLoading: false, isLoadingDestination: false, hasError: true));
    }
  }

  Future<void> moveContainer(
      {String? containerNum, String? destinationContainer}) async {
    emit(state.copyWith(isLoading: true)); //turn on loading indicator
    try {
      /*String? token = await persistenceService.dwnToken.get();
      await containerMoveRepository.moveContainer(
          token: token,
          containerId: containerNum,
          destContainerId: destinationContainer);
*/
      emit(state.copyWith(isLoading: false, isMovingSuccess: true));
    } catch (_) {
      emit(state.copyWith(
          isLoading: false, hasError: true, isMovingSuccess: false));
    }
  }
}
