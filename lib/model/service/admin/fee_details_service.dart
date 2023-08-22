import 'dart:convert';
import 'dart:developer';

import 'package:part_app/model/data_model/admission_fee_invoice.dart';
import 'package:part_app/model/data_model/batch_fee_invoice.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';
import 'package:part_app/model/data_model/fee_detail_history.dart';
import 'package:part_app/model/data_model/student_app_fee_detail_history.dart';
import 'package:part_app/model/service/api_client.dart';

class FeeDetailsService {
  final _client = ApiClient();

  Future<Common?> addFees(
      int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      var response = await _client.post(
        postPath:
            '/admin/fee-details/batch-fee-invoices/$batchInvoiceId/payments',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> addAdvanceFees(Map<String, dynamic> data) async {
    try {
      var response = await _client.post(
        postPath: '/admin/fee-details/batch-fee-invoices/advance-payment',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> addFeesForAdmission(
      int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      var response = await _client.post(
        postPath:
            '/admin/fee-details/admission-fee-invoices/$batchInvoiceId/payments',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchFeeInvoiceList?> feeDetails({
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    String? searchQuery,
    required int pageNo,
  }) async {
    try {
      var response = await _client.get(
          queryPath: month == null || year == null
              ? searchQuery == '' || searchQuery == null
                  ? '/admin/fee-details/batch-fee-invoices?fee_type=$feeType&branch_id=$branchId&batch_id=$batchId&page=$pageNo'
                  : '/admin/fee-details/batch-fee-invoices?fee_type=$feeType&branch_id=$branchId&batch_id=$batchId&search=$searchQuery&page=$pageNo'
              : searchQuery == '' || searchQuery == null
                  ? '/admin/fee-details/batch-fee-invoices?fee_type=$feeType&year=$year&month=$month&branch_id=$branchId&batch_id=$batchId&page=$pageNo'
                  : '/admin/fee-details/batch-fee-invoices?fee_type=$feeType&year=$year&month=$month&branch_id=$branchId&batch_id=$batchId&search=$searchQuery&page=$pageNo');
      return batchFeeInvoiceListFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<FeeDetailHistory?> studentFeeDetails({
    int? month,
    int? year,
    String? feeType,
    String? searchQuery,
    int? studentId,
    String? paymentStatus,
    required int pageNo,
  }) async {
    try {
      var response = await _client.get(
          queryPath: feeType == 'monthly'
              ? month != null
                  ? paymentStatus != 'all'
                      ? '/admin/students/$studentId/fee-details/$year/$month?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                      : '/admin/students/$studentId/fee-details/$year/$month?fee_type=$feeType&page=$pageNo'
                  : paymentStatus != 'all'
                      ? '/admin/students/$studentId/fee-details/$year?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                      : '/admin/students/$studentId/fee-details/$year?fee_type=$feeType&page=$pageNo'
              : paymentStatus != 'all'
                  ? '/admin/students/$studentId/fee-details?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                  : '/admin/students/$studentId/fee-details?fee_type=$feeType&page=$pageNo');
      return feeDetailHistoryFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentAppFeeDetailHistory?> studentAppFeeDetails({
    int? month,
    int? year,
    String? feeType,
    String? searchQuery,
    int? studentId,
    String? paymentStatus,
    required int pageNo,
  }) async {
    try {
      var response = await _client.get(
          queryPath: feeType == 'monthly'
              ? month != null
                  ? paymentStatus != 'all'
                      ? '/students/$studentId/fee-details/batch-fee-invoices?year=$year&month=$month?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                      : '/students/$studentId/fee-details/batch-fee-invoices?year=$year&month=$month?fee_type=$feeType&page=$pageNo'
                  : paymentStatus != 'all'
                      ? '/students/$studentId/fee-details/batch-fee-invoices?year=$year?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                      : '/students/$studentId/fee-details/batch-fee-invoices?year=$year?fee_type=$feeType&page=$pageNo'
              : paymentStatus != 'all'
                  ? '/students/$studentId/fee-details/batch-fee-invoices?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                  : '/students/$studentId/fee-details/batch-fee-invoices?fee_type=$feeType&page=$pageNo');
      return studentAppFeeDetailHistoryFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<FeeDetailHistory?> admissionFeeDetails({
    String? feeType,
    String? searchQuery,
    int? studentId,
    String? paymentStatus,
    required int pageNo,
  }) async {
    try {
      var response = await _client.get(
          queryPath: paymentStatus != 'all'
              ? '/admin/students/$studentId/admission-fee-details?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
              : '/admin/students/$studentId/admission-fee-details?fee_type=$feeType&page=$pageNo');
      return feeDetailHistoryFromJson(jsonEncode(response));
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

  Future<Common?> sendReminderForAdmission({
    required int? batchFeeInvoiceId,
  }) async {
    try {
      var response = await _client.get(
          queryPath:
              '/admin/fee-details/admission-fee-invoices/$batchFeeInvoiceId/send-reminder');
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

  Future<Common?> writeOffFeesForAdmission(Map<String, dynamic> request,
      [int? batchFeesInvoiceId]) async {
    try {
      var response = await _client.post(
        postPath:
            '/admin/fee-details/admission-fee-invoices/$batchFeesInvoiceId/write-off',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> editFees(Map<String, dynamic> request,
      int? batchFeesInvoiceId, int? paymentId) async {
    try {
      var response = await _client.post(
        postPath:
            '/admin/fee-details/batch-fee-invoices/$batchFeesInvoiceId/payments/$paymentId',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> editAdmissionFees(Map<String, dynamic> request,
      int? admissionFeeInvoiceId, int? paymentId) async {
    try {
      var response = await _client.post(
        postPath:
            '/admin/fee-details/admission-fee-invoices/$admissionFeeInvoiceId/payments/$paymentId',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deleteFees(int? batchFeesInvoiceId, int? paymentId) async {
    try {
      var response = await _client.delete(
        queryPath:
            '/admin/fee-details/batch-fee-invoices/$batchFeesInvoiceId/payments/$paymentId',
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deleteAdmissionFees(
      int? admissionFeeInvoiceId, int? paymentId) async {
    try {
      var response = await _client.delete(
        queryPath:
            '/admin/fee-details/admission-fee-invoices/$admissionFeeInvoiceId/payments/$paymentId',
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchFeeInvoice?> batchFeeInvoiceDetails({
    required int? batchFeeInvoiceId,
  }) async {
    try {
      var response = await _client.get(
          queryPath:
              '/admin/fee-details/batch-fee-invoices/$batchFeeInvoiceId');
      return batchFeeInvoiceFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<AdmissionFeeInvoice?> admissionFeeInvoiceDetails({
    required int? batchFeeInvoiceId,
  }) async {
    try {
      var response = await _client.get(
          queryPath:
              '/admin/fee-details/admission-fee-invoices/$batchFeeInvoiceId');
      return admissionFeeInvoiceFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
