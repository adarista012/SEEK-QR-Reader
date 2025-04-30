// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:seek_qr_reader/app/app_navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    void goToQrReader() async {
      print('object');
      // await Future.delayed(Duration(seconds: 1));
      print('object');
      await Navigator.pushNamed(context, Routes.QR_READER);
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: List<Widget>.generate(
              14,
              (i) => Card(child: ListTile(title: Text('Sender $i'))),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_scanner_outlined),
        onPressed: goToQrReader,
      ),
    );
  }
}
