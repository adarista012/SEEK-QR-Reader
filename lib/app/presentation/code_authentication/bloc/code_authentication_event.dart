abstract class CodeAuthenticationEvent {}

class Login extends CodeAuthenticationEvent {
  final String code;

  Login({required this.code});
}
