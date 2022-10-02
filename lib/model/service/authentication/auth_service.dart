import 'package:dio/dio.dart';
import 'package:part_app/model/service/api_client.dart';

class AuthService {
  final _apiClient = ApiClient();

  /// Method to ge the OTP for login
  /// required params [ countryCode] [ phoneNo ]
  Future loginOtp(
      {required String countryCode, required String phoneNo}) async {
    try {
      var response = await _apiClient.post(
        postPath: '/login-otp',
        data: {
          'country_code': countryCode,
          'mobile_no': phoneNo,
        },
      );
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
