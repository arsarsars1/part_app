import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/admission_fee_invoice.dart';
import 'package:part_app/model/data_model/batch_fee_invoice.dart';
import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/fee_detail_history.dart';
import 'package:part_app/model/data_model/payment_method.dart';
import 'package:part_app/model/data_model/student_app_fee_detail_history.dart';
import 'package:part_app/model/service/admin/fee_details_service.dart';
import 'package:part_app/view_model/cubits.dart';

part 'fee_state.dart';

class FeeCubit extends Cubit<FeeState> {
  FeeCubit() : super(FeeInitial());
  final _feeService = FeeDetailsService();
  int page = 1;
  String? nextPageUrl = '';
  List<Datum> batchInvoice = [];
  List<Invoice> invoices = [];
  late Invoice invoice;
  late Datum student;
  PaymentMethodModel? paymentMethodModel;
  late Datum? batchFeeInvoice = Datum();
  late AdmissionFeeInvoiceClass? admissionFeeInvoice =
      AdmissionFeeInvoiceClass();

  void clean() {
    page = 1;
    nextPageUrl = '';
    batchInvoice.clear();
    emit(FeeInitial());
  }

  Future<void> addFees(int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      emit(AddingFees());
      Common? response = await _feeService.addFees(batchInvoiceId, data);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addFeesForTrainer(
      int trainerId, int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      emit(AddingFees());
      Common? response =
          await _feeService.addFeesForTrainer(trainerId, batchInvoiceId, data);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addFeesForManager(
      int managerId, int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      emit(AddingFees());
      Common? response =
          await _feeService.addFeesForManager(managerId, batchInvoiceId, data);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addAdvanceFees(Map<String, dynamic> data) async {
    try {
      emit(AddingFees());
      Common? response = await _feeService.addAdvanceFees(data);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addAdvanceFeesForTrainer(
      {Map<String, dynamic>? data, required int trainerId}) async {
    try {
      emit(AddingFees());
      Common? response =
          await _feeService.addAdvanceFeesForTrainer(data!, trainerId);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addAdvanceFeesForManager(
      {Map<String, dynamic>? data, required int managerId}) async {
    try {
      emit(AddingFees());
      Common? response =
          await _feeService.addAdvanceFeesForManager(data!, managerId);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addFeesForAdmission(
      int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      emit(AddingFees());
      Common? response =
          await _feeService.addFeesForAdmission(batchInvoiceId, data);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addFeesForAdmissionForTrainer(
      int trainerId, int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      emit(AddingFees());
      Common? response = await _feeService.addFeesForAdmissionForTrainer(
          trainerId, batchInvoiceId, data);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addFeesForAdmissionForManager(
      int managerId, int? batchInvoiceId, Map<String, dynamic> data) async {
    try {
      emit(AddingFees());
      Common? response = await _feeService.addFeesForAdmissionForManager(
          managerId, batchInvoiceId, data);

      if (response?.status == 1) {
        emit(AddedFees(response?.message ?? 'Fees Added'));
      } else {
        emit(AddFeesFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future getBatchInvoice(int? batchInvoiceId) async {
    emit(GettingBatchInvoice());
    BatchFeeInvoice? response = await _feeService.batchFeeInvoiceDetails(
        batchFeeInvoiceId: batchInvoiceId);
    if (response?.status == 1) {
      batchFeeInvoice = response?.batchFeeInvoice;
      emit(GotBatchInvoice());
    } else {
      emit(AddFeesFailed('Failed to add link.'));
    }
  }

  Future getPaymentMethod() async {
    emit(GettingPaymentMethod());
    PaymentMethodModel? response = await _feeService.getPaymentMethod();
    if (response?.status == 1) {
      paymentMethodModel = response;
      emit(GotPaymentMethod());
    } else {
      emit(GetPaymentMethodFailed('Failed to fetch payment method.'));
    }
  }

  Future getBatchInvoiceForTrainer(
      {int? batchInvoiceId, required int trainerId}) async {
    emit(GettingBatchInvoice());
    BatchFeeInvoice? response =
        await _feeService.batchFeeInvoiceDetailsForTrainer(
            batchFeeInvoiceId: batchInvoiceId, trainerId: trainerId);
    if (response?.status == 1) {
      batchFeeInvoice = response?.batchFeeInvoice;
      emit(GotBatchInvoice());
    } else {
      emit(AddFeesFailed('Failed to add link.'));
    }
  }

  Future getBatchInvoiceForManager(
      {int? batchInvoiceId, required int managerId}) async {
    emit(GettingBatchInvoice());
    BatchFeeInvoice? response =
        await _feeService.batchFeeInvoiceDetailsForManager(
            batchFeeInvoiceId: batchInvoiceId, managerId: managerId);
    if (response?.status == 1) {
      batchFeeInvoice = response?.batchFeeInvoice;
      emit(GotBatchInvoice());
    } else {
      emit(AddFeesFailed('Failed to add link.'));
    }
  }

  Future getAdmissionInvoice(int? batchInvoiceId) async {
    emit(GettingBatchInvoice());
    AdmissionFeeInvoice? response = await _feeService
        .admissionFeeInvoiceDetails(batchFeeInvoiceId: batchInvoiceId);
    if (response?.status == 1) {
      admissionFeeInvoice = response?.admissionFeeInvoice;
      emit(GotBatchInvoice());
    } else {
      emit(AddFeesFailed('Failed to add link.'));
    }
  }

  Future getAdmissionInvoiceForTrainer(
      int trainerId, int? batchInvoiceId) async {
    emit(GettingBatchInvoice());
    AdmissionFeeInvoice? response =
        await _feeService.admissionFeeInvoiceDetailForTrainer(
            trainerId: trainerId, batchFeeInvoiceId: batchInvoiceId);
    if (response?.status == 1) {
      admissionFeeInvoice = response?.admissionFeeInvoice;
      emit(GotBatchInvoice());
    } else {
      emit(AddFeesFailed('Failed to add link.'));
    }
  }

  Future getAdmissionInvoiceForManager(
      int managerId, int? batchInvoiceId) async {
    emit(GettingBatchInvoice());
    AdmissionFeeInvoice? response =
        await _feeService.admissionFeeInvoiceDetailForManager(
            managerId: managerId, batchFeeInvoiceId: batchInvoiceId);
    if (response?.status == 1) {
      admissionFeeInvoice = response?.admissionFeeInvoice;
      emit(GotBatchInvoice());
    } else {
      emit(AddFeesFailed('Failed to add link.'));
    }
  }

  Future getFeeDetails({
    String? searchQuery,
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    String? paymentStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    try {
      BatchFeeInvoiceList? response = await _feeService.feeDetails(
        branchId: branchId,
        batchId: batchId,
        month: month,
        year: year,
        feeType: feeType,
        searchQuery: searchQuery,
        pageNo: page,
        paymentStatus: paymentStatus,
      );

      if (response?.status == 1) {
        nextPageUrl = response?.batchFeeInvoices?.nextPageUrl;
        if (nextPageUrl != null) {
          page++;
        }
        batchInvoice.addAll(response?.batchFeeInvoices?.data ?? []);
        emit(FeeFetched(moreItems: nextPageUrl != null));
      } else {
        emit(FeeDetailsFailed(response?.message ?? ""));
      }
    } catch (e) {
      log(e.toString());
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getFeeDetailsForTrainer({
    required int trainerId,
    String? searchQuery,
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    try {
      BatchFeeInvoiceList? response = await _feeService.feeDetailsForTrainer(
        trainerId: trainerId,
        branchId: branchId,
        batchId: batchId,
        month: month,
        year: year,
        feeType: feeType,
        searchQuery: searchQuery,
        pageNo: page,
      );

      if (response?.status == 1) {
        nextPageUrl = response?.batchFeeInvoices?.nextPageUrl;
        if (nextPageUrl != null) {
          page++;
        }
        batchInvoice.addAll(response?.batchFeeInvoices?.data ?? []);
        emit(FeeFetched(moreItems: nextPageUrl != null));
      }
    } catch (e) {
      log(e.toString());
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getFeeDetailsForManager({
    required int managerId,
    String? searchQuery,
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    try {
      BatchFeeInvoiceList? response = await _feeService.feeDetailsForManager(
        managerId: managerId,
        branchId: branchId,
        batchId: batchId,
        month: month,
        year: year,
        feeType: feeType,
        searchQuery: searchQuery,
        pageNo: page,
      );

      if (response?.status == 1) {
        nextPageUrl = response?.batchFeeInvoices?.nextPageUrl;
        if (nextPageUrl != null) {
          page++;
        }
        batchInvoice.addAll(response?.batchFeeInvoices?.data ?? []);
        emit(FeeFetched(moreItems: nextPageUrl != null));
      }
    } catch (e) {
      log(e.toString());
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getStudentFeeDetails({
    String? searchQuery,
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    int? studentId,
    String? paymentStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    FeeDetailHistory? response = await _feeService.studentFeeDetails(
      month: month,
      year: year,
      feeType: feeType,
      searchQuery: searchQuery,
      studentId: studentId,
      paymentStatus: paymentStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.feeDetailHistory?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      batchInvoice.addAll(response?.feeDetailHistory?.data ?? []);
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getStudentFeeDetailsForTrainer({
    required int trainerId,
    String? searchQuery,
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    int? studentId,
    String? paymentStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    FeeDetailHistory? response = await _feeService.studentFeeDetailsForTrainer(
      trainerId: trainerId,
      month: month,
      year: year,
      feeType: feeType,
      searchQuery: searchQuery,
      studentId: studentId,
      paymentStatus: paymentStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.feeDetailHistory?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      batchInvoice.addAll(response?.feeDetailHistory?.data ?? []);
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getStudentFeeDetailsForManager({
    required int managerId,
    String? searchQuery,
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    int? studentId,
    String? paymentStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    FeeDetailHistory? response = await _feeService.studentFeeDetailsForManager(
      managerId: managerId,
      month: month,
      year: year,
      feeType: feeType,
      searchQuery: searchQuery,
      studentId: studentId,
      paymentStatus: paymentStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.feeDetailHistory?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      batchInvoice.addAll(response?.feeDetailHistory?.data ?? []);
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getStudentAppFeeDetails({
    String? searchQuery,
    int? branchId,
    int? batchId,
    int? month,
    int? year,
    String? feeType,
    int? studentId,
    String? paymentStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      invoices.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    StudentAppFeeDetailHistory? response =
        await _feeService.studentAppFeeDetails(
      month: month,
      year: year,
      feeType: feeType,
      searchQuery: searchQuery,
      studentId: studentId,
      paymentStatus: paymentStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.batchFeeInvoices?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      invoices.addAll(response?.batchFeeInvoices?.data ?? []);
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getAdmissionFeeDetails({
    String? searchQuery,
    String? feeType,
    int? studentId,
    String? paymentStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    FeeDetailHistory? response = await _feeService.admissionFeeDetails(
      feeType: feeType,
      searchQuery: searchQuery,
      studentId: studentId,
      paymentStatus: paymentStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.feeDetailHistory?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      batchInvoice.addAll(response?.feeDetailHistory?.data ?? []);
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getAdmissionFeeDetailsTrainerApp({
    required int trainerId,
    String? searchQuery,
    String? feeType,
    int? studentId,
    String? paymentStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    FeeDetailHistory? response =
        await _feeService.admissionFeeDetailsForTrainerApp(
      trainerId: trainerId,
      feeType: feeType,
      searchQuery: searchQuery,
      studentId: studentId,
      paymentStatus: paymentStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.feeDetailHistory?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      batchInvoice.addAll(response?.feeDetailHistory?.data ?? []);
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getAdmissionFeeDetailsManagerApp({
    required int managerId,
    String? searchQuery,
    String? feeType,
    int? studentId,
    String? paymentStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      batchInvoice.clear();
      emit(FetchingFee());
    } else {
      emit(FetchingFee(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FeeFetched());
      return;
    }

    FeeDetailHistory? response =
        await _feeService.admissionFeeDetailsForManagerApp(
      managerId: managerId,
      feeType: feeType,
      searchQuery: searchQuery,
      studentId: studentId,
      paymentStatus: paymentStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.feeDetailHistory?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      batchInvoice.addAll(response?.feeDetailHistory?.data ?? []);
      emit(FeeFetched(moreItems: nextPageUrl != null));
    }
  }

  Future sendReminder({required int? batchFeeInvoiceId}) async {
    emit(FeeReminderSending());
    try {
      Common? response =
          await _feeService.sendReminder(batchFeeInvoiceId: batchFeeInvoiceId);
      if (response?.status == 1) {
        emit(FeeReminderSent(response?.message ?? 'Message sent'));
      } else {
        emit(FeeReminderSentFailed(
            response?.message ?? 'Failed to save attendance.'));
      }
    } catch (e) {
      emit(FeeReminderSentFailed('Failed to save attendance.'));
    }
  }

  Future sendReminderForTrainer(
      {required int? batchFeeInvoiceId, required int trainerId}) async {
    emit(FeeReminderSending());
    try {
      Common? response = await _feeService.sendReminderForTrainer(
          batchFeeInvoiceId: batchFeeInvoiceId, trainerId: trainerId);
      if (response?.status == 1) {
        emit(FeeReminderSent(response?.message ?? 'Message sent'));
      } else {
        emit(FeeReminderSentFailed(
            response?.message ?? 'Failed to save attendance.'));
      }
    } catch (e) {
      emit(FeeReminderSentFailed('Failed to save attendance.'));
    }
  }

  Future sendReminderForManager(
      {required int? batchFeeInvoiceId, required int managerId}) async {
    emit(FeeReminderSending());
    try {
      Common? response = await _feeService.sendReminderForManager(
          batchFeeInvoiceId: batchFeeInvoiceId, managerId: managerId);
      if (response?.status == 1) {
        emit(FeeReminderSent(response?.message ?? 'Message sent'));
      } else {
        emit(FeeReminderSentFailed(
            response?.message ?? 'Failed to save attendance.'));
      }
    } catch (e) {
      emit(FeeReminderSentFailed('Failed to save attendance.'));
    }
  }

  Future sendReminderForAdmission({required int? batchFeeInvoiceId}) async {
    emit(FeeReminderSending());
    try {
      Common? response = await _feeService.sendReminderForAdmission(
          batchFeeInvoiceId: batchFeeInvoiceId);
      if (response?.status == 1) {
        emit(FeeReminderSent(response?.message ?? 'Message sent'));
      } else {
        emit(FeeReminderSentFailed(
            response?.message ?? 'Failed to save attendance.'));
      }
    } catch (e) {
      emit(FeeReminderSentFailed('Failed to save attendance.'));
    }
  }

  Future sendReminderForAdmissionForTrainer(
      {required int? batchFeeInvoiceId, required int trainerId}) async {
    emit(FeeReminderSending());
    try {
      Common? response = await _feeService.sendReminderForAdmissionForTrainer(
          batchFeeInvoiceId: batchFeeInvoiceId, trainerId: trainerId);
      if (response?.status == 1) {
        emit(FeeReminderSent(response?.message ?? 'Message sent'));
      } else {
        emit(FeeReminderSentFailed(
            response?.message ?? 'Failed to save attendance.'));
      }
    } catch (e) {
      emit(FeeReminderSentFailed('Failed to save attendance.'));
    }
  }

  Future sendReminderForAdmissionForManager(
      {required int? batchFeeInvoiceId, required int managerId}) async {
    emit(FeeReminderSending());
    try {
      Common? response = await _feeService.sendReminderForAdmissionForManager(
          batchFeeInvoiceId: batchFeeInvoiceId, managerId: managerId);
      if (response?.status == 1) {
        emit(FeeReminderSent(response?.message ?? 'Message sent'));
      } else {
        emit(FeeReminderSentFailed(
            response?.message ?? 'Failed to save attendance.'));
      }
    } catch (e) {
      emit(FeeReminderSentFailed('Failed to save attendance.'));
    }
  }

  Future writeOffFees(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId}) async {
    emit(WritingOff());
    Common? response = await _feeService.writeOffFees(
      request,
      batchFeeInvoiceId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(WrittenOff(response?.message ?? 'Fees written off'));
    } else {
      emit(WriteOffFailed(response?.message ?? 'Failed to write off'));
    }
  }

  Future writeOffFeesForManager(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId, required int managerId}) async {
    emit(WritingOff());
    Common? response = await _feeService.writeOffFeesForManager(
        request, batchFeeInvoiceId,
        managerId: managerId);
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(WrittenOff(response?.message ?? 'Fees written off'));
    } else {
      emit(WriteOffFailed(response?.message ?? 'Failed to write off'));
    }
  }

  Future writeOffFeesForTrainer(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId, required int trainerId}) async {
    emit(WritingOff());
    Common? response = await _feeService.writeOffFeesForTrainer(
      request,
      batchFeeInvoiceId,
      trainerId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(WrittenOff(response?.message ?? 'Fees written off'));
    } else {
      emit(WriteOffFailed(response?.message ?? 'Failed to write off'));
    }
  }

  Future writeOffFeesAdmissionFee(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId}) async {
    emit(WritingOff());
    Common? response = await _feeService.writeOffFeesForAdmission(
      request,
      batchFeeInvoiceId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(WrittenOff(response?.message ?? 'Fees written off'));
    } else {
      emit(WriteOffFailed(response?.message ?? 'Failed to write off'));
    }
  }

  Future writeOffFeesAdmissionFeeForTrainer(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId, required int trainerId}) async {
    emit(WritingOff());
    Common? response = await _feeService.writeOffFeesForAdmissionForTrainer(
      request,
      batchFeeInvoiceId,
      trainerId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(WrittenOff(response?.message ?? 'Fees written off'));
    } else {
      emit(WriteOffFailed(response?.message ?? 'Failed to write off'));
    }
  }

  Future writeOffFeesAdmissionFeeForManager(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId, required int managerId}) async {
    emit(WritingOff());
    Common? response = await _feeService.writeOffFeesForAdmissionForManager(
      request,
      batchFeeInvoiceId,
      managerId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(WrittenOff(response?.message ?? 'Fees written off'));
    } else {
      emit(WriteOffFailed(response?.message ?? 'Failed to write off'));
    }
  }

  Future deleteFees(
      {required int? batchFeeInvoiceId, required int? paymentId}) async {
    emit(DeletingFees());
    Common? response = await _feeService.deleteFees(
      batchFeeInvoiceId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(FeesDeleted(response?.message ?? 'Fees Deleted'));
    } else {
      emit(DeleteFeesFailed(response?.message ?? 'Fees Deletion Failed'));
    }
  }

  Future deleteFeesForTrainer(
      {required int? batchFeeInvoiceId,
      required int? paymentId,
      required int? trainerId}) async {
    emit(DeletingFees());
    Common? response = await _feeService.deleteFeesForTrainer(
      batchFeeInvoiceId,
      paymentId,
      trainerId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(FeesDeleted(response?.message ?? 'Fees Deleted'));
    } else {
      emit(DeleteFeesFailed(response?.message ?? 'Fees Deletion Failed'));
    }
  }

  Future deleteFeesForManager(
      {required int? batchFeeInvoiceId,
      required int? paymentId,
      required int? managerId}) async {
    emit(DeletingFees());
    Common? response = await _feeService.deleteFeesForManager(
      batchFeeInvoiceId,
      paymentId,
      managerId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(FeesDeleted(response?.message ?? 'Fees Deleted'));
    } else {
      emit(DeleteFeesFailed(response?.message ?? 'Fees Deletion Failed'));
    }
  }

  Future deleteAdmissionFees(
      {required int? admissionFeeInvoiceId, required int? paymentId}) async {
    emit(DeletingFees());
    Common? response = await _feeService.deleteAdmissionFees(
      admissionFeeInvoiceId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(FeesDeleted(response?.message ?? 'Fees Deleted'));
    } else {
      emit(DeleteFeesFailed(response?.message ?? 'Fees Deletion Failed'));
    }
  }

  Future deleteAdmissionFeesForTrainer(
      {required int trainerId,
      required int? admissionFeeInvoiceId,
      required int? paymentId}) async {
    emit(DeletingFees());
    Common? response = await _feeService.deleteAdmissionFeesForTrainer(
      trainerId,
      admissionFeeInvoiceId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(FeesDeleted(response?.message ?? 'Fees Deleted'));
    } else {
      emit(DeleteFeesFailed(response?.message ?? 'Fees Deletion Failed'));
    }
  }

  Future deleteAdmissionFeesForManager(
      {required int managerId,
      required int? admissionFeeInvoiceId,
      required int? paymentId}) async {
    emit(DeletingFees());
    Common? response = await _feeService.deleteAdmissionFeesForManager(
      managerId,
      admissionFeeInvoiceId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(FeesDeleted(response?.message ?? 'Fees Deleted'));
    } else {
      emit(DeleteFeesFailed(response?.message ?? 'Fees Deletion Failed'));
    }
  }

  Future editFees(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId, required int? paymentId}) async {
    emit(EditingFee());
    Common? response = await _feeService.editFees(
      request,
      batchFeeInvoiceId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(EdittedFee(response?.message ?? 'Fees Editted'));
    } else {
      emit(EditFeesFailed(response?.message ?? 'Failed to edit'));
    }
  }

  Future editFeesForTrainer(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId,
      required int? paymentId,
      required int trainerId}) async {
    emit(EditingFee());
    Common? response = await _feeService.editFeesForTrainer(
        request, batchFeeInvoiceId, paymentId, trainerId);
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(EdittedFee(response?.message ?? 'Fees Editted'));
    } else {
      emit(EditFeesFailed(response?.message ?? 'Failed to edit'));
    }
  }

  Future editFeesForManager(Map<String, dynamic> request,
      {required int? batchFeeInvoiceId,
      required int? paymentId,
      required int managerId}) async {
    emit(EditingFee());
    Common? response = await _feeService.editFeesForManager(
        request, batchFeeInvoiceId, paymentId, managerId);
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(EdittedFee(response?.message ?? 'Fees Editted'));
    } else {
      emit(EditFeesFailed(response?.message ?? 'Failed to edit'));
    }
  }

  Future editAdmissionFees(Map<String, dynamic> request,
      {required int? admissionFeeInvoiceId, required int? paymentId}) async {
    emit(EditingFee());
    Common? response = await _feeService.editAdmissionFees(
      request,
      admissionFeeInvoiceId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(EdittedFee(response?.message ?? 'Fees Editted'));
    } else {
      emit(EditFeesFailed(response?.message ?? 'Failed to edit'));
    }
  }

  Future editAdmissionFeesForTrainer(
      int trainerId, Map<String, dynamic> request,
      {required int? admissionFeeInvoiceId, required int? paymentId}) async {
    emit(EditingFee());
    Common? response = await _feeService.editAdmissionFeesForTrainer(
      trainerId,
      request,
      admissionFeeInvoiceId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(EdittedFee(response?.message ?? 'Fees Editted'));
    } else {
      emit(EditFeesFailed(response?.message ?? 'Failed to edit'));
    }
  }

  Future editAdmissionFeesForManager(
      int managerId, Map<String, dynamic> request,
      {required int? admissionFeeInvoiceId, required int? paymentId}) async {
    emit(EditingFee());
    Common? response = await _feeService.editAdmissionFeesForManagerId(
      managerId,
      request,
      admissionFeeInvoiceId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(EdittedFee(response?.message ?? 'Fees Editted'));
    } else {
      emit(EditFeesFailed(response?.message ?? 'Failed to edit'));
    }
  }
}
