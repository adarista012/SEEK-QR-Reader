import 'package:flutter/material.dart';
import 'package:seek_qr_reader/app/app_colors.dart';
import 'package:seek_qr_reader/app/app_navigation.dart';
import 'package:seek_qr_reader/app/presentation/home/view/widgets/card_qr_readed.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    void goToQrReader() async {
      await Navigator.pushNamed(context, Routes.QR_READER);
    }

    return Scaffold(
      appBar: AppBar(title: Text('SEEK QR'), forceMaterialTransparency: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              children: List<Widget>.generate(
                10,
                (i) => cardQrReaded('Sender $i', 'Sender $i', DateTime.now()),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToQrReader,
        backgroundColor: AppColors.inverse,
        child: Icon(Icons.qr_code_scanner_outlined),
      ),
    );
  }
}
