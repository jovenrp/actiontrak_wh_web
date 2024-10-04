

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

      Future.delayed(const Duration(seconds: 1), () {
        if (response.statusCode == 200) {
          saveString('token', response.toString());
          saveString('user', username);
          emit(state.copyWith(isLoading: false, loginStatus: true, loginMessage: '${response.data}'));
        } else {
          emit(state.copyWith(isLoading: false, loginStatus: false, loginMessage: response.data.toString()));
        }
      });
    } catch (err) {
      emit(state.copyWith(isLoading: false, loginStatus: false, loginMessage: 'Something went wrong.'));
    }
    //
    /*List<UserHive> users = repository.getAllUsers();

    bool userExist = false;
    bool passwordMatch = false;
    UserData? userData;
    for (var item in users) {
      if (username == item.nickname) {
        userExist = true;
        if (password == item.password) {
          passwordMatch = true;
          userData = item.toUserData();
        }
      }
    }

    if (userExist) {
      if (passwordMatch) {
        emit(state.copyWith(loginStatus: true, loginMessage: '', user: userData));
      } else {
        emit(state.copyWith(loginStatus: false, loginMessage: 'Wrong password'));
      }
    } else {
      emit(state.copyWith(loginStatus: false, loginMessage: 'Username does not exist'));
    }*/
  }
}
