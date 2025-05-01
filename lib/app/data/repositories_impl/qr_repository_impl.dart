import 'package:seek_qr_scanner/app/domain/entities/qr.dart';
import 'package:seek_qr_scanner/app/domain/repositories/qr_repository.dart';

class QrRepositoryImpl implements QrRepository {
  List<Qr> list = [
    Qr(data: 'message 1', date: DateTime.now()),
    Qr(data: 'http://someurl', date: DateTime.now()),
  ];
  @override
  Future<List<Qr>> getScannedQrs() async {
    return list;
  }

  @override
  void addScannedQr(Qr qr) {
    list.add(qr);
  }
}
