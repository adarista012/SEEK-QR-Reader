import 'package:seek_qr_scanner/app/domain/entities/qr.dart';

abstract class HomeState {}

class ScannedQrsInitial extends HomeState {}

class ScannedQrsLoading extends HomeState {}

class ScannedQrsLoaded extends HomeState {
  final List<Qr> scannedQrs;
  ScannedQrsLoaded(this.scannedQrs);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
