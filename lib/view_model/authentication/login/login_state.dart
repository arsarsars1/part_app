part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class SendingOtp extends LoginState {}

class OTPSent extends LoginState {
  final bool resend;

  OTPSent(this.resend);
}

class SendingOtpFailed extends LoginState {
  final String message;

  SendingOtpFailed(this.message);
}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {}
