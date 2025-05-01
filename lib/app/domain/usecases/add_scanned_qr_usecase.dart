import 'package:seek_qr_scanner/app/domain/entities/qr.dart';
import 'package:seek_qr_scanner/app/domain/repositories/qr_repository.dart';

class AddScannedQrUsecase {
  final QrRepository repository;

  AddScannedQrUsecase(this.repository);

  void call(Qr qr) async {
    return repository.addScannedQr(qr);
  }
}
