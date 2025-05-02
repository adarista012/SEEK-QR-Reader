import 'package:flutter/material.dart';
import 'package:seek_qr_reader/app/app.dart';
import 'package:seek_qr_reader/inject_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(App());
}
