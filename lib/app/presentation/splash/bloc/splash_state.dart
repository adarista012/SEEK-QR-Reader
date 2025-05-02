abstract class SplashState {}

class SplashStateInit extends SplashState {}

class SplashStateTimeOut extends SplashState {}

class SplashStateBiometricAuthentication extends SplashState {
  final bool isAuthenticated;

  SplashStateBiometricAuthentication({required this.isAuthenticated});
}

class SplashStateError extends SplashState {
  final String errorMessage;

  SplashStateError({required this.errorMessage});
}
