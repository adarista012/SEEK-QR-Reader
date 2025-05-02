abstract class CodeAuthenticationState {}

class CodeAuthenticationStateInitial extends CodeAuthenticationState {}

class CodeAuthenticationStateLoading extends CodeAuthenticationState {}

class CodeAuthenticationStateLogin extends CodeAuthenticationState {
  final bool isAuthenticated;

  CodeAuthenticationStateLogin({required this.isAuthenticated});
}
