import 'package:part_app/model/service/api_client.dart';

class Branch {
  final _apiClient = ApiClient();

  Future create({
    required String stateId,
    required String districtId,
    required String location,
    required String address,
    required String pinCode,
  }) async {
    _apiClient.post(postPath: '/admin/branches', data: {
      'state_id': stateId,
      'district_id': districtId,
      'location': location,
      'address': address,
      'pincode': pinCode,
    });
  }
}
