abstract class QrScannedDetailsEvent {}

class GoToUrl extends QrScannedDetailsEvent {
  final String url;

  GoToUrl({required this.url});
}
