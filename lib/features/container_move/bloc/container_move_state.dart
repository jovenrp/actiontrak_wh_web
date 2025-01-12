import 'package:actiontrak_wh/application/models/location_mapper/container_data.dart';
import 'package:actiontrak_wh/application/models/location_mapper/parent_location_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'container_move_state.freezed.dart';

@freezed
class ContainerMoveState with _$ContainerMoveState {
  factory ContainerMoveState(
      {@Default(false) bool isLoading,
      @Default(false) bool isLoadingDestination,
      @Default(false) bool isMovingSuccess,
      @Default(false) bool isInit,
      @Default(false) bool isDestInit,
      @Default(false) bool hasError,
      @Default('') String? errorMessage,
      @Default('') String? statusCode,
      ParentLocationResponse? response,
      @Default([]) List<ContainerData>? containers,
      @Default([]) List<ContainerData>? containersDestination,
      ContainerData? container,
      String? token}) = _ContainerMoveState;
}
