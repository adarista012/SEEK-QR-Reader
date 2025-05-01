import 'package:seek_qr_scanner/app/domain/entities/qr.dart';
import 'package:seek_qr_scanner/app/domain/repositories/qr_repository.dart';

class GetScannedQrsUsecase {
  final QrRepository repository;

  GetScannedQrsUsecase(this.repository);

  Future<List<Qr>> call() async {
    return await repository.getScannedQrs();
  }
}
