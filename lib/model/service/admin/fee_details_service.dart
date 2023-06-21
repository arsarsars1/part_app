import 'dart:convert';

import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/fee_response.dart';
import 'package:part_app/model/service/api_client.dart';

class FeeDetailsService {
  final _client = ApiClient();

  Future<FeeResponse?> feeDetails({
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    String? searchQuery,
    required int pageNo,
  }) async {
    try {
      // var response = await _client.get(queryPath: '/admin/students/$studentId');
      var response = await _client.get(
          queryPath:
              '/admin/fee-details/batch-fee-invoices?fee_type=$feeType&year=$year&month=$month&branch_id=$branchId&batch_id=$batchId');
      return feeResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> sendReminder({
    required int? batchFeeInvoiceId,
  }) async {
    try {
      var response = await _client.get(
          queryPath:
              '/admin/fee-details/batch-fee-invoices/$batchFeeInvoiceId/send-reminder');
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> writeOffFees(Map<String, dynamic> request,
      [int? batchFeesInvoiceId]) async {
    try {
      var response = await _client.post(
        postPath:
            '/admin/fee-details/batch-fee-invoices/$batchFeesInvoiceId/write-off',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
