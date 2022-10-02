import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/service/authentication/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final AuthService _authService = AuthService();

  /// METHOD TO GENERATE THE OTP FOR LOGIN
  ///
  /// params [ countryCode ] & [ phoneNo ] are nullable fields
  /// method will call the API only if the [ countryCode ] & [ phoneNo ] are valid
  /// else it will notify the UI about the validation
  Future getLoginOTP({String? countryCode, String? phoneNo}) async {
    // calls the api
    if (countryCode != null && phoneNo != null) {
      _authService.loginOtp(countryCode: countryCode, phoneNo: phoneNo);
    }
  }
}
