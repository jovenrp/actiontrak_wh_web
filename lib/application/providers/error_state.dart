
import 'package:freezed_annotation/freezed_annotation.dart';


part 'error_state.freezed.dart';
part 'error_state.g.dart';

@freezed
class ErrorState with _$ErrorState {
  factory ErrorState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default('') String errorStatus,
  }) = _ErrorState;
  factory ErrorState.fromJson(Map<String, Object?> json) =>
      _$ErrorStateFromJson(json);
}
