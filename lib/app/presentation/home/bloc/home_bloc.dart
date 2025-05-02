import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seek_qr_reader/app/domain/entities/qr.dart';
import 'package:seek_qr_reader/app/domain/usecases/add_scanned_qr_usecase.dart';
import 'package:seek_qr_reader/app/domain/usecases/get_scanned_qrs_usecase.dart';
import 'package:seek_qr_reader/app/presentation/home/bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetScannedQrsUsecase getScannedQrsUseCase;
  final AddScannedQrUsecase addScannedQrUseCase;

  HomeBloc(this.getScannedQrsUseCase, this.addScannedQrUseCase)
    : super(ScannedQrsInitial()) {
    on<GetScannedQrs>((event, emit) async {
      emit(ScannedQrsLoading());
      try {
        final List<Qr> scannedQrs = getScannedQrsUseCase();
        emit(ScannedQrsLoaded(scannedQrs));
      } catch (e) {
        emit(HomeError('Failed to get scanned Qrs.'));
      }
    });

    on<AddScannedQr>((event, emit) async {
      try {
        addScannedQrUseCase.call(event.qr);
        final List<Qr> scannedQrs = getScannedQrsUseCase();
        emit(ScannedQrsLoaded(scannedQrs));
      } catch (e) {
        emit(HomeError('Failed to get scanned Qrs.'));
      }
    });
  }
}
