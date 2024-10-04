import 'package:actiontrak_wh/features/login/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'login_state.freezed.dart';
part 'login_state.g.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool loginStatus,
    @Default('') String loginMessage,
    UserModel? user,
  }) = _LoginState;
  factory LoginState.fromJson(Map<String, Object?> json) =>
      _$LoginStateFromJson(json);
}
