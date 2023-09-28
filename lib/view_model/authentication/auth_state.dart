// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class LoginInitial extends AuthState {}

class SendingOtp extends AuthState {}

class SendingRegisterOtp extends AuthState {
  final bool resend;

  SendingRegisterOtp(this.resend);
}

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

class Authenticating extends AuthState {}

class LoginSuccess extends AuthState {
  final bool user;

  LoginSuccess(this.user);
}

class LoginFailed extends AuthState {
  final String message;

  LoginFailed(this.message);
}

class UserAvailable extends AuthState {
  final bool member;

  UserAvailable({required this.member});
}

class UserNotAvailable extends AuthState {}

class RegisterOTPValidated extends AuthState {}

class RegisterOTPFailed extends AuthState {
  final String message;

  RegisterOTPFailed({required this.message});
}

class RegisterSuccess extends AuthState {}

class RegisteringUser extends AuthState {}

class RegisterFailed extends AuthState {
  final String message;

  RegisterFailed(this.message);
}

class UpdateUserSuccess extends AuthState {
  final User user;
  UpdateUserSuccess({
   required this.user,
  });
  
}

class UpdatingUser extends AuthState {}

class UpdateUserFailed extends AuthState {
  final String message;
  UpdateUserFailed(this.message);
}

class ErrorFields extends AuthState {
  final String message;

  ErrorFields(this.message);
}

class UnAuthenticated extends AuthState {}

class NetworkError extends AuthState {}
