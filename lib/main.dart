import 'package:flutter/material.dart';
import 'package:seek_qr_scanner/app/app.dart';
import 'package:seek_qr_scanner/inject_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(App());
}
