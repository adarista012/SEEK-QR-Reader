import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

import 'bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LocalAuthentication auth = LocalAuthentication();

  SplashBloc() : super(SplashStateInit()) {
    on<SplashInitTimer>((event, emit) async {
      await Future.delayed(Duration(seconds: 1));
      emit(SplashStateTimeOut());
    });

    on<SplashBiometricAuthentication>((event, emit) async {
      await Future.delayed(Duration(seconds: 3));

      try {
        final isAuthenticated = await auth
            .authenticate(
              localizedReason: 'Scan your face to authenticate',
              options: const AuthenticationOptions(
                stickyAuth: true,
                biometricOnly: true,
              ),
            )
            .catchError((_) async {
              await auth.stopAuthentication();
              return false;
            });
        emit(
          SplashStateBiometricAuthentication(isAuthenticated: isAuthenticated),
        );
      } on PlatformException catch (e) {
        emit(SplashStateError(errorMessage: e.message ?? 'Unknown error.'));
      }
    });
  }
}
