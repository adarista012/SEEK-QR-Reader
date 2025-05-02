import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class CodeAuthenticationBloc
    extends Bloc<CodeAuthenticationEvent, CodeAuthenticationState> {
  CodeAuthenticationBloc() : super(CodeAuthenticationStateInitial()) {
    on<Login>((event, emit) async {
      emit(CodeAuthenticationStateLoading());
      await Future.delayed(Duration(seconds: 1));
      if (event.code == '0000') {
        emit(CodeAuthenticationStateLogin(isAuthenticated: true));
      } else {
        emit(CodeAuthenticationStateLogin(isAuthenticated: false));
      }
    });
  }
}
