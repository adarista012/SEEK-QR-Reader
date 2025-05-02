// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_qr_reader/app/app_colors.dart';
import 'package:seek_qr_reader/app/app_navigation.dart';

import '../bloc/bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final splashBloc = context.read<SplashBloc>();
    splashBloc.add(SplashInitTimer());

    void biometricAuthentication() async {
      splashBloc.add(SplashBiometricAuthentication());
    }

    router(bool isAuthenticated) async {
      await Future.delayed(Duration(seconds: 1));
      if (isAuthenticated) {
        await Navigator.pushReplacementNamed(context, Routes.HOME);
      } else {
        await Navigator.pushReplacementNamed(
          context,
          Routes.CODE_AUTHENTICATION,
        );
      }
    }

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashStateTimeOut) {
              biometricAuthentication();
            }

            if (state is SplashStateBiometricAuthentication) {
              router(state.isAuthenticated);
            }

            return Text(
              'SEEK',
              style: TextStyle(
                color: AppColors.inverse,
                fontSize: 40.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 3.2,
              ),
            );
          },
        ),
      ),
    );
  }
}
