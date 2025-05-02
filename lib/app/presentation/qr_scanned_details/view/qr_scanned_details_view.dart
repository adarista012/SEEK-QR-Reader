import 'package:flutter/material.dart';
import 'package:seek_qr_reader/app/domain/entities/qr.dart';
import 'package:seek_qr_reader/app/presentation/qr_scanned_details/view/widgets/row_data_details.dart';

class QrScannedDetailsView extends StatelessWidget {
  const QrScannedDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Qr;
    return Scaffold(
      appBar: AppBar(title: Text('Qr Scanned details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            rowDataDetails(
              'Date of scan',
              args.date.toLocal().toString(),
              false,
              context,
            ),
            rowDataDetails('Url', args.data, true, context),
          ],
        ),
      ),
    );
  }
}
