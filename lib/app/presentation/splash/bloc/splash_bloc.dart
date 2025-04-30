import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  static const int _duration = 1;

  SplashBloc() : super(SplashState(_duration)) {
    on<SplashInitTimer>((event, emit) async {
      await Future.delayed(Duration(seconds: _duration));
      emit(SplashState(0));
    });
  }
}
