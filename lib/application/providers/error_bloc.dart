import 'package:actiontrak_wh/application/providers/error_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorBloc extends Cubit<ErrorState> {
  ErrorBloc() : super(ErrorState());

  void showError({String? errorMessage, String? errorStatus}) async {
    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: '', errorStatus: ''));
    Future.delayed(Duration.zero, () {
      emit(state.copyWith(isLoading: false, hasError: true, errorMessage: errorMessage ?? '', errorStatus: errorStatus ?? ''));
    });
  }

  void clearError() {
    //emit(null);
  }
}
