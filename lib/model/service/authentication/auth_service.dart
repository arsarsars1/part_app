import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:part_app/model/data_model/otp.dart';
import 'package:part_app/model/data_model/register_request.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/api_client.dart';

class AuthService {
  final _apiClient = ApiClient();

  /// Method to ge the OTP for login
  /// required params [ countryCode ] & [ phoneNo ]
  Future<Otp?> generateOTP(
      {required String countryCode,
      required String phoneNo,
      required bool login}) async {
    try {
      var response = await _apiClient.post(
        postPath: login ? '/login-otp' : '/register-otp',
        data: {
          'country_code': countryCode,
          'mobile_no': phoneNo,
        },
      );
      return otpFromJson(json.encode(response));
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future login({
    required String phoneNo,
    required String countryCode,
    required String password,
  }) async {
    try {
      var response = await _apiClient.post(
        postPath: '/login',
        data: {
          'country_code': countryCode,
          'mobile_no': phoneNo,
          'password': password,
        },
      );

      return userResponseFromJson(json.encode(response));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future validateOTP({
    required String phoneNo,
    required String countryCode,
    required String otp,
  }) async {
    try {
      var response = await _apiClient.post(
        postPath: '/register-otp-validate',
        data: {
          'country_code': countryCode,
          'mobile_no': phoneNo,
          'otp': otp,
        },
      );

      return otpFromJson(json.encode(response));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<UserResponse> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      var response = await _apiClient.post(
        postPath: '/register',
        data: registerRequest.toJson(),
      );

      return userResponseFromJson(json.encode(response));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
