import 'package:actiontrak_wh/application/models/location_mapper/container_data.dart';
import 'package:actiontrak_wh/application/models/location_mapper/parent_location_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_mapper_state.freezed.dart';

@freezed
class LocationMapperState with _$LocationMapperState {
  factory LocationMapperState(
      {@Default(false) bool isLoading,
      @Default(false) bool hasError,
      @Default('') String? errorMessage,
      @Default('') String? statusCode,
      ParentLocationResponse? parentLocationResponse,
      List<ContainerData>? containerData,
      List<ContainerData>? parentContainerData,
      String? token}) = _LocationMapperState;
}
