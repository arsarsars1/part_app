import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:part_app/core/service/local_notification.dart';
import 'package:part_app/firebase_options.dart';
import 'package:part_app/model/data_model/otp.dart';
import 'package:part_app/model/data_model/register_request.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/api_client.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/notification/cubit/notification_cubit.dart';

import '../../data_model/notification_list.dart';

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

      // if (F.defaultOTP) {
      //   data.putIfAbsent('bypass_otp', () => '123456');
      // }
      var response = await _apiClient.post(
        postPath: login ? '/login-otp' : '/register-otp',
        data: data,
      );
      return otpFromJson(json.encode(response));
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  Future<Otp?> generateOTPForDeleteAccount() async {
    try {
      var response = await _apiClient.get(
        queryPath: '/delete-otp',
      );
      return otpFromJson(json.encode(response));
    } on DioException catch (e) {
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
        await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        await FirebaseMessaging.instance
            .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
        await FirebaseMessaging.instance.deleteToken();
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

  Future deleteAccount({
    required String otp,
  }) async {
    try {
      var data = {
        'otp': otp,
      };

      var response = await _apiClient.post(
        postPath: '/delete',
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
    String? fcmToken;
    try {
      fcmToken = await FirebaseMessaging.instance.getToken();
    } on Exception {
      fcmToken = 'cannot generate fcm token';
    }
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

  Future<UserResponse?> updateProfile(Map<String, dynamic> request) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _apiClient.post(
        postPath: '/admin/update-profile',
        data: request,
        formData: true,
      );

      return userResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<UserResponse?> updateStudentProfile(
      Map<String, dynamic> request, int studentId) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _apiClient.post(
        postPath: '/students/$studentId/update-profile',
        data: request,
        formData: true,
      );

      return userResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<UserResponse?> updateTrainerProfile(
      Map<String, dynamic> request, int trainerId) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _apiClient.post(
        postPath: '/trainers/$trainerId/update-profile',
        data: request,
        formData: true,
      );

      return userResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<UserResponse?> updateManagerProfile(
      Map<String, dynamic> request, int managerId) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _apiClient.post(
        postPath: '/managers/$managerId/update-profile',
        data: request,
        formData: true,
      );

      return userResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<UserResponse?> updateTrainerManager(
      Map<String, dynamic> request, int managerId) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _apiClient.post(
        postPath: '/managers/$managerId/update-profile',
        data: request,
        formData: true,
      );

      return userResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<void> addFirebaseListener(BuildContext context) async {
    try {
      await FirebaseMessaging.instance.getToken();
    } on Exception {
      debugPrint('cannot generate fcm token');
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.data['notifiable_type'] == 'App\\Models\\AdminDetail') {
        context.read<NotificationCubit>().emitNotificationNew();
        if (context.read<MembershipCubit>().receiveNotification == true) {
          NotificationList? list =
              await context.read<HomeCubit>().getNotificationList(clean: true);

          if (context.mounted) {
            context.read<NotificationCubit>().notificationList = list;
          }
        }
      } else if (message.data['notifiable_type'] ==
          'App\\Models\\StudentDetail') {
        context.read<NotificationCubit>().emitNotificationNew();
        if (context.read<MembershipCubit>().receiveNotification == true) {
          NotificationList? list = await context
              .read<HomeCubit>()
              .getStudentAppNotificationList(
                  studentId: context
                      .read<AuthCubit>()
                      .user
                      ?.studentDetail?[context.read<AuthCubit>().studentIndex]
                      .id,
                  clean: true);

          if (context.mounted) {
            context.read<NotificationCubit>().notificationList = list;
          }
        }
      }
      if (message.notification!.android?.channelId != null) {
        LocalNotificationService.display(message);
      }
    });
  }
}

Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
