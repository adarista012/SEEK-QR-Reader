import 'package:seek_qr_scanner/app/domain/entities/qr.dart';

abstract class QrRepository {
  Future<List<Qr>> getScannedQrs();
  void addScannedQr(Qr qr);
}
