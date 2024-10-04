import 'package:freezed_annotation/freezed_annotation.dart';


part 'dashboard_state.freezed.dart';
part 'dashboard_state.g.dart';

@freezed
class DashboardState with _$DashboardState {
  factory DashboardState({
    @Default(false) bool isLoading,
  }) = _DashboardState;
  factory DashboardState.fromJson(Map<String, Object?> json) =>
      _$DashboardStateFromJson(json);
}
