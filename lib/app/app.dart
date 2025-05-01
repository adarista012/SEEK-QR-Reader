import 'package:flutter/material.dart';
import 'package:seek_qr_scanner/app/app_colors.dart';
import 'package:seek_qr_scanner/app/app_navigation.dart';

class App extends MaterialApp {
  App({super.key})
    : super(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        ),
        routes: AppPages.routes,
        initialRoute: Routes.SPLASH,
      );
}
