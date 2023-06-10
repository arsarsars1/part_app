import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:part_app/flavors.dart';
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
      var data = {
        'country_code': countryCode,
        'mobile_no': phoneNo,
      };

      if (F.defaultOTP) {
        data.putIfAbsent('bypass_otp', () => '123456');
      }
      var response = await _apiClient.post(
        postPath: login ? '/login-otp' : '/register-otp',
        data: data,
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
      String? fcmToken;
      try {
        fcmToken = await FirebaseMessaging.instance.getToken();
      } on FirebaseException catch (e) {
        fcmToken = 'Failed to generate token';
        log("$e");
      }
      var data = {
        'country_code': countryCode,
        'mobile_no': phoneNo,
        'firebase_token': fcmToken,
        'password': password,
      };

      var response = await _apiClient.post(
        postPath: '/login',
        data: data,
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
      var data = {
        'country_code': countryCode,
        'mobile_no': phoneNo,
        'otp': otp,
      };

      var response = await _apiClient.post(
        postPath: '/register-otp-validate',
        data: data,
      );

      return otpFromJson(json.encode(response));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<UserResponse?> register({
    required RegisterRequest registerRequest,
  }) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    try {
      var response = await _apiClient.post(
        postPath: '/register',
        data: registerRequest.copyWith(firebaseToken: fcmToken).toJson(),
      );

      return userResponseFromJson(json.encode(response));
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> logout() async {
    try {
      var response = await _apiClient.post(postPath: '/logout', data: {});

      return json.encode(response);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<UserResponse?> getProfile() async {
    try {
      Map<String, dynamic> str = await _apiClient.get(
        queryPath: '/profile-list',
      );
      return userResponseFromJson(json.encode(str));
    } catch (e) {
      return null;
    }
  }
}
