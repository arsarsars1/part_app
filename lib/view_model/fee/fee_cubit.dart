import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/fee_response.dart';
import 'package:part_app/model/service/admin/fee_details_service.dart';
import 'package:part_app/view_model/cubits.dart';

part 'fee_state.dart';

class FeeCubit extends Cubit<FeeState> {
  FeeCubit() : super(FeeInitial());
  final _feeService = FeeDetailsService();
  int page = 1;
  String? nextPageUrl = '';
  List<Datum> batchInvoice = [];
  late Datum student;

  void clean() {
    page = 1;
    nextPageUrl = '';
    batchInvoice.clear();
    emit(FeeInitial());
  }

  Future getFeeDetails({
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

    FeeResponse? response = await _feeService.feeDetails(
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
      batchInvoice = response?.batchFeeInvoices?.data ?? [];
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
            response?.message ?? 'Failed to save attendence.'));
      }
    } catch (e) {
      emit(FeeReminderSentFailed('Failed to save attendence.'));
    }
  }
}
