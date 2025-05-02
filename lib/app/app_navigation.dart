// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'presentation/code_authentication/view/view.dart';
import 'presentation/home/view/view.dart';
import 'presentation/qr_scanned_details/view/view.dart';
import 'presentation/splash/view/view.dart';

abstract class Routes {
  static const HOME = '/home';
  static const CODE_AUTHENTICATION = '/code-authentication';
  static const QR_SCANNED_DETAILS = '/qr-scanned-details';
  static const SPLASH = '/';
}

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = <String, WidgetBuilder>{
    Routes.HOME: (context) => HomePage(),
    Routes.CODE_AUTHENTICATION: (context) => CodeAuthenticationPage(),
    Routes.QR_SCANNED_DETAILS: (context) => QrScannedDetailsPage(),
    Routes.SPLASH: (context) => SplashPage(),
  };
}
