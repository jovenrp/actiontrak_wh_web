
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState());

  void loadSplashScreen() async {
    emit(state.copyWith(isLoading: true));

    String? token = await getString('token');
    String? user = await getString('user');
    int? loginTime = await getInt('loginTime');

    if (loginTime != null) {
      final int currentTime = DateTime.now().millisecondsSinceEpoch;
      final int timeDifference = currentTime - loginTime;

      // Convert milliseconds to hours
      final double hoursPassed = timeDifference / (1000 * 60 * 60);

      if (hoursPassed >= 8) {
        // 8 hours have passed, execute your method
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(isLoading: false, isLoggedIn: false, user: user));
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(isLoading: false, isLoggedIn: true, user: user));
        });
      }
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        emit(state.copyWith(isLoading: false, isLoggedIn: false, user: user));
      });
    }

  }
}
