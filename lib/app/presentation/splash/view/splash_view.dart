// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_qr_scanner/app/app_colors.dart';
import 'package:seek_qr_scanner/app/app_navigation.dart';

import '../bloc/bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(SplashInitTimer());

    void goToHomePage() async {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacementNamed(context, Routes.HOME);
    }

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state.time == 0) {
              goToHomePage();
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
