import 'package:freezed_annotation/freezed_annotation.dart';


part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoggedIn,
    @Default('') String? user,
  }) = _SplashState;
}
