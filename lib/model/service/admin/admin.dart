import 'package:part_app/model/service/api_client.dart';

class ProfileUpdate {
  final _apiClient = ApiClient();

  Future update({required Map<String, dynamic> request}) async {
    await _apiClient.post(
      postPath: '/admin/updateProfile',
      data: request,
      formData: true,
    );
  }
}
