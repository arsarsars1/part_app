import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/otp.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/authentication/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final AuthService _authService = AuthService();

  String? _phoneNo;
  String? _countryCode;
  User? _user;

  String get phoneNumber => '+$_countryCode $_phoneNo';

  /// METHOD TO GENERATE THE OTP FOR LOGIN
  ///
  /// params [ countryCode ] & [ phoneNo ] are nullable fields
  /// method will call the API only if the [ countryCode ] & [ phoneNo ] are valid
  /// else it will notify the UI about the validation
  Future getLoginOTP(
      {String? countryCode, String? phoneNo, bool resend = false}) async {
    if (!resend) {
      _phoneNo = phoneNo;
      _countryCode = countryCode;
    }
    // calls the api
    if (_phoneNo != null && _countryCode != null) {
      emit(SendingOtp());
      Otp? response = await _authService.loginOtp(
        countryCode: _countryCode!,
        phoneNo: _phoneNo!,
      );

      if (response != null && response.status == null) {
        emit(SendingOtpFailed(response.message));
      } else {
        emit(OTPSent(resend));
      }
    }
  }

  Future login({String? password}) async {
    if (password != null) {
      UserResponse userResponse = await _authService.login(
        phoneNo: _phoneNo!,
        countryCode: _countryCode!,
        password: password,
      );

      if (userResponse.status == 1) {
        _user = userResponse.user;
        emit(LoginSuccess());
      } else {
        emit(LoginFailed());
      }
    }
  }
}
