import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/service/api_client.dart';

class BranchService {
  final _apiClient = ApiClient();

  Future<Common?> create({
    required String stateId,
    required String branchName,
    required String countryId,
    required String districtId,
    required String location,
    required String address,
    required String pinCode,
  }) async {
    try {
      var response = await _apiClient.post(postPath: '/admin/branches', data: {
        'state_id': stateId,
        'branch_name': branchName,
        'country_id': countryId,
        'district_id': districtId,
        'location': location,
        'address': address,
        'pincode': pinCode,
      });
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Future<List<Branch>?> getBranches() async {
    try {
      var response = await _apiClient.get(queryPath: '/admin/branches');
      BranchResponse branchResponse =
          branchResponseFromJson(jsonEncode(response));
      if (branchResponse.status == 1 && branchResponse.branches != null) {
        var list = branchResponse.branches;
        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
