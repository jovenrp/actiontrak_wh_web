
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_state.dart';


class NavigationBloc extends Cubit<NavigationState> {
  NavigationBloc() : super(NavigationState());

  final String userBox = 'user_box';

  Future<void> getCurrentUser() async {
    emit(state.copyWith(isLoading: true));
  }

}
