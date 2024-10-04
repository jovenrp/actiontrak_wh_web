import 'package:actiontrak_wh/application/utils/logic.dart';
import 'package:actiontrak_wh/features/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(ProfileState());

  Future<void> checkSettings() async {
    bool pickLimitSetting = await getBool('pickLimitSetting') ?? false;

    emit(state.copyWith(isLoading: false, pickLimitSetting: pickLimitSetting));
  }

  Future<void> togglePickLimitSetting(bool value) async {
    await saveBool('pickLimitSetting', value);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('token');
    prefs.remove('user');
  }
}
