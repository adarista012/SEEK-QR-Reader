import 'package:get_it/get_it.dart';
import 'package:seek_qr_scanner/app/data/repositories_impl/qr_repository_impl.dart';
import 'package:seek_qr_scanner/app/domain/repositories/qr_repository.dart';
import 'package:seek_qr_scanner/app/domain/usecases/add_scanned_qr_usecase.dart';
import 'package:seek_qr_scanner/app/domain/usecases/get_scanned_qrs_usecase.dart';

Future<void> injectDependencies() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<QrRepository>(() => QrRepositoryImpl());
  getIt.registerLazySingleton<GetScannedQrsUsecase>(
    () => GetScannedQrsUsecase(getIt<QrRepository>()),
  );
  getIt.registerLazySingleton<AddScannedQrUsecase>(
    () => AddScannedQrUsecase(getIt<QrRepository>()),
  );
}
