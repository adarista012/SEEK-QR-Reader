import 'package:seek_qr_scanner/app/data/sources/local/scanned_qrs_local_storage.dart';
import 'package:seek_qr_scanner/app/domain/entities/qr.dart';
import 'package:seek_qr_scanner/app/domain/repositories/qr_repository.dart';

class QrRepositoryImpl implements QrRepository {
  final ScannedQrsLocalStorage localStorage;

  QrRepositoryImpl({required this.localStorage});

  @override
  List<Qr> getScannedQrs() => localStorage.list;

  @override
  void addScannedQr(Qr qr) => localStorage.addScannedQr(qr);
}
