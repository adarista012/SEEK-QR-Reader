import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_qr_reader/app/presentation/qr_scanned_details/qr_scanned_details.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScannedDetailsBloc
    extends Bloc<QrScannedDetailsEvent, QrScannedDetailsState> {
  QrScannedDetailsBloc() : super(QrScannedDetailsStateInitial()) {
    on<GoToUrl>((event, emit) async {
      final Uri uri = Uri.parse(event.url);

      await launchUrl(uri);

      emit(QrScannedDetailsStateInitial());
    });
  }
}
