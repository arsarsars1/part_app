import 'dart:convert';

import 'package:part_app/model/data_model/membership.dart';
import 'package:part_app/model/service/api_client.dart';

class MembershipService {
  final _apiClient = ApiClient();

  Future getMembershipTypes() async {
    try {
      var str = await _apiClient.get(queryPath: '/memberships');
      return membershipFromJson(jsonEncode(str));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
