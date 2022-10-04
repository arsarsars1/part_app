part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class LoginInitial extends AuthState {}

class SendingOtp extends AuthState {}

class OTPSent extends AuthState {
  final bool resend;
  final bool login;

  OTPSent(this.resend, {required this.login});
}

class SendingOtpFailed extends AuthState {
  final bool login;
  final String message;

  SendingOtpFailed(this.message, this.login);
}

class LoginSuccess extends AuthState {}

class LoginFailed extends AuthState {}

class RegisterOTPValidated extends AuthState {}

class RegisterOTPFailed extends AuthState {}
