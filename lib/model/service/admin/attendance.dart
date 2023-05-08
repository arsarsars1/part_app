import 'dart:convert';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/service/api_client.dart';

class AttendanceService {
  final _apiClient = ApiClient();

  Future<BatchResponse?> getBatches({required int branchId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/branches/$branchId/batches',
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  /// this method will handle four different apis based on
  /// [ branchId ] , [ status ] , [ search ]
  Future<BatchResponse?> getBatchesByStatus({
    int? branchId,
    // String status = 'ongoing',
    String? search,
    required int page,
    bool branchSearch = false,
  }) async {
    try {
      String path = branchId == null
          ? '/admin/batches'
          : '/admin/branches/$branchId/batches';

      if (branchSearch) {
        path = '/admin/branches/$branchId/batches';
      }

      /// append the search text if search query is not null
      if (search != null) {
        path += '/search/$search';
      }

      path += '?page=$page';

      var response = await _apiClient.get(
        queryPath: path,
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

}
