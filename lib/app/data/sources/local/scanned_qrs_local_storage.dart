import 'package:seek_qr_scanner/app/domain/entities/qr.dart';

class ScannedQrsLocalStorage {
  List<Qr> list = [];

  void addScannedQr(Qr qr) {
    list.add(qr);
  }
}
