import 'package:actiontrak_wh/application/models/location_mapper/container_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_move_state.freezed.dart';

@freezed
class StockMoveState with _$StockMoveState {
  factory StockMoveState(
      {@Default(false) bool isLoading,
      @Default(false) bool isLoadingDestination,
      @Default(false) bool isMovingSuccess,
      @Default(false) bool hasError,
      @Default('') String? errorMessage,
      @Default('') String? statusCode,
      List<ContainerData>? containersDestination,
      @Default([]) List<ContainerData>? containers,
      @Default(false) bool didFinish,
      String? token}) = _StockMoveState;
}
