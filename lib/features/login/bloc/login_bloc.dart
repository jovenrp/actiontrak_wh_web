

import 'package:actiontrak_wh/application/services/api/url_string.dart';
import 'package:actiontrak_wh/application/services/dio/dio_methods.dart';
import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/features/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginState());


  void login(String username, String password) async {
    emit(state.copyWith(isLoading: true, loginStatus: false, loginMessage: ''));

    try {
      final response = await DioMethod.methodData(
        type: DioType.post,
        isAuth: false,
        path: CustomApi.login(uid: username, pwd: password),
      );

      print('---> ${CustomApi.login(uid: username, pwd: password)}');
      Future.delayed(const Duration(seconds: 1), () {
        if (response.statusCode == 200) {
          saveString('token', response.toString());
          saveString('user', username);
          saveInt('loginTime', DateTime.now().millisecondsSinceEpoch);
          emit(state.copyWith(isLoading: false, loginStatus: true, loginMessage: '${response.data}'));
        } else {
          emit(state.copyWith(isLoading: false, loginStatus: false, loginMessage: response.data.toString()));
        }
      });
    } catch (err) {
      print('--> '+err.toString());
      emit(state.copyWith(isLoading: false, loginStatus: false, loginMessage: 'Something went wrong.'));
    }
  }
}
