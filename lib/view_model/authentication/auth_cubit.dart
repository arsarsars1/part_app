import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/enums.dart';
import 'package:part_app/model/data_model/otp.dart';
import 'package:part_app/model/data_model/register_request.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/api.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());

  final AuthService _authService = AuthService();

  String? _phoneNo;
  String? _countryCode;
  User? _user;
  String? _token;

  String get phoneNumber => '+$_countryCode $_phoneNo';

  RegisterRequest _registerRequest = const RegisterRequest();

  String? get token => _token;

  User? get user => _user;

  AccountType? _accountType;

  AccountType? get accountType => _accountType;

  set accountType(AccountType? type) => _accountType;

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
      _registerRequest = _registerRequest.copyWith(
        countryCode: _countryCode,
        mobileNo: _phoneNo,
      );

      if (login) {
        emit(SendingOtp());
      } else {
        emit(SendingRegisterOtp(resend));
      }
      Otp? response = await _authService.generateOTP(
        countryCode: _countryCode!,
        phoneNo: _phoneNo!,
        login: login,
      );

      if (response != null && response.status != 1) {
        emit(SendingOtpFailed(response.message, login));
      } else if (response == null) {
        emit(NetworkError());
      } else {
        emit(OTPSent(resend, login: login));
      }
    }
  }

  Future login({String? password}) async {
    if (password != null) {
      emit(Authenticating());
      UserResponse userResponse = await _authService
          .login(
        phoneNo: _phoneNo!,
        countryCode: _countryCode!,
        password: password,
      )
          .onError((error, stackTrace) {
        emit(LoginFailed('Login failed, Please try again'));
      });

      if (userResponse.status == 1) {
        _user = userResponse.user;
        _token = userResponse.token;
        await Database().setToken(userResponse);
        await Database().setUser(userResponse);

        emit(LoginSuccess(
            userResponse.user?.adminDetail?.academy?.membershipId != null));
      } else {
        emit(LoginFailed(
            userResponse.message ?? 'Login failed, Please try again'));
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
        emit(RegisterOTPFailed(message: otpResponse.message));
      }
    }
  }

  void updateWANumber(String? number) {
    _registerRequest =
        _registerRequest.copyWith(whatsappNo: number ?? _phoneNo);
  }

  void adminDetails(String? name, String? email, String? dob, String? gender) {
    _registerRequest = _registerRequest.copyWith(
      name: name,
      email: email,
      dob: dob,
      gender: gender,
      mobileNo: _phoneNo,
      countryCode: _countryCode,
      isTrainer: '0',
    );
  }

  void academyDetails(String? name, int? typeId) {
    _registerRequest = _registerRequest.copyWith(
      academyName: name,
      academyTypeId: typeId,
    );
  }

  void branchDetails(
      {required String branchName,
      required String address,
      required String pinCode,
      required int countryId,
      required int districtId,
      required int stateId}) {
    _registerRequest = _registerRequest.copyWith(
      branchAddress: address,
      branchPincode: pinCode,
      branchName: branchName,
      countryId: countryId,
      stateId: stateId,
      districtId: districtId,
    );
    register();
  }

  Future register() async {
    emit(RegisteringUser());
    UserResponse? value = await _authService.register(
      registerRequest: _registerRequest,
    );
    if (value == null) {
      emit(NetworkError());
    } else if (value.status == 1) {
      _token = value.token;
      _user = value.user;
      Hive.box(Database.userBox).put(Database.token, value.token);
      Hive.box(Database.userBox).put(Database.userData, jsonEncode(value));
      emit(RegisterSuccess());
    } else {
      emit(RegisterFailed(value.message ?? ' Failed to register the user'));
    }
  }

  /// method to initialize the [ 401 ] listener to handle
  /// alert
  Future init401Listener() async {
    ApiClient().controller?.stream.listen((event) {
      if (event == 401) {
        emit(UnAuthenticated());
      } else if (event == 600) {
        emit(NetworkError());
      }
    });
  }

  Future validateLocalUser() async {
    String? userToken = Database().getToken();

    if (userToken != null) {
      _token = userToken;

      var user = await getUser();

      if (user != null) {
        emit(
          UserAvailable(
            member: _user?.adminDetail?.academy?.membershipId != null,
          ),
        );
      } else {
        emit(UserNotAvailable());
      }
    } else {
      emit(UserNotAvailable());
    }
  }

  Future<User?> getUser() async {
    // gets the latest profile data from api
    UserResponse? response = await _authService.getProfile();
    if (response != null) {
      // save the user data to local
      await Database().setUser(response);

      _user = response.user;
    }

    return response?.user;
  }

  Future logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      // TODO should we force logout the user ???
    }
    await Database().clearForLogout();
    emit(UserNotAvailable());
  }
}
