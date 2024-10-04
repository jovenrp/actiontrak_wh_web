
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState());

  void loadSplashScreen() async {
    emit(state.copyWith(isLoading: true));

    String? token = await getString('token');
    String? user = await getString('user');

    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(isLoading: false, isLoggedIn: token == null ? false : true, user: user));
    });

  }
}
