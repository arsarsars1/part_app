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

  Future<Common?> addFeesForTrainer(
      int trainerId, int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      var response = await _client.post(
        postPath:
            '/trainers/$trainerId/fee-details/batch-fee-invoices/$batchInvoiceId/payments',
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

  Future<Common?> addAdvanceFeesForTrainer(
      Map<String, dynamic> data, int? trainerId) async {
    try {
      var response = await _client.post(
        postPath:
            '/trainers/$trainerId/fee-details/batch-fee-invoices/advance-payment',
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

  Future<Common?> addFeesForAdmissionForTrainer(
      int trainerId, int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      var response = await _client.post(
        postPath:
            '/trainers/$trainerId/fee-details/admission-fee-invoices/$batchInvoiceId/payments',
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
      String queryPath = '/admin/fee-details/batch-fee-invoices?';
      if (branchId != null) {
        queryPath += 'branch_id=$branchId';
        if (batchId != null) {
          queryPath += '&batch_id=$batchId';
        }
        if ((feeType != null || feeType != 'all') &&
            (feeType == 'class' || feeType == 'monthly')) {
          queryPath += '&fee_type=$feeType';
          if (searchQuery == '' || searchQuery == null) {
            queryPath += '&page=$pageNo';
          } else {
            queryPath += '&search=$searchQuery';
            queryPath += '&page=$pageNo';
          }
        } else {
          if (searchQuery == '' || searchQuery == null) {
            queryPath += '&page=$pageNo';
          } else {
            queryPath += '&search=$searchQuery';
            queryPath += '&page=$pageNo';
          }
        }
      } else {
        if ((feeType != null || feeType != 'all') &&
            (feeType == 'class' || feeType == 'monthly')) {
          queryPath += 'fee_type=$feeType';
          if (searchQuery == '' || searchQuery == null) {
            queryPath += '&page=$pageNo';
          } else {
            queryPath += '&search=$searchQuery';
            queryPath += '&page=$pageNo';
          }
        } else {
          if (searchQuery == '' || searchQuery == null) {
            queryPath += 'page=$pageNo';
          } else {
            queryPath += 'search=$searchQuery';
            queryPath += '&page=$pageNo';
          }
        }
      }

      var response = await _client.get(queryPath: queryPath);
      return batchFeeInvoiceListFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<BatchFeeInvoiceList?> feeDetailsForTrainer({
    int? trainerId,
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    String? searchQuery,
    required int pageNo,
  }) async {
    try {
      String queryPath = '/trainers/$trainerId/fee-details/batch-fee-invoices?';
      if (branchId != null) {
        queryPath += 'branch_id=$branchId';
        if (batchId != null) {
          queryPath += '&batch_id=$batchId';
        }
        if ((feeType != null || feeType != 'all') &&
            (feeType == 'class' || feeType == 'monthly')) {
          queryPath += '&fee_type=$feeType';
          if (searchQuery == '' || searchQuery == null) {
            queryPath += '&page=$pageNo';
          } else {
            queryPath += '&search=$searchQuery';
            queryPath += '&page=$pageNo';
          }
        } else {
          if (searchQuery == '' || searchQuery == null) {
            queryPath += '&page=$pageNo';
          } else {
            queryPath += '&search=$searchQuery';
            queryPath += '&page=$pageNo';
          }
        }
      } else {
        if ((feeType != null || feeType != 'all') &&
            (feeType == 'class' || feeType == 'monthly')) {
          queryPath += 'fee_type=$feeType';
          if (searchQuery == '' || searchQuery == null) {
            queryPath += '&page=$pageNo';
          } else {
            queryPath += '&search=$searchQuery';
            queryPath += '&page=$pageNo';
          }
        } else {
          if (searchQuery == '' || searchQuery == null) {
            queryPath += 'page=$pageNo';
          } else {
            queryPath += 'search=$searchQuery';
            queryPath += '&page=$pageNo';
          }
        }
      }
      var response = await _client.get(queryPath: queryPath);
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
              : feeType == 'all'
                  ? paymentStatus == 'all'
                      ? '/admin/students/$studentId/fee-details?page=$pageNo'
                      : '/admin/students/$studentId/fee-details?payment_status=$paymentStatus&page=$pageNo'
                  : paymentStatus == 'all'
                      ? '/admin/students/$studentId/fee-details?fee_type=$feeType&page=$pageNo'
                      : '/admin/students/$studentId/fee-details?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo');
      return feeDetailHistoryFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<FeeDetailHistory?> studentFeeDetailsForTrainer({
    int? trainerId,
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
                      ? '/trainers/$trainerId/students/$studentId/fee-details/$year/$month?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                      : '/trainers/$trainerId/students/$studentId/fee-details/$year/$month?fee_type=$feeType&page=$pageNo'
                  : paymentStatus != 'all'
                      ? '/trainers/$trainerId/students/$studentId/fee-details/$year?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                      : '/trainers/$trainerId/students/$studentId/fee-details/$year?fee_type=$feeType&page=$pageNo'
              : paymentStatus != 'all'
                  ? '/trainers/$trainerId/students/$studentId/fee-details?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                  : '/trainers/$trainerId/students/$studentId/fee-details?fee_type=$feeType&page=$pageNo');
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
                      ? '/students/$studentId/fee-details/batch-fee-invoices?year=$year&month=$month&fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                      : '/students/$studentId/fee-details/batch-fee-invoices?year=$year&month=$month&fee_type=$feeType&page=$pageNo'
                  : paymentStatus != 'all'
                      ? '/students/$studentId/fee-details/batch-fee-invoices?year=$year&fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
                      : '/students/$studentId/fee-details/batch-fee-invoices?year=$year&fee_type=$feeType&page=$pageNo'
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
              ? feeType == null || feeType == 'all'
                  ? '/admin/students/$studentId/admission-fee-details?payment_status=$paymentStatus&page=$pageNo'
                  : '/admin/students/$studentId/admission-fee-details?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
              : feeType == null || feeType == 'all'
                  ? '/admin/students/$studentId/admission-fee-details?page=$pageNo'
                  : '/admin/students/$studentId/admission-fee-details?fee_type=$feeType&page=$pageNo');
      return feeDetailHistoryFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<FeeDetailHistory?> admissionFeeDetailsForTrainerApp({
    required int trainerId,
    String? feeType,
    String? searchQuery,
    int? studentId,
    String? paymentStatus,
    required int pageNo,
  }) async {
    try {
      var response = await _client.get(
          queryPath: paymentStatus != 'all'
              ? feeType == null || feeType == 'all'
                  ? '/trainers/$trainerId/students/$studentId/admission-fee-details?payment_status=$paymentStatus&page=$pageNo'
                  : '/trainers/$trainerId/students/$studentId/admission-fee-details?fee_type=$feeType&payment_status=$paymentStatus&page=$pageNo'
              : feeType == null || feeType == 'all'
                  ? '/trainers/$trainerId/students/$studentId/admission-fee-details?page=$pageNo'
                  : '/trainers/$trainerId/students/$studentId/admission-fee-details?fee_type=$feeType&page=$pageNo');
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

  Future<Common?> sendReminderForTrainer({
    required int? batchFeeInvoiceId,
    required int trainerId,
  }) async {
    try {
      var response = await _client.get(
          queryPath:
              '/trainers/$trainerId/fee-details/batch-fee-invoices/$batchFeeInvoiceId/send-reminder');
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

  Future<Common?> sendReminderForAdmissionForTrainer({
    required int? batchFeeInvoiceId,
    required int trainerId,
  }) async {
    try {
      var response = await _client.get(
          queryPath:
              '/trainers/$trainerId/fee-details/admission-fee-invoices/$batchFeeInvoiceId/send-reminder');
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

  Future<Common?> writeOffFeesForTrainer(Map<String, dynamic> request,
      [int? batchFeesInvoiceId, int? trainerId]) async {
    try {
      var response = await _client.post(
        postPath:
            '/trainers/$trainerId/fee-details/batch-fee-invoices/$batchFeesInvoiceId/write-off',
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

  Future<Common?> writeOffFeesForAdmissionForTrainer(
      Map<String, dynamic> request,
      [int? batchFeesInvoiceId,
      int? trainerId]) async {
    try {
      var response = await _client.post(
        postPath:
            '/trainers/$trainerId/fee-details/admission-fee-invoices/$batchFeesInvoiceId/write-off',
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

  Future<Common?> editFeesForTrainer(
    Map<String, dynamic> request,
    int? batchFeesInvoiceId,
    int? paymentId,
    int? trainerId,
  ) async {
    try {
      var response = await _client.post(
        postPath:
            '/trainers/$trainerId/fee-details/batch-fee-invoices/$batchFeesInvoiceId/payments/$paymentId',
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

  Future<Common?> editAdmissionFeesForTrainer(
      int trainerId,
      Map<String, dynamic> request,
      int? admissionFeeInvoiceId,
      int? paymentId) async {
    try {
      var response = await _client.post(
        postPath:
            '/trainers/$trainerId/fee-details/admission-fee-invoices/$admissionFeeInvoiceId/payments/$paymentId',
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

  Future<Common?> deleteFeesForTrainer(
      int? batchFeesInvoiceId, int? paymentId, int? trainerId) async {
    try {
      var response = await _client.delete(
        queryPath:
            '/trainers/$trainerId/fee-details/batch-fee-invoices/$batchFeesInvoiceId/payments/$paymentId',
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

  Future<Common?> deleteAdmissionFeesForTrainer(
      int trainerId, int? admissionFeeInvoiceId, int? paymentId) async {
    try {
      var response = await _client.delete(
        queryPath:
            '/trainers/$trainerId/fee-details/admission-fee-invoices/$admissionFeeInvoiceId/payments/$paymentId',
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

  Future<BatchFeeInvoice?> batchFeeInvoiceDetailsForTrainer({
    required int? batchFeeInvoiceId,
    required int trainerId,
  }) async {
    try {
      var response = await _client.get(
          queryPath:
              '/trainers/$trainerId/fee-details/batch-fee-invoices/$batchFeeInvoiceId');
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

  Future<AdmissionFeeInvoice?> admissionFeeInvoiceDetailForTrainer({
    required int trainerId,
    required int? batchFeeInvoiceId,
  }) async {
    try {
      var response = await _client.get(
          queryPath:
              '/trainers/$trainerId/fee-details/admission-fee-invoices/$batchFeeInvoiceId');
      return admissionFeeInvoiceFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
