import 'package:get_it/get_it.dart';
import 'package:seek_qr_reader/app/data/repositories_impl/qr_repository_impl.dart';
import 'package:seek_qr_reader/app/data/sources/local/scanned_qrs_local_storage.dart';
import 'package:seek_qr_reader/app/domain/repositories/qr_repository.dart';
import 'package:seek_qr_reader/app/domain/usecases/add_scanned_qr_usecase.dart';
import 'package:seek_qr_reader/app/domain/usecases/get_scanned_qrs_usecase.dart';

Future<void> injectDependencies() async {
  final getIt = GetIt.instance;

  getIt.registerSingleton(ScannedQrsLocalStorage());

  getIt.registerLazySingleton<QrRepository>(
    () => QrRepositoryImpl(localStorage: getIt<ScannedQrsLocalStorage>()),
  );

  getIt.registerLazySingleton<GetScannedQrsUsecase>(
    () => GetScannedQrsUsecase(getIt<QrRepository>()),
  );
  getIt.registerLazySingleton<AddScannedQrUsecase>(
    () => AddScannedQrUsecase(getIt<QrRepository>()),
  );
}
