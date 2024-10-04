
import 'package:freezed_annotation/freezed_annotation.dart';


part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdated,
    @Default(false) bool pickLimitSetting,
  }) = _ProfileState;
  factory ProfileState.fromJson(Map<String, Object?> json) =>
      _$ProfileStateFromJson(json);
}
