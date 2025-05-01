import 'package:seek_qr_scanner/app/domain/entities/qr.dart';

abstract class HomeEvent {}

class GetScannedQrs extends HomeEvent {}

class AddScannedQr extends HomeEvent {
  final Qr qr;

  AddScannedQr({required this.qr});
}
