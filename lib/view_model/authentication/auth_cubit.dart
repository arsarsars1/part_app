import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/otp.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/authentication/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());

  final AuthService _authService = AuthService();

  String? _phoneNo;
  String? _countryCode;
  User? _user;

  String get phoneNumber => '+$_countryCode $_phoneNo';

  /// METHOD TO GENERATE THE OTP FOR LOGIN
  ///
  /// [login] is a required field and it determines the API path to call
  /// params [countryCode] & [phoneNo] are nullable fields
  /// method will call the API only if the [countryCode] &  phoneNo] are valid
  /// else it will notify the UI about the validation

  Future generateOTP({
    String? countryCode,
    String? phoneNo,
    bool resend = false,
    required bool login,
  }) async {
    if (!resend) {
      _phoneNo = phoneNo;
      _countryCode = countryCode;
    }
    // calls the api
    if (_phoneNo != null && _countryCode != null) {
      emit(SendingOtp());
      Otp? response = await _authService.generateOTP(
        countryCode: _countryCode!,
        phoneNo: _phoneNo!,
        login: login,
      );

      if (response != null && response.message != 'OTP sent') {
        emit(SendingOtpFailed(response.message, login));
      } else {
        emit(OTPSent(resend, login: login));
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

  Future validateRegisterOTP({String? otp}) async {
    if (otp != null) {
      Otp otpResponse = await _authService.validateOTP(
        phoneNo: _phoneNo!,
        countryCode: _countryCode!,
        otp: otp,
      );

      if (otpResponse.status == 1) {
        emit(RegisterOTPValidated());
      } else {
        emit(RegisterOTPFailed());
      }
    }
  }
}
