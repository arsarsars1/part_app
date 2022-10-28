import 'dart:convert';

import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/membership.dart';
import 'package:part_app/model/service/api_client.dart';

class MembershipService {
  final _apiClient = ApiClient();

  Future<List<Membership>> getMembershipTypes() async {
    try {
      var str = await _apiClient.get(queryPath: '/memberships');
      return membershipFromJson(jsonEncode(str));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<Common> getOTPForSales({
    required int? academyId,
    required int? membershipID,
    required String phoneNo,
  }) async {
    try {
      var data = {
        'academy_id': academyId?.toString(),
        'membership_id': membershipID?.toString(),
        'salesman_mobile_no': phoneNo,
      };

      if (F.defaultOTP) {
        data.putIfAbsent('bypass_otp', () => '123456');
      }
      var str = await _apiClient.post(
        postPath: '/offline-otp-generate',
        data: data,
      );
      return commonFromJson(jsonEncode(str));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<Common> addMembership({
    required int? academyId,
    required int? membershipID,
    required String paymentMethod,
    required String? salesManOtp,
  }) async {
    try {
      var data = {
        'academy_id': academyId?.toString(),
        'membership_id': membershipID?.toString(),
        'payment_method': paymentMethod,
        'salesman_otp': salesManOtp,
      };
      var str = await _apiClient.post(
        postPath: '/add-membership',
        data: data,
      );
      return commonFromJson(jsonEncode(str));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
