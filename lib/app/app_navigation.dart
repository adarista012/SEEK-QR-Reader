// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'presentation/home/view/view.dart';
import 'presentation/splash/view/view.dart';

abstract class Routes {
  static const HOME = '/home';
  static const SPLASH = '/';
}

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = <String, WidgetBuilder>{
    Routes.HOME: (context) => HomePage(),
    Routes.SPLASH: (context) => SplashPage(),
  };
}
