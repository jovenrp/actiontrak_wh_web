import 'package:freezed_annotation/freezed_annotation.dart';


part 'dashboard_state.freezed.dart';
part 'dashboard_state.g.dart';

@freezed
class NavigationState with _$NavigationState {
  factory NavigationState({
    @Default(false) bool isLoading,
  }) = _NavigationState;
  factory NavigationState.fromJson(Map<String, Object?> json) =>
      _$NavigationStateFromJson(json);
}
